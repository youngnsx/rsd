

# tankplayer config file for playing waveform files

RingName      WAVE_RING        # play waveforms into this ring
MyModuleId    MOD_ADSEND_A     # as this module id
PlayMsgType   TYPE_TRACEBUF2   # msg type to read from file
LogFile       1                # 0=no log; 1=keep log file
HeartBeatInt  30               # seconds between heartbeats
Pause         0                # seconds to pause between wavefiles
StartUpDelay  3                # seconds to wait before playing 1st file
ScreenMsg     1                # (optional) if non-zero, informational messages will be
                               #   written to the screen as data is played

                               #
# InterMessageDelayMillisecs 20   # Number of ms to sleep between inserting tracebufs
 InterMessageDelayMillisecs 0   # Number of ms to sleep between inserting tracebufs
                               # regardless of header time stamp! Fastest possible 
                               # value is 1. This effectively makes tank player a tank
                               # bulk loader.
                               # Disabled if this is set to 0 -- then all other delay
                               # settings apply            
Debug         1                # for verbosity

# List of files to play (up to 1000 allowed):


#WaveFile	/earthworm/run_eew/params_cwb_pub/2013-oct-31-Taiwan_event_60s_MAN

#WaveFile     /earthworm/data/20160205_SAC/20160205.tank

WaveFile   /earthworm/run/data/22240511_120s.A21.MAN


SendLate      0.0             # (optional) if present, packets will be
                               #   timestamped this many seconds before
                               #   current time;
                               # if absent, packets will have original time
                               #   stamps

# Directory to scan for wave files. If you specify WaveFiles individually above, you
# may not use GetFromDir at the same time. GetFromDir uses the parameters CheckPeriod,
# OpenTries, OpenWait, SaveDataFiles
#
#                               # Directory to monitor for data
	   #GetFromDir        D:\eew_201208
	   #CheckPeriod        10          # Secs between polling the directory for new files. 
	   #                                # (Only when finished with files that were there.)
	   #OpenTries          2           # Number of tries to open each file, if the open fails
	   #OpenWait           200         # Milliseconds between open retries
	   #SaveDataFiles      1           # If non-zero, move to subdirectory called "save",  0, remove files 
                                # Problem saved data files are moved to a subdirectory called "trouble"

# IgnoreTBVersionNumbers -
# Prevents tankplayer from objecting to tracebuf2 packets that don't have 
# the correct version field.  Not recommended.
#IgnoreTBVersionNumbers 0
