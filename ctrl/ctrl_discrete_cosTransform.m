function C1 = ctrl_discrete_cosTransform(gg,nMelFilt)
N=1;
L=length(gg(:,1));
% S=gg(1,:);
        for N=1:1:L
            for n=1:1:nMelFilt
                    for m=1:1:nMelFilt

                        C(m)=gg(N,m)*cos(((pi*n)*((m+(1/2))))/nMelFilt);

                    end
                    C1(N,n)=sum(C);
            end
        end
end