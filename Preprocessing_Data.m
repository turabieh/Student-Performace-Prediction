
clc
clear all
close all

load data1

D=studentmat{:,1};

for i=1:395
    D=studentmat{i,1};
    if strcmp(D,'GP')
        Data(i,1)=1;
    else
        Data(i,1)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,2};
    if strcmp(D,'M')
        Data(i,2)=1;
    else
        Data(i,2)=2;
    end
    %======================================
    
    clear D;
    D=studentmat{i,3};
    Data(i,3)=D;
    
    %======================================
    clear D;
    D=studentmat{i,4};
    if strcmp(D,'U')
        Data(i,4)=1;
    else
        Data(i,4)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,5};
       if strcmp(D,'LE3')
        Data(i,5)=1;
    else
        Data(i,5)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,6};
    if strcmp(D,'T')
        Data(i,6)=1;
    else
        Data(i,6)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,7};
    Data(i,7)=D;
    %======================================
    clear D;
    D=studentmat{i,8};
    Data(i,8)=D;
    %======================================
    clear D;
    D=studentmat{i,9};
    if strcmp(D,'at_home')
        Data(i,9)=1;
    elseif strcmp(D,'teacher')
        Data(i,9)=2;
    elseif strcmp(D,'services')
        Data(i,9)=3;
    elseif strcmp(D,'health')
        Data(i,9)=4;
    else
        Data(i,9)=5;
    end
    %======================================
    clear D;
    D=studentmat{i,10};
    if strcmp(D,'at_home')
        Data(i,10)=1;
    elseif strcmp(D,'teacher')
        Data(i,10)=2;
    elseif strcmp(D,'services')
        Data(i,10)=3;
    elseif strcmp(D,'health')
        Data(i,10)=4;
    else
        Data(i,10)=5;
    end
    %======================================
    clear D;
    D=studentmat{i,11};
    if strcmp(D,'home')
        Data(i,11)=1;
    elseif strcmp(D,'reputation')
        Data(i,11)=2;
    elseif strcmp(D,'course')
        Data(i,11)=3;
    elseif strcmp(D,'other')
        Data(i,11)=4;
    end
    
    %======================================
    clear D;
    D=studentmat{i,12};
    if strcmp(D,'mother')
        Data(i,12)=1;
    elseif strcmp(D,'father')
        Data(i,12)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,13};
    Data(i,13)=D;
    %======================================
    clear D;
    D=studentmat{i,14};
    Data(i,14)=D;
    %======================================
    clear D;
    D=studentmat{i,15};
    Data(i,15)=D;
    %======================================
    clear D;
    D=studentmat{i,16};
    if strcmp(D,'yes')
        Data(i,16)=1;
    elseif strcmp(D,'no')
        Data(i,16)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,17};
    if strcmp(D,'yes')
        Data(i,17)=1;
    elseif strcmp(D,'no')
        Data(i,17)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,18};
    if strcmp(D,'yes')
        Data(i,18)=1;
    elseif strcmp(D,'no')
        Data(i,18)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,19};
    if strcmp(D,'yes')
        Data(i,19)=1;
    elseif strcmp(D,'no')
        Data(i,19)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,20};
    if strcmp(D,'yes')
        Data(i,20)=1;
    elseif strcmp(D,'no')
        Data(i,20)=2;
    end
    
    %======================================
    clear D;
    D=studentmat{i,21};
    if strcmp(D,'yes')
        Data(i,21)=1;
    elseif strcmp(D,'no')
        Data(i,21)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,22};
    if strcmp(D,'yes')
        Data(i,22)=1;
    elseif strcmp(D,'no')
        Data(i,22)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,23};
    if strcmp(D,'yes')
        Data(i,23)=1;
    elseif strcmp(D,'no')
        Data(i,23)=2;
    end
    %======================================
    clear D;
    D=studentmat{i,24};
    Data(i,24)=D;
    %======================================
    clear D;
    D=studentmat{i,25};
    Data(i,25)=D;
    %======================================
    clear D;
    D=studentmat{i,26};
    Data(i,26)=D;
    %======================================
    clear D;
    D=studentmat{i,27};
    Data(i,27)=D;
    %======================================
    clear D;
    D=studentmat{i,28};
    Data(i,28)=D;
    
    %======================================
    clear D;
    D=studentmat{i,29};
    Data(i,29)=D;
    %======================================
    clear D;
    D=studentmat{i,30};
    Data(i,30)=D;
    
    %======================================
    clear D;
    D=studentmat{i,31};
    Data(i,31)=D;
    
    %======================================
    clear D;
    D=studentmat{i,32};
    Data(i,32)=D;
    
    %======================================
    clear D;
    D=studentmat{i,33};
    Data(i,33)=D;
      
end
clear D i





