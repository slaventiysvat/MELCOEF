function priznakArr= ctrl_choseNumbFilt(filterFlag,nMelFilt)

[m n]=size(filterFlag);

if n==nMelFilt
priznakArr=filterFlag;
end

if n==1
    B=zeros(1,nMelFilt);
    B(n)=n;
    ind=B(n);
end
if n > 1
    B = sort(filterFlag);
    A = zeros(1,nMelFilt-n,'double');
    B = cat(2,B,A);
    priznakArr=zeros(1,length(B),'double');
    for i=1:1:nMelFilt
        N=B(i);
        if N > 0
            priznakArr(N)=N;
        
        end
    end

end
end