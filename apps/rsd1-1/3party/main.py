from EWModtoMQTT import *


def main():
    print('Start')
    mainStart =  Ring2MQTT()
    mainStart.start()
    #mainStart.run() 

if __name__ == '__main__':
    main()