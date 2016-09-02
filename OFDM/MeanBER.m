
A=zeros(11,100);
for i=1:100
file=strcat('goff_random_40pc_5km_E_no',int2str(i),'/rx_ofdm/BER');
s1=csvread(file);
%disp(s1(:,1));
A(:,i)=s1(:,1);
end
disp(A)
disp(mean(A,2))
avgR=zeros(11,2);
avgR(:,1)=mean(A,2);
avgR(:,2)=s1(:,2);
disp(avgR)
csvwrite('meanBER0p333SymPerSecPerCarrierPacketSize4bytes',avgR);