%Now I am finding their positions in x and y, to later order the numbers
%absolutely. First, each object's x and y values are put into a matrix.
%Then, if objects are less than 300 pixels or more than
%2800 pixels from the left side, they are erased.

xzero=[]
yzero=[]
for cent=1:size(zerocircles1, 1)
    xzero(cent, 1)=mean(zerocircles1{cent,1}(:,2))
    yzero(cent, 1)=mean(zerocircles1{cent,1}(:,1))
end
for xzerocheck=1:size(xzero,1)
    if xzero(xzerocheck)>2800 || xzero(xzerocheck)<300
        xzero(xzerocheck)=0
        yzero(xzerocheck)=0
    end
end

xone=[]
yone=[]
for cent=1:size(onecircles1, 1)
    xone(cent, 1)=mean(onecircles1{cent,1}(:,2))
    yone(cent, 1)=mean(onecircles1{cent,1}(:,1))
end
for onecheck=1:(size(xone,1)-1)
    if xone(onecheck+1)-xone(onecheck)<35
        xone(onecheck+1)=0
        xone(onecheck)=0
        yone(onecheck+1)=0
        yone(onecheck)=0
    end
end
for xonecheck=1:size(xone,1)
    if xone(xonecheck)>2800 || xone(xonecheck)<300
        xone(xonecheck)=0
        yone(xonecheck)=0
    end
end

xtwo=[]
ytwo=[]
for cent=1:size(twocircles1, 1)
    xtwo(cent, 1)=mean(twocircles1{cent,1}(:,2))
    ytwo(cent, 1)=mean(twocircles1{cent,1}(:,1))
end
for xtwocheck=1:size(xtwo,1)
    if xtwo(xtwocheck)>2800 || xtwo(xtwocheck)<300
        xtwo(xtwocheck)=0
        ytwo(xtwocheck)=0
    end
end

xthree=[]
ythree=[]
for cent=1:size(threecircles1, 1)
    xthree(cent, 1)=mean(threecircles1{cent,1}(:,2))
    ythree(cent, 1)=mean(threecircles1{cent,1}(:,1))
end
for xthreecheck=1:size(xthree,1)
    if xthree(xthreecheck)>2800 || xthree(xthreecheck)<300
        xthree(xthreecheck)=0
        ythree(xthreecheck)=0
    end
end

xfour=[]
yfour=[]
for cent=1:size(fourcircles1, 1)
    xfour(cent, 1)=mean(fourcircles1{cent,1}(:,2))
    yfour(cent, 1)=mean(fourcircles1{cent,1}(:,1))
end
for xfourcheck=1:size(xfour,1)
    if xfour(xfourcheck)>2800 || xfour(xfourcheck)<300
        xfour(xfourcheck)=0
        yfour(xfourcheck)=0
    end
end

xfive=[]
yfive=[]
for cent=1:size(fivecircles1, 1)
    xfive(cent, 1)=mean(fivecircles1{cent,1}(:,2))
    yfive(cent, 1)=mean(fivecircles1{cent,1}(:,1))
end
for xfivecheck=1:size(xfive,1)
    if xfive(xfivecheck)>2800 || xfive(xfivecheck)<300
        xfive(xfivecheck)=0
        yfive(xfivecheck)=0
    end
end


xsix=[]
ysix=[]
for cent=1:size(sixcircles1, 1)
    xsix(cent, 1)=mean(sixcircles1{cent,1}(:,2))
    ysix(cent, 1)=mean(sixcircles1{cent,1}(:,1))
end
for xsixcheck=1:size(xsix,1)
    if xsix(xsixcheck)>2800 || xsix(xsixcheck)<300
        xsix(xsixcheck)=0
        ysix(xsixcheck)=0
    end
end

xseven=[]
yseven=[]
for cent=1:size(sevencircles1, 1)
    xseven(cent, 1)=mean(sevencircles1{cent,1}(:,2))
    yseven(cent, 1)=mean(sevencircles1{cent,1}(:,1))
end
for xsevencheck=1:size(xseven,1)
    if xseven(xsevencheck)>2800 || xseven(xsevencheck)<300
        xseven(xsevencheck)=0
        yseven(xsevencheck)=0
    end
end

xeight=[]
yeight=[]
for cent=1:size(eightcircles1, 1)
    xeight(cent, 1)=mean(eightcircles1{cent,1}(:,2))
    yeight(cent, 1)=mean(eightcircles1{cent,1}(:,1))
end
for xeightcheck=1:size(xeight,1)
    if xeight(xeightcheck)>2800 || xeight(xeightcheck)<300
        xeight(xeightcheck)=0
        yeight(xeightcheck)=0
    end
