#
#                 Startstop Configuration File for Unix
#
#    <nRing> is the number of transport rings to create.
#    <Ring> specifies the name of a ring followed by it's size
#    in kilobytes, eg        Ring    WAVE_RING 1024
#    The maximum size of a ring is 1024 kilobytes.
#    Ring names are listed in file earthworm.h.
#

 nRing                     8
 Ring   WAVE_RING       4096
 Ring   EEW_RING        4096
 Ring   EEW_RING1       4096
 Ring   PICK_RING       4096
 Ring   EXPPT_RING_ST   4096
 Ring   EXPPT_RING_BB   4096
 Ring   EXPPT_RING_BH   4096
 Ring   EXPPT_RING_SM   4096

MyModuleId         MOD_STARTSTOP  # Module Id for this program
HeartbeatInt       15             # Heartbeat interval in seconds

# The next two are for Unix only - must be here
MyClassName        OTHER          # For this program
MyPriority         0              # For this program

# The next one is for Windows only - must be here
#MyPriorityClass    Normal         # For startstop

LogFile            1              # 1=write a log file to disk, 0=don't,
                                  # 2=write to module log but not stderr/stdout
KillDelay         10              # Number of seconds to wait on shutdown
                                  #  for a child process to self-terminate
                                  #  before killing it

# The next one is for Unix only - must be here
HardKillDelay      5              # Wait this many more secs for procs to die
                                  #  before really killing them

# The next one is for Windows only - must be here
#PipeName           myEWPipe       # Name of the startstop console pipe to use

# Uncomment to specify the number of seconds to wait after starting statmgr
#statmgrDelay       1              # default is 1 second

#
#    PriorityClass values:
#       Idle            4
#       Normal          9 forground, 7 background
#       High            13
#       RealTime        24
#
#    ThreadPriority values:
#       Lowest          PriorityClass - 2
#       BelowNormal     PriorityClass - 1
#       Normal          PriorityClass
#       AboveNormal     PriorityClass + 1
#       Highest         PriorityClass + 2
#       TimeCritical    31 if PriorityClass is RealTime; 15 otherwise
#       Idle            16 if PriorityClass is RealTime; 1 otherwise
#
#    Display can be either NewConsole, NoNewConsole, or MinimizedConsole.
#
#    If the command string required to start a process contains
#    embedded blanks, it must be enclosed in double-quotes.
#    Processes may be disabled by commenting them out.
#    To comment out a line, preceed the line by #.
#



 Process          "tankplayer tankplayer.d"
 Class/Priority    OTHER 0

 Process          "ringdup_scn ringdup_scn_BB.d"
 Class/Priority    OTHER 0

 Process          "ringdup_scn ringdup_scn_SMT.d"
 Class/Priority    OTHER 0

 Process          "ringdup_scn ringdup_scn_BH.d"
 Class/Priority    OTHER 0

 Process          "ringdup_scn ringdup_scn_CSMT.d"
 Class/Priority    OTHER 0


 Process          "pick_eew_cwb pick_ew_BB.d"
 Class/Priority    OTHER 0

 Process          "pick_eew_cwb pick_ew_BH.d"
 Class/Priority    OTHER 0

 Process          "pick_eew_cwb pick_ew_ST.d"
 Class/Priority    OTHER 0

 Process          "pick_eew_cwb pick_ew_CSMT.d"
 Class/Priority    OTHER 0

 Process          "tcpd_cwb tcpd.d"
 Class/Priority    OTHER 0

 Process          "tcpd_cwb_fast tcpd_fast_42.d"
 Class/Priority    OTHER 0

 Process          "tcpd_cwb_fast_bh tcpd_fast_42_bh.d"
 Class/Priority    OTHER 0


