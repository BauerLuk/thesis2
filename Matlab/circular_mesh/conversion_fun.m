function [ out ] = conversion_fun(r,ind,rmin,rmax,gSize,coord_system)
%CONVERSION_FUN Converts indices (i,j) back to cartesian coordinates [x,y]

if coord_system == 1

    if ind==1
        out = (rmin + (r(1)-1)/gSize(1)*(rmax-rmin))*cos((r(2)-1)/gSize(2)*2*pi);
    elseif ind==2
        out = (rmin + (r(1)-1)/gSize(1)*(rmax-rmin))*sin((r(2)-1)/gSize(2)*2*pi);
    else
        out = nan;
    end

elseif coord_system == 2

    if ind==1
        out = r(1)/gSize(1);
    elseif ind==2
        out = (r(2)-1)/gSize(2)*2*pi;
    else
        out = nan;
    end
else
    out = nan;
end

end