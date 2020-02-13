% Source Code for Median and Median Absolute Deviation (MMAD) normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   MMAD normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = mmad( train )
[in,d]=size(train);
ntrain=zeros(in,d);
md=median(train);
madvalue=mad(train,1);
for j=1:d
    if(madvalue(j)==0)
        madvalue(j)=eps;
    end
    ntrain(:,j)=(train(:,j)-md(j))/madvalue(j);
end
end