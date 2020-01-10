function [distance] = euclid(firstVector,secondVector)
%this function computes the euclidean distance between 2 points

V = firstVector - secondVector;
distance = sqrt(V * V');
end

