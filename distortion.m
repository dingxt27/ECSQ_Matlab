function [d] = distortion (a,b,a2,b2)
%     intG3 = getSecondMoment(b) - getSecondMoment(a);
    intG3 = b2 - a2;
    miu = centroid(a,b);
    intG = getZeroMoment (b) - getZeroMoment (a);
    d = intG3 - miu.^2*(intG);
end
