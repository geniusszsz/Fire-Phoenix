% This file is used to draw the scan of the number of fire with different
% parameters. For further information, please look at the report 6.1-6.3.

clc
clear all
for i=1:101
    t=0+(i-1)*0.0000001;
    filename=['E:\matlab project\Data\exp_18\count_',num2str(t),'.txt'];
    data{i}=load(filename);
end
x=0.00:0.0000001:0.00001;
y=data{1}(:,1);
k=length(y);
for i=1:101
    for j=1:k
      z(j,i)=(data{i}(j,2));
    end
end
surf(x,y,z);
shading flat;
axis([0.0000001,0.00001,1,3000]);
xlabel('probLightening');
ylabel('Step');
zlabel('Fire');