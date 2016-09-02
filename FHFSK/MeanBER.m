
A=zeros(17,30);
for i=1:30
file=strcat('goff_random_20pc_5km_E_no',int2str(i),'/results/BER');
s1=csvread(file);
%disp(s1(:,1));
A(:,i)=s1(:,1);
end
disp(A)
disp(mean(A,2))
avgR=zeros(17,2);
avgR(:,1)=mean(A,2);
avgR(:,2)=s1(:,2);
disp(avgR)
csvwrite('meanBERFHSSTHREESymPerSec',avgR);