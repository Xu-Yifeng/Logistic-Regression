%������������
%����PΪ��Ҫ�����������ŵ�������ʸ��
%���P1Ϊ�������ź��������ʸ��
function [P1]=Feascaling(P)
[m,n]=size(P);
Pmean=mean(P);%��ֵ
Pstd=std(P);%��׼��
for i=1:m
    P1(i,:)=(P(i,:)-Pmean)/(Pstd);%��������
end
