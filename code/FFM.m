% This file is Forest Fire Model. Three functions can be used in the file:
% count_writer(state,nof,n);state_writer(state,k,nof);videomaker(state);
% For further information, please look at the report 5.1. 

clc;
clear all;
nof=1; %number of files
NOE=10; %number of experiments

while (nof<=NOE)
    
n=500; %size of forest
probTree=0.5; %desity of tree
probIgnite=1; % probability of burning if a neighbouring tree is burnt (homo forest)
probGrow=1E-3; % probalility of growing tree if there is empty site

% Weather conditions: 
probLightning=1E-6; %Lightening or spark cause fire although no neighbouring tree is burning
probRain=0; %probability of putting off by rain
beta=0; % wind suppression controller
loop=1; %number of step
N=200; %upper bound of loop

% forest geometry
% i0=n/2; %fire starting point
% j0=n/2; %fire starting point

% initialize forest: 0-space; 1-tree;2-burning tree;3-village
grid1 = zeros(n); 
grid1(rand(n) < probTree) = 1; 
% grid1(i0,j0)=2;  %fire starting point
grid=zeros(n+2); %boundary of forest which can stop the fire
grid(2:n+1,2:n+1)=grid1;

state=zeros(n,n,N);%to save current state of forest
state(:,:,1)=grid(2:n+1,2:n+1);

colormap([0.5,0.5,0.5;0,1,0;1,0,0;0,0,1]); %define colar:0-grey, 1-green, 2-red,3-blue
image(grid(2:n+1,2:n+1)+ones(n)); %draw the initial state of forest
pause(0.1); 

while (loop<=N)

space=grid==0; %record position of empty site    
havetree=grid == 1; %record position of tree 
burnt=grid==2;%record position of burning tree

nfire = circshift(grid, [1 0])  == 2; %check if there is any tree near a burning tree: N-north, S-south, E-east, W-west
sfire = circshift(grid, [-1 0]) == 2;
efire = circshift(grid, [0 -1]) == 2;
wfire = circshift(grid, [0  1]) == 2;
nefire = circshift(grid, [1 -1])  == 2;
sefire = circshift(grid, [-1 -1]) == 2;
swfire = circshift(grid, [-1 1]) == 2;
nwfire = circshift(grid, [1  1]) == 2;

susceptible_n = rand(n+2) < probIgnite*exp(-0*beta)*(1-probRain); 
susceptible_ne = rand(n+2) < probIgnite*exp(-pi/4*beta)*(1-probRain);
susceptible_nw = rand(n+2) < probIgnite*exp(-pi/4*beta)*(1-probRain);
susceptible_e = rand(n+2) < probIgnite*exp(-pi/2*beta)*(1-probRain);
susceptible_w = rand(n+2) < probIgnite*exp(-pi/2*beta)*(1-probRain);
susceptible_se = rand(n+2) < probIgnite*exp(-3*pi/4*beta)*(1-probRain);
susceptible_sw = rand(n+2) < probIgnite*exp(-3*pi/4*beta)*(1-probRain);
susceptible_s = rand(n+2) < probIgnite*exp(-pi*beta*(1-probRain));

grid(havetree & (nfire & susceptible_n | sfire & susceptible_s | wfire & susceptible_w | efire & susceptible_e | nefire & susceptible_ne | nwfire & susceptible_nw | sefire & susceptible_se | swfire & susceptible_sw)) = 2;
grid(havetree & (rand(n+2) < probLightning))=2; %Lightening or spark cause fire although no neighbouring tree is burning
grid=grid-2*burnt; %burnt trees fall down become empty sites
grid(space & (rand(n+2)<probGrow))=1; %trees can grow on empty sites 

loop=loop+1;
state(:,:,loop)=grid(2:n+1,2:n+1);%save the current state of forest
image(grid(2:n+1,2:n+1)+ones(n)); %draw the current state of forest
pause(0.1);

end

%count_writer(state,nof,n);
%state_writer(state,k,nof); % k is the indice of state one want to write

nof=nof+1;

end

%videomaker(state);



