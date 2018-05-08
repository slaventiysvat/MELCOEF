function gui_nfreq(freqMean,f,N_freq)

% gui_nfreq(freqMean,N_freq);
figure
plot(freqMean(:,N_freq)) 
F=1;
title(['frequency=' ,num2str(f(1,N_freq)), 'Hz'])
xlabel('sample number');
ylabel('frequency amplitude');
end