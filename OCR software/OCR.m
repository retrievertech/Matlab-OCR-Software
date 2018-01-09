%The user chooses an image
[image, user_canceled]=imgetfile;
choice=imread(image);
%converted into black and white
BWocr=im2bw(choice, .74);
linese=strel('disk', 15);
%opened up with a disk struct element
BWocr=imopen(BWocr, linese);
BWocr2=imcomplement(BWocr);
%color is inverted
BWocr2=imresize(BWocr2, .25);
sizeBWocr2=size(BWocr2);
BWocr2X=sizeBWocr2(2);
BWocr2Y=.5*sizeBWocr2(1);
%image is cropped at the halfway mark of height to increase performance,
%since numbers only exist at the top
BWocr3=imcrop(BWocr2, [0, 0, BWocr2X, BWocr2Y]);