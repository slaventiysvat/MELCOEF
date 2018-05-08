function [mels allFitMel] = ctrl_mel_coef(res_val,nMelFilt,fbank,priznakArr)
L=length(res_val(1,:));
UniArr=zeros(1,L);
      g=1;
    mel=zeros(1,nMelFilt);
    while g<=length(res_val(:,1))
      
     for i=1:nMelFilt
         if priznakArr(i)>0
            Mel_coef(i,:)=res_val(g,:).*fbank(i,:);
            Mel_coef(i,:)=Mel_coef(i,:).^2;
            mel(i)= sum(Mel_coef(i,:));
            
            mel(i)=log(mel(i));
         else
            Mel_coef(i,:)=res_val(g,:).*0;
            mel(i)= sum(Mel_coef(i,:));
            mel(i)=log(mel(i));
         end
     end
     
     for i=1:1:nMelFilt
       for  j=1:1:L
         
             if Mel_coef(i,j) > 0 || Mel_coef(i,j) < 0 
                 UniArr(j)=Mel_coef(i,j);
%              else Mel_coef(i,j)==0
%                  UniArr(j)=0;
             end
       end
       
     end
     Ui(g,:)= UniArr;
     mels(g,:)=mel;
     g=g+1; 
    end
allFitMel=UniArr;
end