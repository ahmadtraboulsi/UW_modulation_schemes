%SNR to EbN0

Ts=1/(48000/144000);
Fs=48000;
SNRdb=(-20:5:30);
Rb=1/Ts;
k=1;
for i=(1:1:11)
SNR=10^(SNRdb(i)/10);
EbN0(i)= 10*log10((SNR*Ts*Fs));
SNRin(i)=SNR;


end
disp(SNRdb);
disp(round(EbN0));
