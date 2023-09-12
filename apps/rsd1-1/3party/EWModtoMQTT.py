# pip3 install paho-mqtt

import numpy as np
from threading import Thread
import PyEW, time, json, datetime
import paho.mqtt.client as mqtt

class Ring2MQTT():

  def __init__(self):
    
    # Create a thread for the Module
    self.myThread = Thread(target=self.run)
    self.client = mqtt.Client()

    # 設定登入帳號密碼
    self.client.username_pw_set("rsd1","rsd1688")
    
    #如果使用MQTTS 加密連線（SSL/TLS）
    #self.client.tls_set()

    # 設定連線資訊(IP or domain name , Port)
    self.client.connect("104.199.129.50", 1883)
    
    # Start an EW Module with parent ring 1000, mod_id 8, inst_id 141, heartbeat 30s, debug = False (MODIFY THIS!)
    self.ring2mqtt = PyEW.EWModule(1000, 2, 255, 30.0, False) 
    
    
    # Add our Input ring as Ring 0
    self.ring2mqtt.add_ring(1000)
    
    # Allow it to start
    self.runs = True
    
  def push_wave(self):
    # Fetch a wave from Ring 0
    wave = self.ring2mqtt.get_wave(0)
    
    print(wave)

    # if wave is empty return
    if wave == {}: 
      return
      
    # Generate the time array
    time_array = np.zeros(wave['data'].size)
    time_skip = 1/wave['samprate']
    for i in range(0, wave['data'].size):
        time_array[i] = (wave['startt'] + (time_skip*i)) * 1000
    time_array = np.array(time_array, dtype='datetime64[ms]')
    
    # Change the time array from numpy to string, data from numpy to string
    # Could use: time_array.tolist() but nodejs is botching the ISOString input
    # Could use:  np.array2string(time_array, max_line_width=4096) but nodejs botches that too
    wave['times'] = time_array.astype('uint64').tolist()
    wave['data']= wave['data'].tolist()
    wave['time'] = str(datetime.datetime.utcnow())
     
    # Store (Publish) to mqtt server
    self.client.publish("ew-waves", json.dumps(wave))

    # print(wave_id)
      
  def run(self):
  
    # The main loop
    while self.runs:
      if self.ring2mqtt.mod_sta() is False:
        break
      time.sleep(0.001)
      self.push_wave()
    self.ring2mqtt.goodbye()
    self.client.loop_stop()
    self.client.disconnect()
    quit()
    print ("Exiting")
      
  def start(self):
    self.myThread.start()
    
  def stop(self):
    self.runs = False
    
