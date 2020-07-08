function [ out ] = ind2fun(in,gSize)
%MOD2FUN Takes the indices (i,j) of the vertex and returns the indices of
%the vertices in [0,1]-direction, in the [1,0]-direction and the
%[1,1]-direction, with periodicity in [0,1]-direction

out = cell(3,1);

%neigh1
if (in(1)<gSize(1))
    out{1,1} =  [in(1)+1,in(2)] ;
else
    out{1,1} =  nan(1,2);
end

%neigh2
out{2,1} =  [in(1),mod(in(2),gSize(2))+1];

%neigh3
if (in(1)<gSize(1))
    out{3,1} =  [in(1)+1,mod(in(2),gSize(2))+1] ;
else
    out{3,1} =  nan(1,2);
end

end