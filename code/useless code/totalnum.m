function sum=totalnum(M)
[a1,a2]=size(M);
sum=0;
for i=1:a1
    for j=1:a2
        sum=sum+M(i,j);
    end
end
end