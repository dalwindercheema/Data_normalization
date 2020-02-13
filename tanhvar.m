% Source Code for "tanh variant" normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   "tanh variant" normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = tanhvar( train )
[in,d]=size(train);
ntrain=zeros(in,d);
mn=mean(train);
sd=std(train);
for t=1:d
    if(sd(t)==0)
        sd(t)=eps;
    end
    tmp=(train(:,t)-mn(t))/sd(t);
    ntrain(:,t)=0.5*(tanh(0.01*(tmp))+1);
end
end