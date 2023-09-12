 MyModuleId     MOD_IMPORT_ACK  # module id for this import,
 RingName       WAVE_RING       # transport ring to use for input/output,
 HeartBeatInt   30              # Heartbeat interval in seconds
                                #    should be >= RcvAliveInt
 LogFile        0               # If 0, don't write log file 
                                #    1, do write log file
                                #    2, write module log but not stderr/stdout

 MaxMsgSize     65536      	# maximum size (bytes) for input/output msgs

# Socket communication info
#--------------------------
 SendAliveText  ImpAlive	# heartbeat text to foreign server machine
 SendAliveInt   30      	# seconds between alive msgs sent to server
				#   0 = no alive messages to sending machine
 
# Description of export partner
#------------------------------
 ServerIPAdr	10.5.1.1  # Ip address of the machine we're to listen to
 ServerPort	    10000		# IP port number used by sender
 RcvAliveText   ExpAlive        # export's heartbeat text
 RcvAliveInt	60		# export's heart beat interval in seconds
				#   0 = no heartbeat expected

# Optional commands
#------------------
#SocketTimeout  60000   # Timeout for Socket_ew calls in milliseconds
                        #   Should be at least the RcvAliveInt
	       	        #   Will default to RcvAliveInt
#HeartbeatDebug 0       # non-zero to get heartbeat debug messages.
#SocketDebug    1       # non-zero to get socket debug messagese.