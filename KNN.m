function [labelTestInstance] = KNN(noNeighbours, trainingData, labels, testInstance)
%Implementation of KNN algorithm using the euclidean metric
%Note that the testInstance must be in the same space as the trainingData

distances=zeros(size(trainingData,1),1);

for i = 1:size(trainingData,1)
    distances(i)=euclid(trainingData(i,:),testInstance);
end

[vals,indexes] = sort(distances);

sortedLabels=labels(indexes);

[C,ia,ic] = unique(sortedLabels(1:noNeighbours));
a_counts = accumarray(ic,1);
value_counts = [C, a_counts];

maximumNumberOfAppearances=0;
maximumClass=0;

for i = 1:size(value_counts)
    if value_counts(i,2)>maximumNumberOfAppearances
        maximumNumberOfAppearances=value_counts(i,2);
        maximumClass=value_counts(i,1);
    end
end

labelTestInstance=maximumClass;
end