end

xnine=[]
ynine=[]
for cent=1:size(ninecircles1, 1)
    xnine(cent, 1)=mean(ninecircles1{cent,1}(:,2))
    ynine(cent, 1)=mean(ninecircles1{cent,1}(:,1))
end
for xninecheck=1:size(xnine,1)
    if xnine(xninecheck)>2800 || xnine(xninecheck)<300
        xnine(xninecheck)=0
        ynine(xninecheck)=0
    end
end

%Now all of the y values are concatonated. The mode of all of the objects
%is used to check which objects are too far off of the mode to be
%considered numbers. Those who are more than 30 pixels in y away from the
%mode y value are erased. 

all=cat(1, yzero,yone,ytwo,ythree,yfour,yfive,ysix,yseven,yeight,ynine);
all=round(all);
all(all==1)=[];
all(all==0)=[];
freq=mode(all);

for whichzero=1:size(yzero, 1)
    if abs(yzero(whichzero)-freq)>30
       xzero(whichzero,1)=0;
       yzero(whichzero,1)=0;
       
    end
end
xzero(xzero == 0)=[]
yzero(yzero == 0)=[]
for whichone=1:size(yone, 1)
    if abs(yone(whichone)-freq)>30
        xone(whichone,1)=0;
        yone(whichone,1)=0;
       
    end
end
xone(xone == 0)=[]
yone(yone == 0)=[]
if isempty(yone)==1
    xone=[]
    yone=[]
end

for whichtwo=1:size(ytwo, 1)
    if abs(ytwo(whichtwo)-freq)>30
       xtwo(whichtwo,1)=0;
       ytwo(whichtwo,1)=0;
       
    end
end
xtwo(xtwo == 0)=[]
ytwo(ytwo == 0)=[]
if isempty(ytwo)==1
    xtwo=[]
    ytwo=[]
end
for whichthree=1:size(ythree,1)
    if abs(ythree(whichthree)-freq)>30
    xthree(whichthree,1)=0;
    ythree(whichthree,1)=0;
       
    end
end
xthree(xthree == 0)=[]
ythree(ythree == 0)=[]
if isempty(ythree)==1
    xthree=[]
    ythree=[]
end
for whichfour=1:size(yfour,1)
    if abs(yfour(whichfour)-freq)>30
        xfour(whichfour,1)=0;
        yfour(whichfour,1)=0;
       
    end
end
xfour(xfour == 0)=[]
yfour(yfour == 0)=[]
if isempty(yfour)==1
    xfour=[]
    yfour=[]
end
for whichfive=1:size(yfive,1)
    if abs(yfive(whichfive)-freq)>30
        xfive(whichfive,1)=0;
        yfive(whichfive,1)=0;
       
    end
end
xfive(xfive == 0)=[]
yfive(yfive == 0)=[]
if isempty(yfive)==1
    xfive=[]
    yfive=[]
end
for whichsix=1:size(ysix,1)
    if abs(ysix(whichsix)-freq)>30
        xsix(whichsix,1)=0;
        ysix(whichsix,1)=0;
       
    end
end
xsix(xsix == 0)=[]
ysix(ysix == 0)=[]
if isempty(ysix)==1
    xsix=[]
    ysix=[]
end
for whichseven=1:size(yseven,1)
    if abs(yseven(whichseven)-freq)>30
        xseven(whichseven,1)=0;
        yseven(whichseven,1)=0;
        
    end
end
xseven(xseven == 0)=[]
yseven(yseven == 0)=[]
if isempty(yseven)==1
    xseven=[]
    yseven=[]
end
for whicheight=1:size(yeight,1)
    if abs(yeight(whicheight)-freq)>30
        xeight(whicheight,1)=0;
        yeight(whicheight,1)=0;
        
    end
end
xeight(xeight == 0)=[]
yeight(yeight == 0)=[]
if isempty(yeight)==1
    xeight=[]
    yeight=[]
end
for whichnine=1:size(ynine,1)
    if abs(ynine(whichnine)-freq)>30
        xnine(whichnine,1)=0;
        ynine(whichnine,1)=0;
        
    end
end
xnine(xnine == 0)=[]
ynine(ynine == 0)=[]
if isempty(ynine)==1
    xnine=[]
    ynine=[]
end

%If there are 16 numbers, as there should be, the program was likely
%successful.

yall=cat(1,yzero,yone,ytwo,ythree,yfour,yfive,ysix,yseven,yeight,ynine);
if size(yall,1)==16
    disp('okay')
else
    disp('fail')
end
