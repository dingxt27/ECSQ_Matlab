clc
clear all;

%generate gaussian source with mean = 0, variance = 1
x = -6:0.005:6; %M = 2400
pd = makedist('Normal');
%y = gaussmf(x,[1 0]);
pdf_normal = pdf(pd,x);
% plot(x,pdf_normal,'Linewidth',2);

B = 6; M = 2400;
gaussian = zeros(M+1,2);
b = 2*B./M;
lambda = 0.03 ;

for i = 1:M+1
    gaussian(i,1) = pdf_normal(i);
    gaussian(i,2) = b*(i-1) - B;
end

minCost = getPartition(lambda, gaussian, M);

%optimal partition
temp = 2402;
t = 1;
while temp>1
    temp = minCost(temp,2);
    optX(t) = temp;
    t = t + 1;
end

%entropy
sumEntropy = 0;
opt_y = zeros(length(optX),1);
n = 2;
sumD = 0;
for k = 1:length(optX)-1
    %entropy
    a = getZeroMoment (gaussian(optX(k),2))- getZeroMoment (gaussian(optX(k+1),2));
    temp1 = -a*log2(a);
    sumEntropy = sumEntropy + temp1;
    %reconstruction level
    y = centroid(gaussian(optX(k+1),2),gaussian(optX(k),2));
    opt_y(n)= y;
    n = n+1;
    %distortion
    d1 = getSecondMoment(gaussian(optX(k),2))-getSecondMoment(gaussian(optX(k+1),2));
    d = d1-y^2*a;
    sumD = sumD + d;
end
a1 = getZeroMoment (6) - getZeroMoment (gaussian(optX(1),2));
sumEntropy = sumEntropy + a1; %Entropy
opt_y(1) = centroid(6,gaussian(optX(1),2));%opt_y is optimal reconstruction level
d2 = getSecondMoment(6)-getSecondMoment(gaussian(optX(1),2));
sumD = sumD + (d2 - opt_y(1)^2*a1);

%number of cells
num_cell = length(optX);

%drawing of partition
cell = zeros(num_cell+1,1);
cell(1) = 6;
for p = 2:num_cell+1
    cell(p) = gaussian(optX(p-1),2);
end

    
    
