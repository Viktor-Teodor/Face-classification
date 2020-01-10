function [eigFaces] = eigenfaces(trainingData,varianceThreshold)
%eigenfaces is a function that reduces the dimensions of the N by D data
%that is represented by face images using the PCA algorithm and the 
%given threshold for the cumulative variance

[vectors, values] = PCA(cov(normalize(trainingData)));
totalVariance = cumsum(values);
partialVariance=0;

for i= 1:size(vectors,2)
    if partialVariance >= totalVariance*(varianceThreshold /100)
        break
    end
    partialVariance = partialVariance + values(i);
end

eigFaces=vectors(:,1:i);

end

