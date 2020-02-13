% Source Code for "tanh" normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   "tanh" normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = tanhnorm(train)
[in,d]=size(train);
ntrain=zeros(in,d);
for j=1:d
    yt=train(:,j)-median(train(:,j));
    y=abs(yt);
    a = quantile(y,.70);
    b = quantile(y,.85);
    c = quantile(y,.95);
    f=zeros(in,1);
    for t=1:in
        if(y(t)>=0 && y(t)<=a)
            f(t)=yt(t);
        elseif(y(t)>a && y(t)<=b)
            f(t)=a*sign(yt(t));
        elseif(y(t)>b && y(t)<=c)
            f(t)=(a*sign(yt(t)))*((c-y(t))/(c-b));
        elseif(y(t)>c)
            f(t)=0;
        end
    end
    mn=mean(f);
    st=std(f);
    if(st==0)
        st=eps;
    end
    ntrain(:,j)=0.5*(tanh(0.01*((train(:,j)-mn)/st))+1);
end
end