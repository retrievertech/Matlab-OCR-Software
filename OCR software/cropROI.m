%A shape of a rectangle is created to crop nothing but the number fields
%away. The parameters are xy_longtop (the longest line found on top  of the
%ROI) and the low y value is 90 pixels below that. This seems to capture
%all the numbers in a region reliably. All 10 eroded images are cropped.
rect=[0, (xy_longtop(1,2)+xy_longtop(2,2))/2-90, BWocr2X, 90];
BWocrzero=imcrop(BWocrzero, rect);
BWocrone=imcrop(BWocrone, rect);
BWocrtwo=imcrop(BWocrtwo, rect);
BWocrthree=imcrop(BWocrthree, rect);
BWocrfour=imcrop(BWocrfour, rect);
BWocrfive=imcrop(BWocrfive, rect);
BWocrsix=imcrop(BWocrsix, rect);
BWocrseven=imcrop(BWocrseven, rect);
BWocreight=imcrop(BWocreight, rect);
BWocrnine=imcrop(BWocrnine, rect);

%The top of all the images are turned black to remove noise.

BWocrzero(1:15,:)=0;
BWocrone(1:15,:)=0;
BWocrtwo(1:15,:)=0;
BWocrthree(1:15,:)=0;
BWocrfour(1:15,:)=0;
BWocrfive(1:15,:)=0;
BWocrsix(1:15,:)=0;
BWocrseven(1:15,:)=0;
BWocreight(1:15,:)=0;
BWocrnine(1:15,:)=0;

%The remaining artifacts are turned into objects using bwboundaries, which
%returns coordinates of tracing the outside of objects.
zerocircles=bwboundaries(BWocrzero, 'noholes');
onecircles=bwboundaries(BWocrone, 'noholes');
twocircles=bwboundaries(BWocrtwo, 'noholes');
threecircles=bwboundaries(BWocrthree, 'noholes');
fourcircles=bwboundaries(BWocrfour, 'noholes');
fivecircles=bwboundaries(BWocrfive, 'noholes');
sixcircles=bwboundaries(BWocrsix, 'noholes');
sevencircles=bwboundaries(BWocrseven, 'noholes');
eightcircles=bwboundaries(BWocreight, 'noholes');
ninecircles=bwboundaries(BWocrnine, 'noholes');