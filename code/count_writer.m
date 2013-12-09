% This function is used to write the count of cell states into a txt. 
% For further information, please look at 'FFM.m' & 6.1. 

function count_writer(state,nof,n);
[b1 b2 b3]=size(state);
filename=['E:\matlab project\Data\exp_20\count_',num2str(nof),'.txt']; 
fid=fopen(filename,'w');
Data=zeros(b3,4);
for k=1:b3
  Grey=state(2:(b1-1),2:(b2-1),k)==0;
  Green=state(2:(b1-1),2:(b2-1),k)==1;
  Red=state(2:(b1-1),2:(b2-1),k)==2;
  Data(k,1)=k;
  Data(k,2)=length(find(Grey))/n/n;
  Data(k,3)=length(find(Green))/n/n;
  Data(k,4)=length(find(Red))/n/n;
end
for i=1:b3
     for j=1:4
       fprintf(fid,'%d\t',Data(i,j));
     end
     fprintf(fid,'\n');
end
fclose(fid);
end