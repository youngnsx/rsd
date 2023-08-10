
# This is template's parameter file

#  Basic Earthworm setup:
#
MyModuleId         MOD_TCPD  # module id for this instance of template 
RingName           PICK_RING   # shared memory ring for input/output
RingName_out       EEW_RING   # shared memory ring for input/output

LogFile            0           # 0 to turn off disk log file; 1 to turn it on
                               # to log to module log but not stderr/stdout
HeartBeatInterval  15          # seconds between heartbeats


MagMin 0.5 			# Min magnitude
MagMax 10		        # Max magnitude

Ignore_weight_P		3  # include 234
Ignore_weight_S		3

Mark	fbh 	# 3 characters for identify system

MagReject			CHGB HHZ BS 01		# ignore magnitude
MagReject			TATO HHZ IU 01		# ignore magnitude
MagReject			YOJ  HHZ JN 01
MagReject 			YM11 HHZ YS 01
MagReject 			YM10 HHZ YS 01
MagReject 			YD05 HHZ YS 02
MagReject 			YD04 HHZ YS 02
MagReject 			YM01 HHZ YS 01
MagReject 			TAP  HHZ BB 01
MagReject 			WFSB HHZ BS 01
MagReject 			PTMZ HHZ FJ 01

MagReject           EOS2  HLZ  OS 03
MagReject           EOS2  HSZ  OS 03
MagReject           EOS2  HHZ  OS 03
MagReject           EOS3  HLZ  OS 03
MagReject           EOS3  HSZ  OS 03
MagReject           EOS3  HHZ  OS 03
MagReject           EOS4  HLZ  OS 03
MagReject           EOS4  HSZ  OS 03
MagReject           EOS4  HHZ  OS 03


#------------ For Small Event
Trig_tm_win       40.0		# The P wave arrival time between each triggered station
Trig_dis_win      180.0		# Distances between each triggered station
Active_parr_win   60.0		# Survival time of each station (sec) , between the P wave arrival time and current time




#------------ For Large Event
#Trig_tm_win       24.0		# The P wave arrival time between each triggered station
#Trig_dis_win      120.0		# Distances between each triggered station
#Active_parr_win   60.0		# Survival time of each station (sec) , between the P wave arrival time and current time



Term_num     15          		          # The last report should be less than this number.                     
Show_Report	 1						      #  0: Disable, 1:Enable
Intensity_thr 0                           #  0: Disable, 1:Enable
Pv_thr 0                                  #  0: Disable, 1:Enable
Max_Epi_dis  100

 #----------------- P-wave velocity model
  Boundary_P     40.0        		          # boundary of shallow and deep layers                                    
  SwP_V        5.10298          		      # initial velocity in shallow layer                                    
  SwP_VG       0.06659       		          # gradient velocity in shallow layer                                   
  DpP_V        7.80479         		          # initial velocity in deep layer                                       
  DpP_VG       0.00457      		          # gradient velocity in deep layer                                      
##  #


 #----------------- S-wave velocity model
  Boundary_S     50.0        		          # boundary of shallow and deep layers                                  
  SwS_V        2.9105          		  		  # initial velocity in shallow layer                                    
  SwS_VG       0.0365       		          # gradient velocity in shallow layer                                   
  DpS_V        4.5374         		          # initial velocity in deep layer                                       
  DpS_VG       0.0023      		              # gradient velocity in deep layer                                      
#  #




# List the message logos to grab from transport ring
#              Installation       Module		Message
GetEventsFrom  INST_WILDCARD    MOD_WILDCARD	TYPE_EEW







