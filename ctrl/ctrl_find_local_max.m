function  [f1,mass_max] = ctrl_find_local_max(res_val,f)
%this function return local maximum for each array which she get
%for example
% clear
% clc
% load handel.mat
% filename = 'handel.wav';
% audiowrite(filename,y,Fs);
% clear y Fs
% [y,Fs] = audioread('handel.wav');
% sound(y,Fs)
% y=y(1:1025);
% rez_val= fft(y);
% L=length(y);
% P2 = abs(rez_val/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% rez_val=P1';
% [f1,massMax] = ctrl_find_local_max(rez_val,f);
% figure
% plot(f1,massMax,'r')
% title('the result of finding local maxima in the spectrum');
% hold on
% plot(f,rez_val(1,:))
% legend('highs', 'signal spectrum');
% grid on
% differentiation by the two-sided difference method
for i=2:1:length(res_val(1,:))-1
    f1=res_val(1,i-1);
    f2=res_val(1,i+1);
    diff_f(i)=(f2-f1)/((i+1)-(i-1));
    
end
% we find local variations of the function

    for  i=2:1:length(res_val(1,:))-2

       if diff_f(i-1) > 0 && diff_f(i+1) < 0 
           mass_check(i)=1;
       else
           mass_check(i)=0;
       end
       
       if  mass_check(i)==1
           mass_max(i)=res_val(1,i+1);
       else
           mass_max(i)=0;
       end
    end
    f1=f(1:length(res_val(1,:))-2);
end

