% This function is used to write a certain forest state into a txt. 
% For further information, please look at 'FFM.m'.

function state_writer(state,k,nof)

[b1 b2 b3]=size(state);
filename=['E:\matlab project\Data\exp_21\state_',num2str(nof),'_',num2str(k),'.txt']; 
fid=fopen(filename,'w');
for m=1:b1
   for n=1:b2
     fprintf(fid,'%d\t',state(m,n,k));
   end
   fprintf(fid,'\n');
end
fclose(fid);

end
