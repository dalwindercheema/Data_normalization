% Source Code for Hyperbolic Tangent (HT) normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   HT normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = hypertan( train )
[in,d]=size(train);
ntrain=zeros(in,d);
mn=mean(train);
sd=std(train);
for j=1:d
    tmp=(train(:,j)-mn(j))/sd(j);
    ntrain(:,j)=(1-exp(-tmp))./(1+exp(-tmp));
end
end