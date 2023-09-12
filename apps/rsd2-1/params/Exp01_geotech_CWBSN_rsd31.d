 MyModuleId     MOD_EXPORT_SCN      # 模組名稱
 RingName       WAVE_RING        ## 匯出資料來源由WAVE_RING_Tmp
 HeartBeatInt   30                  # 系統監控程式運作的間隔時間
                                    #   Should be >= RcvAliveInt 

 LogFile        0     # 記錄檔打開
#        Installation單位       Module     Message Type
#--------------------------------------------------------------
GetMsgLogo    INST_WILDCARD    MOD_WILDCARD     TYPE_TRACEBUF2

MaxMsgSize            65536     # TRACEBUF2的IO message大小(bytes)
RingSize              4096     # number of msgs in MessageStacking queue.
                               #  (msgs waiting to be sent to socket)
SendQueueLength       200   # Optional command: #msgs in SendQueue
                               #  (msgs sent, acknowledgments pending)
                               #  Valid range: 1-254 (default 100) 
                               #  shipped on export restarts.
MaxLatency               0   # Optional command: Packets with delay time
                               #  (i.e., time between present and packet
                               #  start time) greater than this amount will be
                               #  filtered out. Time is in minutes.  0 -> time
                               #  is not checked. System time must be accurate.
                               #  Only works on waveform messages.
 
ServerIPAdr        10.5.2.1  # 接收資料電腦之地IP
ServerPort         10001   # 接收資料電腦之Port
SendAliveText      ExpAlive   # Alive字串
SendAliveInt             30   # Alive間隔30秒
RcvAliveText       ImpAlive   # 收到Alive字串
RcvAliveInt              60   # 收到Alive間隔
SocketDebug   0       # 關掉socket_ew debug

#Send_scnl * * * *  

#Send_scnl_remap 6748  MPS CWB_BB 00 YM01  * IES_YMS 01

Send_scnl * HLZ TW 10 
Send_scnl * HLN TW 10 
Send_scnl * HLE TW 10 


