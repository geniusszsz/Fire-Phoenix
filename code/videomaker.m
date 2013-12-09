% This function is used to make a video to show the evolution of forest
% state with time.
% For further information, please look at 'FFM.m'.

function videomaker(state)
 [b1 b2 b3]=size(state);
 aviobj=avifile('E:\matlab project\video\test.avi','Compression','None','fps',5); 
 hax=axes;
 colormap([0.5,0.5,0.5;0,1,0;1,0,0;0,0,1]); 
for k=1:b3
  image(state(2:(b1-1),2:(b2-1),k)+ones(b1-2),'parent',hax); 
  frame = getframe(gcf);
  aviobj=addframe(aviobj,frame); 
end
  aviobj=close(aviobj);    
end
