function [eigFaces] = optimizedPCA(trainingData,varianceThreshold)

[vectors,projections,values] = pca(trainingData);

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

