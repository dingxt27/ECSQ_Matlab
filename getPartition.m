function [minCost] = getPartition (lambda, gaussian, M)
    mov0 = zeros(M+2,1);
    mov1 = zeros(M+2,1);
    mov2 = zeros(M+2,1);

    mov0(1) = getZeroMoment(-30);
    mov1(1) = getFirstMoment(-30);
    mov2(1) = getSecondMoment(-30);

    for k = 2:M+2
        mov0(k) = getZeroMoment(gaussian(k-1,2));
        mov1(k) = getFirstMoment(gaussian(k-1,2));
        mov2(k) = getSecondMoment(gaussian(k-1,2));
    end

     minCost = zeros(M+2,2);
     minCost(1,:) = [0,0];
     minCost(2,:) = [entropy(-30,gaussian(1,2),lambda),1];

     for m = 2:M+1
         q = 1;
         W = zeros(m,2);
         for u = 0:m-1
                  h = entropy(mov0(u+1),mov0(m+1),lambda);
                  miu = (mov1(m+1) - mov1(u+1))./(mov0(m+1)-mov0(u+1));
                  d = (mov2(m+1)-mov2(u+1))-miu.^2*(mov0(m+1)-mov0(u+1));
                 cost_um = h+d;
                 W(q,1) = minCost(u+1,1) + cost_um;
                 W(q,2) = u;
                 q = q+1;

         end
         newW = sortrows(W);
         minCost(m+1,:) = newW(1,:);
         sprintf('m = %d, u = %d', m, minCost(m+1,2));
     end
     
end


          
              