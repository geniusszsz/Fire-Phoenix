% This file is used to generate the sparse matrix which can be used to
% calculate the size-frequency distribution. 
% For further information, please look at the report 5.2 & 6.5.
% One function is used in the file: distribution_writer(Y).

clc
clear all
M1=load(['E:\matlab project\Data\exp_21\state_10_1.txt']);
M2=load(['E:\matlab project\Data\exp_21\state_10_55.txt']);
initial=M1==0;
final=M2==0;
S=final-initial;
TREE=S==-1;
BURNT=S+TREE;
spy(BURNT);
distribution_writer(BURNT);