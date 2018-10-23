%数值特征处理
Age=completion(Age,3);
Fare=completion(Fare,3);
Embarked=completion(Embarked,2);
%特征缩放
Age=Feascaling(Age);
Fare=Feascaling(Fare);

%类别特征处理
% Pclass=classcode(Pclass,3);
% Sex=classcode(Sex,2);
% Embarked=classcode(Embarked,3);
A=[Age,Fare,Parch,Pclass,Sex,SibSp,Embarked];
[m,dim]=size(A);
X=A(:,1:dim);
for i=1:m
X(i,dim+1)=1;
end
Z=X*B;%simoid自变量 m*1
for j=1:m
        H(j,:)=1/(1+exp(-Z(j,:)));%激励函数
    if H(j,:) >= 0.5
        Y1(j,:)=1;
    else
        Y1(j,:)=0;
    end
end
% Y=X*B;
% for j=1:m
%     if Y(j,:) >= 0.5
%         Y1(j,:)=1;
%     else
%         Y1(j,:)=0;
%     end
% end
submission=[PassengerId,Y1];
csvwrite('titan_csv.csv',submission);