import numpy as np
from threading import Thread
import PyEW, time, json, datetime
import paho.mqtt.client as mqtt
from queue import Queue

class Mqtt2Ring():

  def __init__(self):
    
    # Create a thread for the Module
    self.myThread = Thread(target=self.run)
    # Start an EW Module with parent ring 1000, mod_id 8, inst_id 141, heartbeat 30s, debug = False (MODIFY THIS!)
    self.mqtt2ring = PyEW.EWModule(1000, 9, 141, 30.0, False) 
    # Add our Output ring as Ring 0
    self.mqtt2ring.add_ring(1000)
    self.q=Queue(maxsize = 10000)

    # 建立連線（接收到 CONNACK）的回呼函數
    def on_connect(client, userdata, flags, rc):
        print("Connected with result code " + str(rc))
        # 每次連線之後，重新設定訂閱主題
        client.subscribe('ew-waves', qos=0)

    # 接收訊息（接收到 PUBLISH）的回呼函數
    def on_message(client, userdata, msg):
        if self.q.full() is False:
            msg = str(msg.payload.decode("utf-8"))
            self.q.put(json.loads(msg))

    self.client = mqtt.Client()
    self.client.on_connect = on_connect
    self.client.on_message = on_message
    # 設定登入帳號密碼
    self.client.username_pw_set("rsd2","rsd16888")
    #self.client.tls_set()
    self.client.connect("emqx1", 1883)
    self.client.loop_start()
    
    # Allow it to start
    self.runs = True
      
  def run(self):
    
    while self.mqtt2ring.mod_sta() and self.runs:
        if self.q.empty() is True:
            time.sleep(0.001)
        else:
            wave =self.q.get()
            ## Change the data from list to numpy array
            wf = wave['data']
            dt = np.dtype(wave['datatype'])
            wave['data'] = np.array(wf, dtype=dt)
            ## Insert wave in to ring
            self.mqtt2ring.put_wave(0, wave)
            print (wave)

    self.mqtt2ring.goodbye()
    self.client.loop_stop()
    self.client.disconnect()
    quit()
    print ("Exiting")
      
  def start(self):
    self.myThread.start()
    
  def stop(self):
    self.runs = False

def main():
  print('Start')
  mainStart =  Mqtt2Ring()
  mainStart.start()
  #mainStart.run() 

if __name__ == '__main__':
  main()