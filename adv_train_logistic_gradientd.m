%�����Ԥ�� �߼��ع� I12ȱʧ���ݹ��಻��Ϊ����
%���ݲ�ȫ 
%conpletion(A,k)AΪ��ȫ���ݼ���kΪ��ȫģʽ��1ƽ��ֵ 2����
I1=completion(I1,1);
I2=completion(I2,1);
I3=completion(I3,2);
I4=completion(I4,1);
I5=completion(I5,1);
I6=completion(I6,1);
I7=completion(I7,1);
I8=completion(I8,1);
I9=completion(I9,1);
I10=completion(I10,1);
I11=completion(I11,1);
I13=completion(I13,1);

%������������ 
%����������������������
I1=Feascaling(I1);
I2=Feascaling(I2);
I3=Feascaling(I3);
I4=Feascaling(I4);
I5=Feascaling(I5);
I6=Feascaling(I6);
I7=Feascaling(I7);
I8=Feascaling(I8);
I9=Feascaling(I9);
I10=Feascaling(I10);
I11=Feascaling(I11);
I13=Feascaling(I13);


dim=12;%����ά��

A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];
[m,n]=size(A);
for i=1:m
A(i,dim+1)=1;
end

X=A(:,1:dim+1);%training data
Y=Label;%training data�Ľ��
B=ones(dim+1,1);%��ʼ����������
step=0;%��������
a=0.3;%learning rate
Z=X*B;%simoid�Ա��� m*1
for j=1:m
        H(j,:)=1/(1+exp(Z(j,:)));%��������
end
lambda=0;%����ϵ�� 
while   step<1000
    Z=X*B;%simoid�Ա��� m*1ά
    for j=1:m
        H(j,:)=1/(1+exp(Z(j,:)));%sigmiod����
    end
    E=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));%Loss Function
    sum=0;
    for a=1:dim-1
        sum=sum+B(a)*B(a);
    end
    E=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H))+lambda*sum/m;;%Loss Function +����
    J=-X'*(H-Y)/m;%�ݶ�
    B=B-a*J-(lambda/m)*B;%ʹ�������򻯵��ݶȵ���
    step=step+1;
end


