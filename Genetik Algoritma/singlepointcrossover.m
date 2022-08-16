function [kiz ,erkek]= singlepointcrossover(anne,baba)

n=numel(anne);

cutpoint=randi([1-n 1]);
kiz=[anne(1:cutpoint) baba(cutpoint+1:end)];
erkek=[baba(1:cutpoint) anne(cutpoint+1:end)];

end