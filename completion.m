function [A1]=completion(A,k);
%��ȫ����
A2=A;
A2(isnan(A2(:,1)),:)=[];%����ȱʧֵ
if k==1%MEAN
    amean=mean(A2);
    A(isnan(A(:,1)),:)=amean;
elseif k==2 %MODE
    amode=mode(A2);
    A(isnan(A(:,1)),:)=amode;
end
A1=A;

    
    


