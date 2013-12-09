% This file is used to draw the histogram of size-frequency distribution of
% fire clusters. For further information, please look at the report 6.5. 

clc
clear all
A=load(['E:\matlab project\Data\exp_21\histogram.txt']);
bin=20;
hist(A,bin);
Y=hist(A,bin)./length(A);
incre=(max(A)-min(A))/(bin-1);
X=(min(A)+incre/2):incre:(max(A)+incre/2);
loglog(X,Y,'o');

