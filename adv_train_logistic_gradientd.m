%广告点击预测 逻辑回归 I12缺失数据过多不作为特征
%数据补全 
%conpletion(A,k)A为补全数据集，k为补全模式：1平均值 2众数
I1=completion(I1,2);
I2=completion(I2,2);
I3=completion(I3,2);
I4=completion(I4,2);
I5=completion(I5,2);
I6=completion(I6,2);
I7=completion(I7,2);
I8=completion(I8,2);
I9=completion(I9,2);
I10=completion(I10,2);
I11=completion(I11,2);
I13=completion(I13,2);

%数据特征处理 
%对数据特征进行特征缩放
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



A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];
[m,dim]=size(A);%特征维度

for i=1:m
A(i,dim+1)=1;
end

X=A(:,1:dim+1);%训练集数据
Y=Label;%训练集label
B=zeros(dim+1,1);%初始化参数矩阵
step=0;%迭代步数

Z=X*B;
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod函数
end

E(1,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));
J=X'*(H-Y)/m;
a=0.03;%learning rate
lambda=10;%正则化系数
while  step<6000
    sum=0;%正则化项
    Z=X*B;%simoid自变量 m*1维
    step=step+1;
    for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%sigmiod函数
    end
    
    for j=1:dim
        sum=sum+B(j,:)*B(j,:);
    end
    EC(step,:)=lambda*sum/m;
    E(step,:)=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H))+lambda*sum/m;%Loss Function
    J=X'*(H-Y)/m+lambda*B/m;%梯度
    B=B-a*J;%梯度迭代
end
figure(1);
plot(E);%绘制loss与迭代次数的关系图
figure(2);
plot(EC);%绘制正则化项与迭代次数的关系图


