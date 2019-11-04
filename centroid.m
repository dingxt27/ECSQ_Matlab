function [miu] = centroid(a,b)
    intG1 = getFirstMoment(b) - getFirstMoment(a);
    intG2 = getZeroMoment (b) - getZeroMoment (a);
    miu = intG1./intG2;
end
