%̩̹��˺�����Ԥ�� �߼��ع� �ݶ��½�
%��������Ԥ����
Age=completion(Age,1);
Fare=completion(Fare,1);
Embarked=completion(Embarked,2);
%�����������
% Pclass=classcode(Pclass,3);%������������б���
% Sex=classcode(Sex,2);
% Embarked=classcode(Embarked,3);
A=[Age,Fare,Parch,Pclass,Sex,SibSp,Embarked];
[m,dim]=size(A);%dim����ά�� m����ά��
for i=1:m
A(i,dim+1)=1;
end
A=[A,Survived];
X=A(:,1:dim+1);%ѵ����
Y=A(:,dim+2);%���Լ���label
B=zeros(dim+1,1);%��ʼ����������
step=0;%��������
a=0.003;%learning rate
% sum=0;%������
% lambda=1;%����ϵ��
while   step<30000
    Z=X*B;%simoid�Ա���
    step=step+1;
    for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod����
    end
%     for j=1:dim
%         sum=sum+B(j,:)*B(j,:);%������
%     end
    E(step,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));%Loss Function
%     EC(step,:)=lambda*sum/m;
    J=X'*(H-Y)/m;%�ݶ�
    B=B-a*J;%�ݶ��½�
end
figure(1);%����Loss����������Ĺ�ϵͼ
plot(E);
% figure(2);
% plot(EC);%��������������������Ĺ�ϵͼ


