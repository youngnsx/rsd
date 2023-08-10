#!/bin/csh

cd /home/rtd/Earthworm/run/params

#while(1)

	echo Watch for Rep Files ....

	set dd = ( `date "+%Y_%m"` )

	if ( !(-d $dd)  ) then
		echo Make a Directory $dd !
		mkdir $dd
	endif

#	set rep =(`ls *.rep | grep .rep`)
#        set n = `ls *.rep | grep .rep | wc -l`
        #ls *.rep | grep n1.rep > n1.txt
#        ls *.rep > nlist.txt

#	foreach ii ($rep[*])
#		echo moving $ii to /home/rtd/EEW_REPORT
#		cp $ii /home/rtd/EEW_REPORT
#                
#	end
        mv *.rep ./$dd

#        if ($n > 0) then
#        cd GMT
#        csh process_draw.csh
#
#        set t = 1
#        while($t != 0 )
#        set t = `ls *tmp | grep .rep | wc -l`
#        echo "sleep 3 sec until no tmpfile..."
#        sleep 3
#        end
#
#
#        cd ..
#        endif 


#	echo Sleeping 30 seconds ...
#	sleep 30
#end
