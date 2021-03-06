%This section creates the objects that will be used to identify numbers.
%One object exists per number 0-9. The erosion skeletonizes the number
%objects so they will fit into most all numbers encountered. Required are
%images of the 10 numbers, here labeled on my computer as zero.tif, etc
se=strel('disk', 2);
zero=imread('zero.tif');
zero=im2bw(zero);
zero=imresize(zero,.25);
zero1=imerode(zero, se);
zero=strel(zero1);
one=imread('one.tif');
one=im2bw(one);
one=imcomplement(one);
one=imresize(one,.25);
one1=imerode(one, se);
one=strel(one1);
two=imread('two.tif');
two=im2bw(two);
two=imcomplement(two);
two=imresize(two, .25);
two1=imerode(two, se);
two=strel(two1);
three=imread('three.tif');
three=im2bw(three);
three=imcomplement(three);
three=imresize(three, .25);
three1=imerode(three, se);
three=strel(three1);
four=imread('four.tif');
four=im2bw(four);
four=imcomplement(four);
four=imresize(four,.25);
four1=imerode(four, se);
four=strel(four1);
five=imread('five.tif');
five=im2bw(five);
five=imresize(five, .25);
five1=imerode(five, se);
five=strel(five1);
six=imread('six.tif');
six=im2bw(six);
six=imresize(six, .25);
six1=imerode(six, se);
six=strel(six1);
seven=imread('seven.tif');
seven=im2bw(seven);
seven=imresize(seven, .25);
seven1=imerode(seven, se);
seven=strel(seven1);
eight=imread('eight.tif');
eight=im2bw(eight);
eight=imcomplement(eight);
eight=imresize(eight, .25);
eight1=imerode(eight, se);
eight=strel(eight1);
nine=imread('nine.tif');
nine=im2bw(nine);
nine=imcomplement(nine);
nine=imresize(nine, .25);
nine1=imerode(nine, se);
nine=strel(nine1);