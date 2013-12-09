% This function can save the sparse matrix which can be used to
% calculate the size-frequency distribution into a txt. 
% For further information, please look at 'sizedistribution_plot.m'.

function distribution_writer(Y)
filename=['E:\matlab project\Data\exp_21\size_dis_10.txt']; 
fid=fopen(filename,'w');
[b1 b2]=size(Y);
for m=1:b1
   for n=1:b2
     fprintf(fid,'%f\t',Y(m,n));
   end
   fprintf(fid,'\n');
end
fclose(fid);
end