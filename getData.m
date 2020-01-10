function [trainingData,labels] = getData(path)

% Specify the folder where the files live.
myFolder = path;
labels=zeros(1288,1);
trainingData=zeros(1288,250*250);
countForTrainingData=1;

% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

targetFaces=["Ariel_Sharon_",'Colin_Powell_','Donald_Rumsfeld_','George_W_Bush_','Gerhard_Schroeder_','Hugo_Chavez_','Tony_Blair_'];

for aux = 1:7
    % Get a list of all files in the folder with the desired file name pattern.
    filePattern = fullfile(myFolder, strcat(targetFaces(aux),'*.jpg')); % Change to whatever pattern you need.
    theFiles = dir(filePattern);
   
    for k = 1 : length(theFiles)
      baseFileName = theFiles(k).name;
      fullFileName = fullfile(myFolder, baseFileName);
      fprintf(1, 'Now reading %s\n', fullFileName);
      % Now do whatever you want with this file name,
      % such as reading it in as an image array with imread()
      imageArray = rgb2gray(imread(fullFileName));
      trainingData(countForTrainingData,:)=reshape(imageArray,1,[]);
      labels(countForTrainingData)=aux;
      countForTrainingData=countForTrainingData+1;
    end
end



end

