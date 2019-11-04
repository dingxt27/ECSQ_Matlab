function [p1] = getFirstMoment(x)
    p1 = -1/sqrt(2*pi)*exp(-x^2./2);
end