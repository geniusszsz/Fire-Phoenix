% This file is used to draw the evolution of cell states.
% For further information, please look at the report 6.1. 

clear all
clc
M=load(['E:\matlab project\Data\exp_20\count_1.txt']);
figure;
subplot(2,1,1);
plot(M(:,1),M(:,2),'b',M(:,1),M(:,3),'g');
axis([0,1000,0,1]);
legend('empty','tree','fire');
subplot(2,1,2);
plot(M(:,1),M(:,4),'r');
legend('fire');
axis([0,1000,0,0.01]);

