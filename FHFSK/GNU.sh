#!/bin/bash
#create a directory for the log files
mkdir logs
#run BPSK-Sender to generate outputBinary file (this is performed only once) MAKE SURE BPSK-Sender and BPSK_ReceiverPOLY.py have the same interpolation rate.
arrivalFilename="ice_0pc_5km"
arrivalFilenamee="ice_0pc_km5_no"
receiver_type="results"
mkdir logs/$receiver_type
NoF=1
#python2.7 FHSS_tx.py
#y is the number of arrival files you are trying to process
 for ((y=1; y<=$NoF; y++))
do
mkdir "$arrivalFilename"'/'"$receiver_type"
#do the below for each arrival file
for ((SNR=-50; SNR<=30; SNR=SNR+5))
  do
# input of receiver is as follow inputwave_file, outputBinaryfile
  sp="_"
  outputfile="$arrivalFilename"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
  inputfile="$arrivalFilename"'/'"$arrivalFilenamee$y"'SNR'"$SNR.wav"
  echo $outputfile
  echo $inputfile
  python2.7 FHSS_rx.py $inputfile $outputfile  & >>logs/logfileBPSKRX
 # wait ${!}



#wait ${!}


  done
wait ${!}

done
wait ${!}

#y is the number of arrival files you are trying to process
for ((y=1; y<=$NoF; y++))
do
#do the below for each arrival file
for ((SNR=-50; SNR<=30; SNR=SNR+5))
do
# input of receiver is as follow inputwave_file, outputBinaryfile
sp="_"
outputfile="$arrivalFilename"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
inputfile="$arrivalFilename/$arrivalFilenamee$y"'SNR'"$SNR.wav"
#Starting Correlation and preparing inputfiles
python2.7 RIN.py inputBinary >>logs/logfileRIN
python2.7 ROUT.py $outputfile >>logs/logfileROUT
done
wait ${!}
done
wait ${!}

