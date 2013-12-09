function energydis_writer(state)
[a,b,c]=size(state);
for k=1:c
    M=state(:,:,k);
   
    for r=1: (a/2-1)
        Energy(k,r)=(totalnum(M((a/2-r):(a/2+r),(b/2-r):(b/2+r)))-totalnum(M((a/2-r+1):(a/2+r-1),(b/2-r+1):(b/2+r-1))))/4/r;
    end
end

filename=['E:\matlab project\Data\exp_6\energydis.txt']; 
fid=fopen(filename,'w');
for m=1:c
     for n=1:(a/2-1)
       fprintf(fid,'%d\t',Energy(m,n));
     end
     fprintf(fid,'\n');
end
fclose(fid);

filename=['E:\matlab project\Data\exp_6\energydis.txt'];
z=load(filename);
[X,Y]=size(z);
x=1:X;
y=1:Y;
figure;
surf(x',y',z');
shading flat;