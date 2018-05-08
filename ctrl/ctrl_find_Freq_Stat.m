function freqMean=ctrl_find_Freq_Stat(res_val,f,strobSize)
A=f;
resValLength1=length(res_val(1,:));
resValLength2=length(res_val(:,1));
% tmp1=zeros(1,length(res_val(1,:)));
% tmp=zeros(1,strobSize);
freqMean=zeros(resValLength2,resValLength1);
% freqMean(a,1)
a=1;
while a <resValLength1

tmp1=res_val(:,a);
ind1=length(res_val(:,1))-1;
ind2=length(res_val(:,1));
    tmp(1)=tmp1(1,1);
    tmp(2)=tmp1(2,1);
    freqMean(1,a)=mean(tmp);
    tmp(ind1)=tmp1(ind1,1);
    tmp(ind2)=tmp1(ind2,1);
    freqMean(ind2,a)=mean(tmp);

    for K=2:1:ind1-1
        tmp=[tmp1(K-1,1) tmp1(K,1) tmp1(K+1,1)];
        freqMean(K,a)=mean(tmp);
    end

a=a+1;
end

end