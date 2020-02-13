% Source Code for Max normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   Max normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = maxnorm( train )
[in,d]=size(train);
ntrain=zeros(in,d);
mx=max(abs(train));
for j=1:d
    ntrain(:,j)=train(:,j)/mx(j);
end
end