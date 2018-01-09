%This script runs all of the necessary scripts to compare the OCR result
%with the actual file name to check the program for accuracy. It allows for
%the user to select the image that they wish to identify. There are
%rescaling parameters that rescale to .25, so as it stands, the input must
%be a full sized image for this to work.

erodeNum
OCR
boxdetection6a
box_get_perimeter
cropROI
trimFat
Positions
OrderNum

%This section compares the guess to the actual File name. For this to work,
%the file must be properly named as its 19 character seismogram id - that
%is, in the format of MMDDYY_HHMM_STAT_0X

%Since the real purpose of this is to name the files automatically, one
%suggestion is to have it name a seismogram as the guess only if the guess
%includes 16 numbers.
if FileNameGuessOCR==FileName
    disp('Perfect Match')
end
