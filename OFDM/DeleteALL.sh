#!/bin/bash
for ((c=1; c<=100; c++))
 do
#rm goff_random_20pc_5km_E_no$c/outputBinary*
#  rm  goff_random_200pc_5km_E_no$c/resultsfilters32POLY
rm  goff_random_40pc_5km_E_no$c/rx_ofdm/BER

# rm -r logs
done
