#   
#   export_gen_actv configuration file
#
#
 MyModuleId     MOD_EXPORT_GEN_ACTV # module id for this program
 RingName       EEW_RING           # transport ring to use for input/output
 HeartBeatInt   30                  # EW internal heartbeat interval (sec)
#      
 LogFile        1                   # If 0, don't write logfile
#
# Logos of messages to export to client systems
#              Installation       Module       Message Type
 GetMsgLogo    INST_WILDCARD   MOD_WILDCARD     TYPE_EEW
 GetMsgLogo    INST_WILDCARD   MOD_WILDCARD     Type_EEW_record
 
#
 ReceiverIpAdr  192.168.20.180  # Import host IP Address
 ReceiverPort     15003         # Well-known port number to receive msgs on

 RcvAliveText     "alive"    # text of client's heartbeat (we get this)
 RcvAliveInt      40           # seconds between client's heartbeats to us.
                                # 0 => no heartbeat

 MaxMsgSize       4096          # maximum size (bytes) for input/output msgs
 RingSize         500           # number of msgs to buffer for export 

# 
# Sender (export) host parameters
#
 SendAliveText    "alive"    # string sent to client as heartbeat 
 SendAliveInt     20            # seconds between alive msgs sent to client.
                                # 0=> no heartbeat
#
# Socket commands
#
 SocketTimeout    200000        # Timeout length in milliseconds for socket 
                                # calls this should be atleast the value of 
                                # the RcvAliveInt
 SocketDebug      1             # Optional: If 1, socket_ew debug statements 
                                # are logged. If 0, socket_ew debug is turned 
                                # off
#
# verbosity
#
 Verbose          1             # Optional: set to 0 for quiet

