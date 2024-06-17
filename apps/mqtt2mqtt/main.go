package main

import (
	"crypto/tls"
	"crypto/x509"
	"fmt"
	"os"
	"runtime"
	"time"

	"github.com/BurntSushi/toml"
	mqtt "github.com/eclipse/paho.mqtt.golang"
)

// 全域變數，保存轉發客戶端
var forwardClient mqtt.Client
var config Config
var timeout = 250

type Config struct {
	ReceiveOpts struct {
		Broker   string
		ClientID string
		Username string
		Password string
	} `toml:"receiveOpts"`
	ForwardOpts struct {
		Broker   string
		ClientID string
		Username string
		Password string
		Topic    string
	} `toml:"forwardOpts"`
}

// 回調函數，處理接收到的消息並轉發
func messageHandler(client mqtt.Client, msg mqtt.Message) {
	fmt.Printf("Received message: %s from topic: %s\n", msg.Payload(), msg.Topic())

	// 將消息轉發到另一台伺服器
	token := forwardClient.Publish(config.ForwardOpts.Topic, 0, false, msg.Payload())
	token.Wait()
	if token.Error() != nil {
		fmt.Printf("Error publishing to forward server: %v\n", token.Error())
	}
}

func main() {
	//讀取並解析Config
	if _, err := toml.DecodeFile("config.toml", &config); err != nil {
		fmt.Printf("Error decoding TOML file: %v\n", err)
		os.Exit(1)
	}

	certpool := x509.NewCertPool()                     //創建伺服器證書
	pemCerts, err := os.ReadFile("path/to/server.crt") //讀取路徑.crt，存放pemCerts
	if err != nil {
	}
	certpool.AppendCertsFromPEM(pemCerts) //將證書以PEM格式儲存certpool

	tlsConfig := &tls.Config{ //創建新的TLS配置對象
		RootCAs:            certpool, //將證書給予RootCAs
		InsecureSkipVerify: true,     //跳過對伺服器證書的驗證 true
	}

	// 設置接收伺服器的 MQTT 客戶端選項
	receiveOpts := mqtt.NewClientOptions()
	receiveOpts.AddBroker(config.ReceiveOpts.Broker)
	receiveOpts.SetClientID(config.ReceiveOpts.ClientID)
	receiveOpts.SetUsername(config.ReceiveOpts.Username)
	receiveOpts.SetPassword(config.ReceiveOpts.Password)
	receiveOpts.SetDefaultPublishHandler(messageHandler)
	receiveOpts.SetTLSConfig(tlsConfig)

	// 創建接收伺服器的 MQTT 客戶端
	receiveClient := mqtt.NewClient(receiveOpts)
	if token := receiveClient.Connect(); token.Wait() && token.Error() != nil {
		fmt.Printf("Error connecting to receive broker: %v\n", token.Error())
		os.Exit(1)
	}

	// 設置轉發伺服器的 MQTT 客戶端選項
	forwardOpts := mqtt.NewClientOptions()
	forwardOpts.AddBroker(config.ForwardOpts.Broker)
	forwardOpts.SetClientID(config.ForwardOpts.ClientID)
	forwardOpts.SetUsername(config.ForwardOpts.Username)
	forwardOpts.SetPassword(config.ForwardOpts.Password)

	// 創建轉發伺服器的 MQTT 客戶端
	forwardClient = mqtt.NewClient(forwardOpts)
	if token := forwardClient.Connect(); token.Wait() && token.Error() != nil {
		fmt.Printf("Error connecting to forward broker: %v\n", token.Error())
		os.Exit(1)
	}

	// 訂閱接收伺服器的主題
	if token := receiveClient.Subscribe(config.ForwardOpts.Topic, 1, messageHandler); token.Wait() && token.Error() != nil {
		fmt.Printf("Error subscribing to topic on receive broker: %v\n", token.Error())
		os.Exit(1)
	}

	// 定期運行垃圾收集器來釋放未使用的記憶體
	go func() {
		for {
			time.Sleep(24 * time.Hour)
			runtime.GC()
		}
	}()

	for {
	}

	// 斷開與伺服器的連接
	//receiveClient.Disconnect(uint(timeout))
	//forwardClient.Disconnect(uint(timeout))
}
