%Changing this for boxdetection6a, and.. (add differences between this and
%sequentialopen2 as they arise).  It runs through a whole folder.
%Note 4/21/14   Something needs to run before this because list(ii) name is
%undefined.   It means I need to run getSubDir first.This is part of it,
%and is why it's sequentialopen 3.  The previous didn't have this
%functionality.


%This script is a test to open files sequentially.  It will be used
%eventually for histogram processing.  IT works so far, with a manual input
%of the folder where you're looking.
%fid = fopen('C:\New folder\myfile.txt','a');
%myfolder='C:\Users\Andy\Desktop\USGS Seismograms\quiescent seismos';
%myfolder='C:\Users\Andy\Google Drive\MATLAB\Various test images\unzipped';
myfolder=list(ii).name;  %you manually define it like eg currentDir=('C:\New folder2')
%myfolder='F:\1 1_74';

images=dir(myfolder)
numimages=length(images);
failcount=0;
TrueSuccess=0;

Tfail=table
tablecount=0
for runcount=1:numimages
   baseFileName = images(runcount).name;
   [pathstr,FileName,extension]=fileparts(baseFileName);
   fullFileName = fullfile(myfolder, baseFileName);
   Iorig = imread(fullFileName);
 %imshow(imageArray);  % Display image.
erodeNum

OCR1

boxdetection6a

box_get_perimeter

cropROI

trimFat

Positions

OrderNum

try
    if FileNameGuessOCR==FileName
    disp('Perfect Match')
    TrueSuccess=TrueSuccess+1
    runcount
else
    TrueSuccess=TrueSuccess
    runcount
    tablecount=tablecount+1
    Tfail(tablecount, 1)=array2table(runcount);
    end
catch disp('failure')
    tablecount=tablecount+1
    Tfail(tablecount,1)=array2table(runcount);
end
end

%disp('Total number of images analyzed=')
%disp(numimages)
%disp('Number of failed corner detections')
%disp(failcount)
%fclose(fid)

