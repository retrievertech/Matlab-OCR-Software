%Note this works as stand alone interactive picking.   The next script,
%boxdetection5, will incorporate a loop for sequential opening and all
%that.

%This script is to determine the perimeter coordinates of the 'data box' in
%a seismogram.  The seismo file is interactively picked, and after
%eliminating the traces in an opening and otherwise cleaning up the image,
%the connected components are listed.  The assumption
%is that the data box is the largest connected component, and its perimeter is
%extracted and plotted on top of the original image. Note we're working
%with full size images here.  They are resized in the script for speed, but regardless the size
%of the strel needs to be adjusted according to the width of the traces in
%the image on which you are working. 

BW3Y=size(BW3, 1);
BW3X=size(BW3, 2);

%Look for the largest object using bwboundaries.
[B,LL]=bwboundaries(BW3,'noholes');  %B is the perimeter, what we want.
Bsize1=0;
for kk=1:(size(B))
    plot ((B{kk,1}(:,2)), (B{kk,1}(:,1)),'LineWidth',4) 
   answer= regionpropss(kk).Area
   Bsize2=numel( B{kk,1}(:,1));
   if Bsize2>Bsize1
       Bsize1=Bsize2;
       Bvalue=kk; %Bvalue is the object number of the largest object.
   end
end
 
%stats3=regionprops(LL,I,'PixelValues','Perimeter','Area'); %Get the pixel 
%intensity values and Area for later.  Perimeter can be used as needed.
%Ivalues=double (stats3(Bvalue).PixelValues);%The intensity values of the data box.
%histmin=min(Ivalues); %The range of the histogram of the data box.
%histmax=max(Ivalues);
imshow(BW3)

hold on
plot ((B{Bvalue,1}(:,2)), (B{Bvalue,1}(:,1)),'LineWidth',4)  %This plots the
%perimeter.  Note that this part doesn't need the information from
%regionprops.  Regionprops is for the histogram of the data box, and
%bwboundaries is for finding the actual data box. 
%figure
%hist((Ivalues),(histmax-histmin)); %The histogram of the putative data box.
%**********
%Get maximum size and compare with average box size (value is in our Drive)
%C=[stats3.Area]; %The areas of the objects found
%max(C); %which should be the data box
%1-(abs((max(C)*16)/65352425))
%if 1-(abs((max(C)*16)/65352425))>0.02 %old
    %if abs(1-(abs((max(C)*16)/65352425)))>0.04%multiplied by 16 because the image size was
    %divided by 4 at the beginning of the script.  I chose 2% becuase the
    %error bars on the box size is 1%, and I gave it a little extra room in
    %case it picked up or missed parts, but was still close enough.
    % if abs(1-(abs((max(C)*16)/1)))>0.09 %Use this for full size image. 
    %disp('Maybe you didnt find the box')
%end
%******
%NOTES.  This can be automated to run through e.g. 1,000 images.  A counter
%can be tripped every time the box size is wrong, and this can give a good
%accuracy estimate.   The loop should also collect stats including %
%difference from canonical box size, and output the file names that failed.
%***********
%TEMP. Discard when the plotting of perim is figured out.
%This next part worked for plotting and extracting the perimeter.   Now,
%can this be converted to a BW image for Hough detection?
 
