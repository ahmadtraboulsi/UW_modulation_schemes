#MODIFIED ON SUNDAY 5:30 AM NEEDS TO BE TESTED

#!/bin/bash
#create a directory for the log files
mkdir logs
#run BPSK-Sender to generate outputBinary file (this is performed only once) MAKE SURE BPSK-Sender and BPSK_ReceiverPOLY.py have the same interpolation rate.
arrivalFilename="ice_0pc_5km_no"
receiver_type="rx_ofdm"
mkdir logs/$receiver_type
#Number of Files
NoF=1
python2.7 tx_ofdm.py
#y is the number of arrival files you are trying to process
 for ((y=1; y<=$NoF; y++))
do
mkdir "ice_0pc_5km"'/'"$receiver_type"
#do the below for each arrival file
for ((SNR=-50; SNR<=30; SNR=SNR+5))
  do
# input of receiver is as follow inputwave_file, outputBinaryfile
  sp="_"
  outputfile="ice_0pc_5km"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
  inputfile="ice_0pc_5km"'/'"$arrivalFilename$y"'SNR'"$SNR.wav"
  echo $outputfile
  echo $inputfile
  python2.7 rx_ofdm.py $inputfile $outputfile  & >>logs/logfileBPSKRX
# wait ${!}



#wait ${!}


  done
wait ${!}

done
wait ${!}

#y is the number of arrival files you are trying to process
#for ((y=1; y<=$NoF; y++))
#do
#do the below for each arrival file
#for ((SNR=-20; SNR<=30; SNR=SNR+5))
#do
# input of receiver is as follow inputwave_file, outputBinaryfile
#sp="_"
#outputfile="$arrivalFilename$y"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
#inputfile="$arrivalFilename$y/$arrivalFilename$y"'SNR'"$SNR.wav"
#Starting Correlation and preparing inputfiles
#python2.7 RIN.py inputBinary >>logs/logfileRIN
#python2.7 ROUT.py $outputfile >>logs/logfileROUT
#done
#wait ${!}
#done
#wait ${!}



#y is the number of arrival files you are trying to process
#for ((y=1; y<=$NoF; y++))
#do
#do the below for each arrival file
#for ((SNR=-20; SNR<=30; SNR=SNR+5))
#do
# input of receiver is as follow inputwave_file, outputBinaryfile
#sp="_"
#outputfile="$arrivalFilename$y"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
#inputfile="$arrivalFilename$y/$arrivalFilename$y"'SNR'"$SNR.wav"

#outputBinaryFile=$outputfile"OUT"
#Starting matlab and running Correlation
#cat <<EOF | matlab -nodesktop -nosplash -nodisplay />"$arrivalFilename$y"'/'"$receiver_type"'/'myresult$y$SNR.out &
#import java.lang.System;
#A=CorrelateGnuRadio('inputBinaryIN','$outputBinaryFile')
#java.lang.System.exit(0);
#exit
#EOF
#done
#if [ $((y%2)) -eq 0 ];
#then
#wait ${!}
#fi
#done


#y is the number of arrival files you are trying to process
#for ((y=1; y<=$NoF; y++))do

#do the below for each arrival file
#for ((SNR=-20; SNR<=30; SNR=SNR+5))
#do
#sp="_"
#outputfile="$arrivalFilename$y"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
#inputfile="$arrivalFilename$y/$arrivalFilename$y"'SNR'"$SNR.wav"

#extract the new delay
#a=$(grep 'lagDiff=\+' myresult$y$SNR.out | grep  -o "[^=|.]\d\+")
#a=$(grep 'lagDiff=\+' "$arrivalFilename$y"'/'"$receiver_type"'/'myresult$y$SNR.out | grep  -o "[-]*[0-9]\+")
#echo "THIS IS THE RESULT OF CORRELATION $a"
#calculating BER with the delay
#wait ${!}
#python2.7 BER.py inputBinary $outputfile $a >>logs/logfile2 &
#wait ${!}
#echo 'This is the value of '"$SNR"
#done
#done
