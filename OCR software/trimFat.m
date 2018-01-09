%This portion of the RunEm code intends to remove objects with
%circumferences of less than 3 or more than 40, because the eroded numbers
%tend to fall within this size range. It works by making an object equal to
%1 if it fails to fall within the size range, and then erasing all objects
%that are equal to 1.

zerocircles1=cell(16,1);
try
    for num=1:size(zerocircles, 1)
    if size(zerocircles{num,1}, 1) < 3 || size(zerocircles{num,1}, 1) > 40
       zerocircles1=zerocircles1
    else
        zerocircles1{num,:}=zerocircles{num,1};
    end
    end
    for check=1:3
    if zerocircles1{num, 1}(check,1)==1
        zerocircles1(num, :)=[]
    end
    
    end
catch disp('No numbers')
end
zerocircles1=zerocircles1(~cellfun(@isempty, zerocircles1));
onecircles1=cell(16,1);
try
    for num=1:size(onecircles, 1)
    if size(onecircles{num,1}, 1) < 3 || size(onecircles{num,1}, 1) > 40
        onecircles1=onecircles1
    else
        onecircles1{num,:}=onecircles{num,1};
    end
    end
    for check=1:3
    if onecircles1{num, 1}(check,1)==1
        onecircles1(num, :)=[]
    end
  
    
    end
catch disp('No numbers')
end
onecircles1=onecircles1(~cellfun(@isempty, onecircles1));
twocircles1=cell(16,1);
try
    for num=1:size(twocircles, 1)
    if size(twocircles{num,1}, 1) < 3 || size(twocircles{num,1}, 1) > 40
        twocircles1=twocircles1
    else
        twocircles1{num,:}=twocircles{num,1};
    end
    end
    for check=1:3
    if twocircles1{num, 1}(check,1)==1
        twocircles1(num, :)=[]
    end
    end
catch disp('No numbers')
end
twocircles1=twocircles1(~cellfun(@isempty, twocircles1));
threecircles1=cell(16,1);
try
    for num=1:size(threecircles, 1)
    if size(threecircles{num,1}, 1) < 3 || size(threecircles{num,1}, 1) > 40
        threecircles1=threecircles1
    else
        threecircles1{num,:}=threecircles{num,1};
    end
    end
    for check=1:3
    if threecircles1{num, 1}(check,1)==1
        threecircles1(num, :)=[]
    end
    
    end
catch disp('No numbers')
end
threecircles1=threecircles1(~cellfun(@isempty, threecircles1));
fourcircles1=cell(16,1);
try
    for num=1:size(fourcircles, 1)
    if size(fourcircles{num,1}, 1) < 3 || size(fourcircles{num,1}, 1) > 40
        fourcircles1=fourcircles1
    else
        fourcircles1{num,:}=fourcircles{num,1}
    end
    end
    for check=1:3
    if fourcircles1{num, 1}(check,1)==1
        fourcircles1(num, :)=[]
    end
   
    
    end
catch disp('No numbers')
end
fourcircles1=fourcircles1(~cellfun(@isempty, fourcircles1));
fivecircles1=cell(16,1);
try
    for num=1:size(fivecircles, 1)
    if size(fivecircles{num,1}, 1) < 3 || size(fivecircles{num,1}, 1) > 40
        fivecircles1=fivecircles1
    else
        fivecircles1{num,:}=fivecircles{num,1};
    end
    end
    for check=1:3
    if fivecircles1{num, 1}(check,1)==1 
        fivecircles1(num, :)=[]
    end
 
    
    end
catch disp('No numbers')
end
fivecircles1=fivecircles1(~cellfun(@isempty, fivecircles1));
sixcircles1=cell(16,1);
try
    for num=1:size(sixcircles, 1)
    if size(sixcircles{num,1}, 1) < 3 || size(sixcircles{num,1}, 1) > 40
        sixcircles1=sixcircles1
    else
        sixcircles1{num, :}=sixcircles{num,1};
    end
    end
    for check=1:3
    if sixcircles1{num, 1}(check,1)==1
        sixcircles1(num, :)=[]
    end
    
    
    end
catch disp('No numbers')
end
sixcircles1=sixcircles1(~cellfun(@isempty, sixcircles1));
sevencircles1=cell(16,1);
try
    for num=1:size(sevencircles, 1)
    if size(sevencircles{num,1}, 1) < 3 || size(sevencircles{num,1}, 1) > 40
        sevencircles1=sevencircles1
    else
        sevencircles1{num,:}=sevencircles{num,1};
    end
    end
    for check=1:3
    if sevencircles1{num, 1}(check,1)==1
        sevencircles1(num, :)=[]
    end
   
    
    end
catch disp('No numbers')
end
sevencircles1=sevencircles1(~cellfun(@isempty, sevencircles1));
eightcircles1=cell(16,1);
try
    for num=1:size(eightcircles, 1)
    if size(eightcircles{num,1}, 1) < 3 || size(eightcircles{num,1}, 1) > 40
        eightcircles1=eightcircles1
    else
        eightcircles1{num,:}=eightcircles{num,1};
    end
    end
    for check=1:3
    if eightcircles1{num, 1}(check,1)==1
        eightcircles1(num, :)=[]
    
    end
    
    end
catch disp('No numbers')
end
eightcircles1=eightcircles1(~cellfun(@isempty, eightcircles1));
ninecircles1=cell(16,1);
try
    for num=1:size(ninecircles, 1)
    if size(ninecircles{num,1}, 1) < 3 || size(ninecircles{num,1}, 1) > 40
        ninecircles1=ninecircles1;
    else
        ninecircles1{num,:}=ninecircles{num,1};
    end
    end
    for check=1:3
    if ninecircles1{num, 1}(check,1)==1
        ninecircles1(num, :)=[]
    end
    
    
    end
catch disp('No numbers')
end
ninecircles1=ninecircles1(~cellfun(@isempty, ninecircles1));
