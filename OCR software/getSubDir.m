function getSubDir(currentDir)
  list = dir(currentDir)  % Listing files and folders in currentDir
  list = list(~ismember({list.name},{'.' '..'}))  % Removing the entries '.' and '..'
  %keyboard
  list = list(arrayfun(@(x)(x.isdir),list))   % Finding the directories from list
% keyboard
  for ii=1:numel(list)
      disp(list(ii).name)  % Displaying the name of the directory
      %keyboard
      RunEmOCRall
       disp('In the for loop')
     %count=ii
 % keyboard
      getSubDir( strcat(currentDir,'\',list(ii).name)); % Recursively calling the function to get the sub directories
     
  end
end

  

