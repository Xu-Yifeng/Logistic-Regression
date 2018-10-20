%广告点击预测 逻辑回归 I12缺失数据过多不作为特征
%数据补全 
%conpletion(A,k)A为补全数据集，k为补全模式：1平均值 2众数
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


dim=12;%特征维度

A=[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I13];
[m,n]=size(A);
for i=1:m
A(i,dim+1)=1;
end

X=A(:,1:dim+1);%training data
Y=Label;%training data的结果
B=ones(dim+1,1);%初始化参数矩阵
step=0;%迭代步数
a=0.3;%learning rate
Z=X*B;%simoid自变量 m*1
for j=1:m
        H(j,:)=1/(1+exp(Z(j,:)));%激励函数
end
lambda=0;%正则化系数 
while   step<1000
    Z=X*B;%simoid自变量 m*1维
    for j=1:m
        H(j,:)=1/(1+exp(Z(j,:)));%sigmiod函数
    end
    E=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H));%Loss Function
    sum=0;
    for a=1:dim-1
        sum=sum+B(a)*B(a);
    end
    E=(-1/m)*(Y'*log(H)+(1-Y')*log(1-H))+lambda*sum/m;;%Loss Function +正则化
    J=-X'*(H-Y)/m;%梯度
    B=B-a*J-(lambda/m)*B;%使用了正则化的梯度迭代
    step=step+1;
end


