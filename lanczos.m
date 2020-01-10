function [quality,approximatedEig] = lanczos(trainingData, m)

[n,k] = size(trainingData);
V = zeros(k,m+1);
V(:,2) = rand(k,1);
V(:,2)=V(:,2)/norm(V(:,2),2);
beta(2)=0;

for j=2:m+2

    w = trainingData*V(:,j) - beta(j)*V(:,j-1);
    alpha(j) = w'*V(:,j);
    w = w - alpha(j)*V(:,j);
    beta(j+1) = norm(w,2);
    V(:,j+1) = w/beta(j+1);
end

T=sparse(m+1,m+1);
for i=2:m+1
    T(i-1,i-1)=alpha(i);
    T(i-1,i)=beta(i+1);
    T(i,i-1)=beta(i+1);
end 

T(m+1,m+1)=alpha(m+2);
V = V(:,2:end-1);
quality=norm(V*T*V'-trainingData);
approximatedEig=eigs(T)';


end
