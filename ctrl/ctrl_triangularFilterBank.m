function fbank = ctrl_triangularFilterBank(Fl,Fh,N,Fs,sampleLength)
%transform frequency to mel 
nMelFilt=N;
fmelL=1127*log(1 + (Fl / 700) );
fmelH=1127*log(1 + (Fh / 700) );
ctrlPointFilt=nMelFilt + 2;
n=(fmelH-fmelL)/(nMelFilt+1);%20 filters, 22 fixed point for filters
FMel=fmelL:n:fmelH;
%
     for k=1:1:ctrlPointFilt

        h(k)=700*((exp(FMel(k)/1127))-1);

    end

    %get step point for each filter    
    for i=1:1:ctrlPointFilt
         
        shag(i) = floor((((sampleLength/2) + 1) * h(i)) / Fs);
    
    end
    
k=1;
%create filterbank
fbank=zeros(nMelFilt,floor((sampleLength/2)+1));
for i=2:1:nMelFilt+1
    f_m_minus = shag(i - 1);
     f_m = shag(i);
      f_m_plus = shag(i + 1);
      
          for k=1+f_m_minus:f_m

          fbank(i - 1, k) = (k - shag(i - 1)) / (shag(i) - shag(i - 1));

          end

          for k=1+f_m:f_m_plus

           fbank(i - 1, k) = (shag(i + 1) - k) / (shag(i + 1) - shag(i));

          end
end
% %==========================================================================
end