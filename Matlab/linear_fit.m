function [param] = linear_fit(X,Y)
if size(X)~=size(Y)
   error('size(X) and size(Y) must agree') 
end
if size(X,1)>1    
    M = [X,ones(size(X))];    
    param = M\Y;
else
    M = [X.',ones(size(X.'))];    
    param = M\Y.';
end
end