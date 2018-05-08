 function gui_meshplot(new_wector,fbank,gg,C1,nMelFilt,f)

figure
   subplot(221)
   plot(new_wector)
   subplot(222)
   plot(f,  fbank(1,:));
   title(['triangular filter bank N=', num2str(nMelFilt)]);
   xlabel('frequency scale F');
   hold on
   for i=2:1:nMelFilt
       plot(f,  fbank(i,:));
   
   end      
    grid on
% 
    subplot(223)
    mesh(gg);
    view([90 0]);
    title('Mel coefficients')
    subplot(224)
    mesh(C1);
    view([90 0]);
    title('Mel-Capstr coefficients')
 end
