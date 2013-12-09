% This file is used to get statistics of size-frequency distribution and
% save it in a txt. 
% For further information, please look at the report 5.2.
clear all;
clc;
M=load(['E:\matlab project\Data\exp_21\size_dis_10.txt']);
global r;
global c;
set(0,'RecursionLimit',2000);
r=zeros(500^2,1);
c=zeros(500^2,1);
[r,c,v]=find(M);
SIZE=zeros(length(M));
Length_max=length(r);
for i=1:length(M)
    for j=1:length(M)
        countsize(M,i,j);
        SIZE(i,j)=Length_max-nnz(r);
        Length_max=nnz(r);
    end
end
[r1,c1,v1]=find(SIZE);
filename=['E:\matlab project\Data\exp_21\histogram_10.txt']; 
fid=fopen(filename,'w');
for i=1:length(v1);
    fprintf(fid,'%d\n',v1(i:1));
end
fclose(fid);
