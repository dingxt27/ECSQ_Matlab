function [h] = entropy(a,b,lambda)
    intG = b-a;
    h = lambda*(intG)*log2(1/intG);
end
