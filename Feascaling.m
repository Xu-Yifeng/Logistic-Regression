%数据特征缩放
%输入P为需要进行特征缩放的数据列矢量
%输出P1为特征缩放后的数据列矢量
function [P1]=Feascaling(P)
[m,n]=size(P);
Pmean=mean(P);%均值
Pstd=std(P);%标准差
for i=1:m
    P1(i,:)=(P(i,:)-Pmean)/(Pstd);%特征缩放
end
