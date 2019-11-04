% clc
% clear all
%ECSQ
D_ecsq = [0.977,0.8576,0.7202,0.5641,0.1455,0.0729,0.0367,0.0293,0.0074,0.006,0.0038,0.00083264,0.00040817,0.00016872,0.00010207,0.00001875];
H_ecsq = [0.0141,0.1053,0.2351,0.4163,1.644,2.1432,2.6389,2.802,3.7894,3.9404,4.2675,5.3696,5.8839,6.5211,6.8837,8.106];

snr_ecsq = -10*log10(D_ecsq);
rate_D_ecsq = -0.5*log2(D_ecsq);


%uniform scalar quantizer, B=6
% n = 10000;
% N = n+2;
n=1;
 for k = 1:30
    N = n+2;
     [D_usq(k),H_usq(k)] = usq(n,N);
     n = n + 5;
 end
snr_usq = -10*log10(D_usq);
rate_D_usq = -0.5*log2(D_usq);

%max-loyld
D_max = [1,0.3634,0.1902,0.1175,0.07994,0.05798,0.04400,0.03454,0.02785,0.02293,0.01922,0.01634,0.01406,0.01223,0.01073,0.009497,0.008463,0.007589,0.006844,0.006203,0.005648,0.005165,0.004741,0.004367,0.004036,0.003741,0.003477,0.003240,0.003027,0.002834,0.002658,0.002499,0.002354,0.002220,0.002097,0.001985];
H_max = [0,1,1.536,1.911,2.203,2.443,2.647,2.825,2.983,3.125,3.253,3.372,3.481,3.582,3.677,3.765,3.849,3.928,4.002,4.074,4.141,4.206,4.268,4.327,4.384,4.439,4.491,4.542,4.591,4.639,4.685,4.730,4.773,4.815,4.856,4.895];
snr_max = -10*log10(D_max);
rate_D_max = -0.5*log2(D_max);

%optimized entropy with snr(r) = 20*r/log2(10)
 Rate_opt = [1.268,1.644,2.1432,2.6389,2.802,3.7894,3.9404,4.2675,5.3696,5.8839,6.5211,6.8837,8.106];
 snr_Ropt = 20*Rate_opt./log2(10);
plot(H_ecsq,snr_ecsq,'b--*',H_usq,snr_usq,'r--O',H_max,snr_max,'g--*',Rate_opt,snr_Ropt,'p--')
title ('SNR vs Entropy');
xlabel('Entropy');
ylabel('SNR');
h = legend('ECSQ','USQ','Max-loyld','opt');
set(h,'Interpreter','none');

% %plot Rate-distortion funciton
%  x = -6:0.005:6; %M = 2400
% pd = makedist('Normal');
% %y = gaussmf(x,[1 0]);
% pdf_normal = pdf(pd,x);
% plot(x,pdf_normal,'g',[-6,-6],[0,0.5],'b',[5.515,5.515],[0,0.5],'b',[4.97,4.97],[0,0.5],'b',[4.43,4.43],[0,0.5],'b',[3.89,3.89],[0,0.5],'b',[3.355,3.355],[0,0.5],'b',[2.825,2.825],[0,0.5],'b',[2.3,2.3],[0,0.5],'b',[1.775,1.775],[0,0.5],'b',[1.255,1.255],[0,0.5],'b',[0.735,0.735],[0,0.5],'b',[0.215,0.215],[0,0.5],'b',[-0.305,-0.305],[0,0.5],'b',[-0.825,-0.825],[0,0.5],'b',[-1.345,-1.345],[0,0.5],'b',[-1.865,-1.865],[0,0.5],'b',[-2.39,-2.39],[0,0.5],'b',[-2.915,-2.915],[0,0.5],'b',[-3.445,-3.445],[0,0.5],'b',[-3.98,-3.98],[0,0.5],'b',[-4.52,-4.52],[0,0.5],'b',[-5.065,-5.065],[0,0.5],'b',[-5.61,-5.61],[0,0.5],'b',[6,6],[0,0.5],'b',[-5.74,-5.74],[0,0.1],'r',[-5.22,-5.22],[0,0.1],'r',[-4.69,-4.69],[0,0.1],'r',[-4.16,-4.16],[0,0.1],'r',[-3.63,-3.63],[0,0.1],'r',[-3.1,-3.1],[0,0.1],'r',[-2.59,-2.59],[0,0.1],'r',[-2.08,-2.08],[0,0.1],'r',[-1.57,-1.57],[0,0.1],'r',[-1.06,-1.06],[0,0.1],'r',[-0.5524,-0.5524],[0,0.1],'r',[-0.044,-0.044],[0,0.1],'r',[0.464,0.464],[0,0.1],'r',[0.973,0.973],[0,0.1],'r',[1.48,1.48],[0,0.1],'r',[1.99,1.99],[0,0.1],'r',[2.5,2.5],[0,0.1],'r',[3.02,3.02],[0,0.1],'r',[3.541,3.541],[0,0.1],'r',[4.067,4.067],[0,0.1],'r',[4.597,4.597],[0,0.1],'r',[5.13,5.13],[0,0.1],'r',[5.66,5.66],[0,0.1],'r');
% title('lambda=0.03');