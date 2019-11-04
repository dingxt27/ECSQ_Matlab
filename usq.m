%Uniform Scalar Quantizer
function [sumD_usq,sumH_usq] = usq(n,N)
    s = 12./n;
    USQ = zeros(N,1);
    USQ(1) = -30;
    USQ(N+1) = 30;
    USQ(2) = -6;
    USQ(N) = 6;
    for i = 3:N-1
        USQ(i) = -6+(i-2)*s;
    end

    mov0 = zeros(N+1,1);
    mov1 = zeros(N+1,1);
    mov2 = zeros(N+1,1);

    for k = 1:N+1
        mov0(k) = getZeroMoment(USQ(k));
        mov1(k) = getFirstMoment(USQ(k));
        mov2(k) = getSecondMoment(USQ(k));
    end

    miu_usq = zeros(N,1);
    for j = 1:N
        miu_usq(j)= (-6./n-6)+(j-1)*12./n;
    end

    sumD_usq = 0;
    sumH_usq = 0;
    for l=1:N
        d1 = mov2(l+1)-mov2(l);
        d2 = 2*miu_usq(l)*(mov1(l+1)-mov1(l));
        d3 = miu_usq(l)^2*(mov0(l+1)-mov0(l));
        sumD_usq = sumD_usq+(d1-d2+d3);
        h = -(mov0(l+1)-mov0(l))*log2(mov0(l+1)-mov0(l));
        sumH_usq = sumH_usq+h;
    end
end
