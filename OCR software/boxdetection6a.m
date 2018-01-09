
 sizeBWocr3=size(BWocr3);
 %Getting the size of the binary image for later use.
 BWocr3X=sizeBWocr3(2); %The x dimension for later
 BWocr3Y=sizeBWocr3(1);  %The y dimension for later
%Look for the largest object using bwboundaries.
[Bocr,LLocr]=bwboundaries(BWocr3,'noholes');  %Bocr is the perimeter, what we want.
stats3=regionprops(LLocr,BWocr3,'Area'); 
thearea1=0;
%Bsize1=0;
for kk=1:(size(Bocr))
   %Bsize2=numel( B{kk,1}(:,1));
    %Bsize2=numel( B{kk,1}(:,1));
   thearea2=stats3(kk).Area;
   if thearea2>thearea1
       thearea1=thearea2;
       BvalueOCR=kk;
   end
  
end
 imshow(BWocr3)

hold on
plot ((Bocr{BvalueOCR,1}(:,2)), (Bocr{BvalueOCR,1}(:,1)),'LineWidth',4) 
%stats3=regionprops(LLocr,I,'PixelValues','Perimeter','Area'); %Get the pixel 
%intensity values and Area for later.  Perimeter can be used as needed.
%Ivalues=double (stats3(BvalueOCR).PixelValues);%The intensity values of the data box.
%histmin=min(Ivalues); %The range of the histogram of the data box.
%histmax=max(Ivalues);
%imshow(I)%.  I commented out all displaying in this script.

%hold on
%plot ((B{BvalueOCR,1}(:,2)), (B{BvalueOCR,1}(:,1)),'LineWidth',4)  %This plots the
%perimeter.  Note that this part doesn't need the information from
%regionprops.  Regionprops is for the histogram of the data box, and
%bwboundaries is for finding the actual data box. 
%figure
%hist((Ivalues),(histmax-histmin)); %The histogram of the putative data box.
%**********
 

