test=[[1,2,3];[2,3,4];[3,4,5]];

eigFaces=eigenfaces(test,100);
meanFace=mean(test);

[coeff,ceva,ceva2] = pca(test,'Economy',false);
projectedTest=normalize(test)*eigFaces;

projectedTarget= ([3,4,5] - meanFace)*eigFaces;


labels=[1,2,3];

aux=KNN(1,test,labels,[3,4,5]);
[quality,approxEig]=lanczos(cov(normalize(test)),2);


[trainingData,labels]=getData('D:\Pentru adina\targetFaces');

eigFaces=optimizedPCA(trainingData,100);
meanFace=mean(trainingData);
projectedTest=normalize(trainingData)*eigFaces;

targetFace=trainingData(1194,:);
projectedTargetFace=(targetFace-meanFace)*eigFaces;

aux=KNN(5,projectedTest,labels,projectedTargetFace);
ceva=1;