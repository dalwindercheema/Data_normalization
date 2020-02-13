% Source Code for Power Transformation (PT) normalization
%
% Input Parameters:
% train:    training data where rows represent instances and columns 
%           represents  features
%
% Output Parameters: 
% ntrain:   PT normalized training data
%
% If you use the code, please cite the paper:
%
% Dalwinder Singh and Birmohan Singh,"Investigating the impact of data 
% normalization on classification performance", Applied Soft Computing,
% 2019.
% https://doi.org/10.1016/j.asoc.2019.105524

function ntrain = powernorm( train )
[in,d]=size(train);
ntrain=zeros(in,d);
tmp_train=zeros(in,d);
mn=min(train);
mx=max(train);
for j=1:d
    if(mn(j)<0 && mx(j)<0)
        tmp_train(:,j)=abs(train(:,j));
    elseif(mn(j)<0)
        tmp=(train(:,j)-mn(j))/(mx(j)-mn(j));
        tmp_train(:,j)=(tmp*(mx(j)-mn(j)));
    else
        tmp_train(:,j)=train(:,j);
    end
end
tmp_train=sqrt(tmp_train);
mnt=mean(tmp_train);
for j=1:d
    ntrain(:,j)=tmp_train(:,j)-mnt(j);
end
end