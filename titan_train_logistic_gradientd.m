%泰坦尼克号生存预测 逻辑回归 梯度下降
%特征数据预处理
Age=completion(Age,1);
Fare=completion(Fare,1);
Embarked=completion(Embarked,2);
%类别特征处理
% Pclass=classcode(Pclass,3);%对类别特征进行编码
% Sex=classcode(Sex,2);
% Embarked=classcode(Embarked,3);
A=[Age,Fare,Parch,Pclass,Sex,SibSp,Embarked];
[m,dim]=size(A);%dim特征维度 m数据维数
for i=1:m
A(i,dim+1)=1;
end
A=[A,Survived];
X=A(:,1:dim+1);%训练集
Y=A(:,dim+2);%测试集的label
B=zeros(dim+1,1);%初始化参数矩阵
step=0;%迭代步数
a=0.003;%learning rate
% sum=0;%正则化项
% lambda=1;%正则化系数
while   step<30000
    Z=X*B;%simoid自变量
    step=step+1;
    for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod函数
    end
%     for j=1:dim
%         sum=sum+B(j,:)*B(j,:);%正则化项
%     end
    E(step,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));%Loss Function
%     EC(step,:)=lambda*sum/m;
    J=X'*(H-Y)/m;%梯度
    B=B-a*J;%梯度下降
end
figure(1);%绘制Loss与迭代次数的关系图
plot(E);
% figure(2);
% plot(EC);%绘制正则化项与迭代次数的关系图


