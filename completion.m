%数据补全
%输入A是需要补全的数据列矢量A，输入k是补全的模式
%输出A1是补全后的数据列矢量
function [A1]=completion(A,k);
A2=A;
A2(isnan(A2(:,1)),:)=[];%补充缺失值
if k==1%平均值补全
    amean=mean(A2);
    A(isnan(A(:,1)),:)=amean;
elseif k==2 %众数补全
    amode=mode(A2);
    A(isnan(A(:,1)),:)=amode;
elseif k==3%0补全
    A(isnan(A(:,1)),:)=0;
end
A1=A;

    
    


