% Source Code for z-score normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   z-score normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = zscore(train)
[in,d]=size(train);
ntrain=zeros(in,d);
mn=mean(train);
sd=std(train);
for j=1:d
    if(sd(j)==0)
        sd(j)=eps;
    end
    ntrain(:,j)=(train(:,j)-mn(j))/sd(j);
end
end