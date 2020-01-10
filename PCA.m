function [sortedVectors,sortedValues] = PCA(covarianceMat)
%PCA calculates the principal components of the given covariance matrix

[vectors,values]=eig(covarianceMat);
eigenValues=diag(values);

[vals,indexes] = sort(eigenValues,'descend') ;

sortedValues = values(indexes);
sortedVectors= vectors(:,indexes);

end

