%广告点击预测test
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
I1=Feascaling(I1);%特征缩放
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
X=A;
Z=X*B;%simoid自变量 m*1
for j=1:m
        H(j,:)=1/(1+exp(Z(j,:)));%激励函数
end

submission=[Id,H];
csvwrite('advcsv1.csv',submission);

