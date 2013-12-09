% This is one of the functions which can be used to get the size-frequency
% distribution. This function can count the size of a cluster starting from cell (i,j).
% For further information, please look at the report 5.2.

function countsize(M,i,j)
global r; 
global c;
marker=checklist(i,j);
if marker==1
  if M(i,j)==1
      countsize(M,i,j+1);
      countsize(M,i,j-1);
      countsize(M,i+1,j);
      countsize(M,i-1,j);
      countsize(M,i+1,j+1);
      countsize(M,i+1,j-1);
      countsize(M,i-1,j+1);
      countsize(M,i-1,j-1);
  end
end
end