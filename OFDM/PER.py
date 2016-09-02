#! python
from sys import argv
import numpy
import re
import scipy
from bitstring import BitArray
numpy.set_printoptions(threshold='nan')
#print "Hello, Python below is your file"
#filename= raw_input('ENTER YOUR  FIRST Filename: ')
script, filename1, filename2 = argv
A1 = scipy.fromfile(open(filename1), dtype=scipy.uint8)
A2 = scipy.fromfile(open(filename2), dtype=scipy.uint8)



#NOTE: TOTAL NUMBER OF PACKETS SENT ARE A1.size/32=24
#      TOTAL Received PACKETS is A2.size/32
#PER is   (float(A1.size)-float(A2.size))/float(A1.size)

PER= (float(A1.size-32)-float(A2.size))/float(A1.size-32)
print('A1.size='+str(A1.size-32)+'A2.size='+str(A2.size)+' PER='+ str(PER))
po2=re.findall("[/].+[_].+",filename2)
result2=str(po2[0])
SNRin=re.findall("[y].+[_].+",result2)
temp=re.findall("[_].+",str(SNRin[0]))
presult=str(temp[0][1:])
po= re.findall("\w+[/]",filename2)
result=str(po[0])+ str(po[1])+"BER"
f=open(result,'a')
print("THIS is SNR from BER "+ presult[1:])
data=str( str(PER) + ","+ str(presult))
f.write(data+ "\n")
f.close()
#a= BitArray(float=0.34, length=32)
#a.bin=f
#print(a.float)
