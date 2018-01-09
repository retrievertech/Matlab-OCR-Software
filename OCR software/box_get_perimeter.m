%This script runs after boxdetection4 (or whatever technique is used to get
%the edges of the data box) and uses Hough methods to get the longest line
%segments for each of the sides. It takes the Hough of the perimeter points,
%which should give good, straight results.  SG's idea.  The various parameters in hough,
%houghpeaks, and houghlines have been more or less empirically determined,
%but work pretty well.  However, these need to be looked at later and the
%currently hardwired values need to be verified.
%After running this, getroi.m finds the corner points of the data box by
%calculating the intersections of the houghlines for all four corners.
 
y=Bocr{BvalueOCR,1}(:,1); %If you want to plot the perimeter.
x=Bocr{BvalueOCR,1}(:,end); %The length of x is used below.  It is the same as 
%the length of y, which is the total perimeter length in pixels.
%plot(x,y)   %If you want to plot the perimeter

BWocrperim=zeros(BWocr3Y,BWocr3X); %A new image that is all zeros.  
sizeperim=size(x);
for d=1:sizeperim  %This creates an image, BWocrperim, that is binary with the 
    %perimeter values =1 and the rest =0
xval=x(d);
yval=y(d);
BWocrperim(yval,xval)=1;  %The perimeter values become =1 in the binary image.  All 
%other values stay =0. 
%keyboard
end
%imshow(I)
%hold on
%Find the longest vertical line on the LEFT side of the image
BWocrperimLeft=imcrop(BWocrperim,[0 0 0.5*BWocr3X BWocr3Y]);
[H,T,R] = hough(BWocrperimLeft,'RhoResolution',15,'Theta',-10:1:10);%Assuming the image isn't
%rotated more than 10 degrees.
%Note.  RhoResolution values at, e.g. 95 are too high and shift the line
%off the perimeter.  This effect is much more pronounced on vertical edges,
%and it is not clear why the horizontal edges aren't as sensitive.
%Also, the NHoodSize value is legacy but works for now.  All values are
%legacy and can be adjusted more carefully eventually.
P  = houghpeaks(H,50,'threshold',(0.5*max(H(:))),'NHoodSize',[5 5]);
lines = houghlines(BWocrperimLeft,T,R,P,'FillGap',305,'MinLength',7);

max_len = 0;
for k = 1:length(lines) %Get the longest line segment
   xy = [lines(k).point1; lines(k).point2];
    
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_longleft = xy;
   end
end
% highlight the longest line segment.
plot(xy_longleft(:,1),xy_longleft(:,2),'LineWidth',2,'Color','yellow');


%Find the longest vertical line on the RIGHT side of the image
BWocrperimRight=imcrop(BWocrperim,[0.5*BWocr3X 0 0.5*BWocr3X BWocr3Y]);
[H,T,R] = hough(BWocrperimRight,'RhoResolution',15,'Theta',-10:1:10);%Assuming the image isn't 
%rotated more than 10 degrees.
P  = houghpeaks(H,50,'threshold',(0.5*max(H(:))),'NHoodSize',[5 5]);
lines = houghlines(BWocrperimRight,T,R,P,'FillGap',305,'MinLength',7); 
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_longright = xy;
      xy_longright(1,1)=xy_longright(1,1)+(BWocr3X/2);%Correcting for how I chopped the
      %image into halves (above) when I limited where I was looking for the
      %hough lines.
      xy_longright(2,1)=xy_longright(2,1)+(BWocr3X/2);
   end
end
% highlight the longest line segment.
plot(xy_longright(:,1),xy_longright(:,2),'LineWidth',2,'Color','green');

%%Find the longest horizontal line on the TOP
BWocrperimTop=imcrop(BWocrperim,[0 0 BWocr3X BWocr3Y]);
BWocrperimTop(end-5:end, :)=0;
[H,T,R] = hough(BWocrperimTop,'RhoResolution',15,'Theta',-90:0.125:-70); %limiting 
%the search for near horizontal lines.   Still need to clarify what the
%+/- signs do, but it works for now.
P  = houghpeaks(H,50,'threshold',(0.5*max(H(:))),'NHoodSize',[5 5]);
lines = houghlines(BWocrperimTop,T,R,P,'FillGap',305,'MinLength',7);
 
max_len = 0;
for k = 1:length(lines);
    xy = [lines(k).point1; lines(k).point2];
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if len > max_len
      max_len = len;
      xy_longtop = xy;
   end
end
% highlight the longest line segment.
plot(xy_longtop(:,1),xy_longtop(:,2),'LineWidth',2,'Color','red');


%Find the longest horizontal line on the BOTTOM
BWocrperimBottom=imcrop(BWocrperim,[0 0.5*BWocr3Y BWocr3X 0.5*BWocr3Y]);
[H,T,R] = hough(BWocrperimBottom,'RhoResolution',15,'Theta',-90:1:-70); 
P  = houghpeaks(H,50,'threshold',(0.5*max(H(:))),'NHoodSize',[5 5]);
lines = houghlines(BWocrperimBottom,T,R,P,'FillGap',305,'MinLength',7);
  
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_longbottom = xy;
      xy_longbottom(1,2)=xy_longbottom(1,2)+(BWocr3Y/2);%Again, correcting
      %the coordinate for how I cut the image in half.
      xy_longbottom(2,2)=xy_longbottom(2,2)+(BWocr3Y/2);
   end
end


%Now 10 images are created, each image showing dots where the respective
%numbers were located before in the original image. This happens by eroding
%the original BW image by each number from 0 to 9, creating 10 new images.
%The dots in each image exist only where those particular numbers used to
%be.
BWocrzero=imerode(BWocr3, zero);
BWocrone=imerode(BWocr3, one);
BWocrtwo=imerode(BWocr3, two);
BWocrthree=imerode(BWocr3, three);
BWocrfour=imerode(BWocr3, four);
BWocrfive=imerode(BWocr3, five);
BWocrsix=imerode(BWocr3, six);
BWocrseven=imerode(BWocr3, seven);
BWocreight=imerode(BWocr3, eight);
BWocrnine=imerode(BWocr3, nine);

