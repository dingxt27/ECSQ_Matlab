function [p2] = getSecondMoment(x)
    fun =@(x) 1/sqrt(2*pi)*exp(-1/2*x.^2).*x.^2;
    p2 = integral (fun, -30,x);
end