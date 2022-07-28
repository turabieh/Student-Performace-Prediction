function [Train,Test]=Divide(Data)

[R,C]=size(Data);


S=R*0.99;


Train=Data(1:S,:);
Test=Data(S+1:R,:);



