%This final script orders the 16 numbers from left to right. The x
%positions of each number are sorted into variables and ordered. 

%try
zeroposit=cat(2,xzero,yzero);
oneposit=cat(2, xone, yone);
twoposit=cat(2,xtwo,ytwo);
threeposit=cat(2,xthree,ythree);
fourposit=cat(2,xfour,yfour);
fiveposit=cat(2,xfive,yfive);
sixposit=cat(2,xsix,ysix);
sevenposit=cat(2,xseven,yseven);
eightposit=cat(2,xeight,yeight);
nineposit=cat(2,xnine,ynine);
xall=cat(1,xzero,xone,xtwo,xthree,xfour,xfive,xsix,xseven,xeight,xnine);
xallsorted=sort(xall,'ascend');
numzeros=size(xzero,1);

numones=size(xone,1);

numtwos=size(xtwo,1);

numthrees=size(xthree,1);

numfours=size(xfour,1);

numfives=size(xfive,1);

numsixes=size(xsix,1);

numsevens=size(xseven,1);

numeights=size(xeight,1);

numnines=size(xnine,1);
wherenum=[];

%This loop finds the position of the numbers by comparing each number
%against the absolute x sorting. If that number matches, the exes position
%in wherenum becomes the value of that number. 
for exes=1:16
    for zerocount=1:numzeros
    if xallsorted(exes,1)==xzero(zerocount)
        wherenum(exes,1)=0;
    end
    end
    for onecount=1:numones
    if xallsorted(exes,1)==xone(onecount)
        wherenum(exes,1)=1;
    end
    end
    for twocount=1:numtwos
    if xallsorted(exes,1)==xtwo(twocount)
        wherenum(exes,1)=2;
    end
    end
    for threecount=1:numthrees
    if xallsorted(exes,1)==xthree(threecount)
        wherenum(exes,1)=3;
    end
    end
    for fourcount=1:numfours
    if xallsorted(exes,1)==xfour(fourcount)
        wherenum(exes,1)=4;
    end
    end
    for fivecount=1:numfives
    if xallsorted(exes,1)==xfive(fivecount)
        wherenum(exes,1)=5;
    end
    end
    for sixcount=1:numsixes
    if xallsorted(exes,1)==xsix(sixcount)
        wherenum(exes,1)=6;
    end
    end
 
       for sevencount=1:numsevens
    if xallsorted(exes,1)==xseven(sevencount)
        wherenum(exes,1)=7;
    end
    end
    for eightcount=1:numeights
    if xallsorted(exes,1)==xeight(eightcount)
        wherenum(exes,1)=8;
    end
    end
    for ninecount=1:numnines
    if xallsorted(exes,1)==xnine(ninecount)
        wherenum(exes,1)=9;
    end
    end
   
end

%The guess numbers are assigned positions 

FileNameGuessOCR=wherenum;
OCRnum1_1=FileNameGuessOCR(1,1);
OCRnum1_1=num2str(OCRnum1_1);
OCRnum1_2=FileNameGuessOCR(2,1);
OCRnum1_2=num2str(OCRnum1_2);
OCRnum1_3=FileNameGuessOCR(3,1);
OCRnum1_3=num2str(OCRnum1_3);
OCRnum1_4=FileNameGuessOCR(4,1);
OCRnum1_4=num2str(OCRnum1_4);
OCRnum1_5=FileNameGuessOCR(5,1);
OCRnum1_5=num2str(OCRnum1_5);
OCRnum1_6=FileNameGuessOCR(6,1);
OCRnum1_6=num2str(OCRnum1_6);
OCRnum2_1=FileNameGuessOCR(7,1);
OCRnum2_1=num2str(OCRnum2_1);
OCRnum2_2=FileNameGuessOCR(8,1);
OCRnum2_2=num2str(OCRnum2_2);
OCRnum2_3=FileNameGuessOCR(9,1);
OCRnum2_3=num2str(OCRnum2_3);
OCRnum2_4=FileNameGuessOCR(10,1);
OCRnum2_4=num2str(OCRnum2_4);
OCRnum3_1=FileNameGuessOCR(11,1);
OCRnum3_1=num2str(OCRnum3_1);
OCRnum3_2=FileNameGuessOCR(12,1);
OCRnum3_2=num2str(OCRnum3_2);
OCRnum3_3=FileNameGuessOCR(13,1);
OCRnum3_3=num2str(OCRnum3_3);
OCRnum3_4=FileNameGuessOCR(14,1);
OCRnum3_4=num2str(OCRnum3_4);
OCRnum4_1=FileNameGuessOCR(15,1);
OCRnum4_1=num2str(OCRnum4_1);
OCRnum4_2=FileNameGuessOCR(16,1);
OCRnum4_2=num2str(OCRnum4_2);

Underscore={num2str('_')};

%and concatonated with the underscores so that the guess resembles a real
%filename and can be compared. 

OCRdate={OCRnum1_1,OCRnum1_2,OCRnum1_3,OCRnum1_4,OCRnum1_5,OCRnum1_6};
OCRtime={OCRnum2_1,OCRnum2_2,OCRnum2_3,OCRnum2_4};
OCRstation={OCRnum3_1,OCRnum3_2,OCRnum3_3,OCRnum3_4};
OCRtype={OCRnum4_1,OCRnum4_2};

FileNameGuessOCR=horzcat(OCRdate, Underscore,OCRtime,Underscore,OCRstation,Underscore,OCRtype);
FileNameGuessOCR=char(FileNameGuessOCR)';

[pathstr, FileName, ext] = fileparts(image)
%catch FileNameGuessOCR=char('xxxxxx_xxxx_xxxx_xx')
%end
