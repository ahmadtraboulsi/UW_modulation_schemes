#!/bin/bash
#create a directory for the log files
mkdir logs
receiver_type="results"
#run BPSK-Sender to generate outputBinary file (this is performed only once) MAKE SURE BPSK-Sender and BPSK_ReceiverPOLY.py have the same interpolation rate.
arrivalFilename="ice_0pc_5km"
arrivalFilenamee="ice_0pc_km5_no"

NoF=1

#y is the number of arrival files you are trying to process
for ((y=1; y<=$NoF; y++))
do
#do the below for each arrival file
for ((SNR=5; SNR<=30; SNR=SNR+5))
do
# input of receiver is as follow inputwave_file, outputBinaryfile
sp="_"
outputfile="$arrivalFilename"'/'"$receiver_type"'/'"outputBinary$y$sp$SNR"
inputfile="$arrivalFilename/$arrivalFilenamee$y"'SNR'"$SNR.wav"

outputBinaryFile=$outputfile"OUT"
#Starting matlab and running Correlation
cat <<EOF | matlab -nodesktop -nosplash -nodisplay />"$arrivalFilename"'/'"$receiver_type"'/'myresult$y$SNR.out &
import java.lang.System;
A=CorrelateGnuRadio('inputBinaryIN','$outputBinaryFile')
java.lang.System.exit(0);
exit
EOF
wait ${!}
done
#if [ $((y%2)) -eq 0 ];
#then

#fi
done