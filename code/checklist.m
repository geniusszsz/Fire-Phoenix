% This is one of the functions which can be used to get the size-frequency
% distribution. This function can check whether it is the first time to
% visit cell (i,j). For further information, please look at the report 5.2.

function marker=checklist(i,j)
global r; 
global c;
marker=0;
m=1;
while marker==0 & m<=length(r)
    if i==r(m) & j==c(m)
        marker=1;
        r(m)=0;
        c(m)=0;
    else marker=0;
    end
    m=m+1;
end
end