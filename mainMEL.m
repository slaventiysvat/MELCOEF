clear
clc
% this function returns the mel-capstr coefficients for each sample in the signal
% signal has length, it contains vectors = length (sample size)
% of the sample size, we have to shield knowing the sampling rate and the period that we need
% for example:
%Fs=44100; we need length sample = 25 - 30ms
%floor(Fs*length sample)=sampleSize;
%floor(44100*25*10^-3)~=1128
%in my case I chose 50ms (2048)
%==========================================================================
Path='/mnt/work/develop/matlab/git/AudioFilter/AudioAnalizer/OriginalSignal/female_1.wav';
Data=audioinfo(Path);
Fs=Data.SampleRate;
% sampleSize=1128;
sampleSize=2048;
hammingWindow = hamming(2048,'symmetric');
hammingWindow = hammingWindow';
nMelFilt=20;% quantity filters for MFCC analizing
ctrlPointFilt=nMelFilt+2;% quantity points for mel filters
inputSignal=audioread(Path);
a=1;
% inputSignal=inputSignal(30000:42550);
%===================== discrete fourier transform for each sample in audio signal
startSemple=1;
endSemple=sampleSize;
arrayOfPlots=[];
new_wector = get_norm_vektor(inputSignal,sampleSize);%returns an array of multiples of "sampleSize"
% lenghtSig=length(new_wector);
% endIterator = lenghtSig/(sampleSize/2);
% proz=[15 25 35 45 55 65 75 85 95 100];
% otchet=proz.*512/100;
% otchet=[];
%25%=128
%50%=256
%75%=384
degreeOfOverlap=sampleSize/2;%50 - % overlap factor for sample/overlap between two adjacent(neighboring) samples
[plotMass,res_val,f] = ctrl_windowFurierHamm(inputSignal,Fs,sampleSize,degreeOfOverlap);
% for i=1:1:length(res_val(:,1))
% res_val1=res_val(i,:);
% [f1,mass(i,:)] = ctrl_find_local_max(res_val1,f);
% 
% end
% i=0;
% massMax=mass;
% N_freq=5;
% strobSize=3;
% freqMean=ctrl_find_Freq_Stat(massMax,f1,strobSize);
% gui_nfreq(freqMean,f,N_freq);
% gui_mesh(freqMean);

Fl=20;
Fh=44100;
N=20;
Fs=44100;
sampleLength=2048;
fbank = ctrl_triangularFilterBank(Fl,Fh,N,Fs,sampleLength);

filterFlag=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
 
priznakArr= ctrl_choseNumbFilt(filterFlag,nMelFilt);

[mels allFitMel] = ctrl_mel_coef(res_val,nMelFilt,fbank,priznakArr);

C1 = ctrl_discrete_cosTransform(mels,nMelFilt);

gui_meshplot(new_wector,fbank,mels,C1,nMelFilt,f);

   
CC=C1(1,:);
CC=CC./max(CC);

counter=1; 
CC_new=0;
%zeros(length(plotMass(:,1)),2048);
a=1;
while a<=length(plotMass(:,1))
    CC(a,:)=C1(a,:)./max(C1(a,:));
    
for i=1:1:20
    
   while counter<=102
        if counter==102
        CC_n(counter)=CC(a,i);
        break;
        end
        CC_n(counter)=0;
        counter=counter+1;
   end
   counter=1;
    CC_new = [CC_new CC_n];
   
%    CC_new(a,:)=Mask2;
   
end
    CC_new=[CC_new zeros(1,7)];
 CC_arr(a,:)=CC_new;
 CC_new=0;
 CC_n=0;
a=a+1;
end
CC_arr=CC_arr.';
x=CC_arr(:).';
plotMass=plotMass./max(plotMass);
plotMass=plotMass.';
y=plotMass(:).';
  figure
  plot(x,'r')
  hold on
  plot(y)




























% strob=100;
% startStronb=465;
% endStrob=538;
% for i=1:1:576
%     massDiff(i,:)=massMax(i,startStronb:endStrob);
% end
% f1=f(1:1023);
% figure
% plot(f1,massMax(1,:),'r')
% title('результат обнаружения локальных максимумов в спектре');
% hold on
% plot(f,res_val1(1,:))
% legend('максимумы','спектр сигнала');
% grid on
% 
% Arr(1,:)=massDiff(1,18:20);
% f0(1,:)=f(18:20);
% figure
% plot(f0,Arr(1,:))
% hold on
% for i=2:1:576
%     Arr(i,:)=massDiff(i,18:20);
%     f0(i,:)=f(18:20);
% plot(f0(i,:),Arr(i,:))
% end
% A=mean(Arr');
% grid on
