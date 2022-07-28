function [varargout] = Normalize(Matrix , Method , varargin)
%Made By WinCento (Seid Mousa Sajadi)
% for 2D matrix
% Matix n*n size
% Method is string 'linear1' or 'linear2' or 'rational' or 'vector' or 'fuzzy' or 'standard'
switch Method
    case {'linear1'}
        % varargin:
        %                   LowValue , HighValue
        % Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'linear1' , -1 , 1)
        if length(varargin) == 0
            Min = 0 ;
            Max = 1 ;
        else
            Min = varargin{1,1} ;
            Max = varargin{1,2} ;
        end
        Slope = (Max - Min) / (max(Matrix(:)) - min(Matrix(:))) ;
        Result = Min + Slope * ( Matrix - min(Matrix(:))) ;
        varargout{1,1} = Result ;
    case{'linear2'}
        % Process:
        %                   column to cloumn
        % varargin:
        %                   Vector 1*n
        %                                       Benefit (1) or Loss (0)
        % Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'linear2' , [1 1 0])
        [r c] = size(Matrix) ;
        Map = varargin{1,:} ;
        for j = 1:c
            if Map(1,j) == 1
                Result(:,j) = Matrix(:,j) ./ max(Matrix(:,j)) ;
            else
                Result(:,j) = min(Matrix(:,j)) ./ Matrix(:,j) ;
            end
        end
        varargout{1,1} = Result ;
    case {'rational'}
        % Example:
        %                   Normalize([1 2 ; 3 4] , 'rational')
        Sum = sum(sum(Matrix)) ;
        Result = Matrix / Sum ;
        varargout{1,1} = Result ;
    case{'vector'}
        % varargin:
        %                   vector = -Inf,....,real number,.....,Inf
        %                   matrix = 1,2,Inf,'fro'
        % Example:
        %                   Normalize([1 2 ; 3 4] , 'vector')
        if length(varargin) == 0
            P = 2 ;
            Result = Matrix ./ norm(Matrix,P) ;
        elseif (isvector(Matrix) == 0)
            if (varargin{1,1} == 1) | (varargin{1,1} == 2) | (varargin{1,1} == Inf) | (varargin{1,1} == 'fro')
                P = varargin{1,1} ;
                Result = Matrix ./ norm(Matrix,P) ;
            else
                disp('Can do this')
            end
        else
            P = varargin{1,1} ;
            Result = Matrix ./ norm(Matrix,P) ;
        end
        varargout{1,1} = Result ;
    case{'fuzzy'}
        % Process:
        %                   column to cloumn
        % varargin:
        %                   Vector 1*n
        %                                       Benefit (1) or Loss (0)
        % Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'fuzzy' , [1 1 0])
        [r c] = size(Matrix) ;
        Map = varargin{1,:} ;
        for j = 1:c
            if Map(1,j) == 1
                Result(:,j) = (Matrix(:,j) - min(Matrix(:,j))) ./ (max(Matrix(:,j)) - min(Matrix(:,j))) ;
            else
                Result(:,j) = (max(Matrix(:,j)) - Matrix(:,j)) ./ (max(Matrix(:,j)) - min(Matrix(:,j))) ;
            end
        end
        varargout{1,1} = Result ;
    case{'standard'}
        %Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'standard')
        Mean = mean(mean(Matrix)) ;
        Std_Dev = std(std(Matrix)) ;
        Result = (Matrix - Mean) / Std_Dev ;
        varargout{1,1} = Result ;
    case{'exponential'}
        % varargin:
        %                   Low Boundary , Up Boundary , [Coefficeint(a , b)]
        %                   a*exp(x*b) 
        %Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'exponential',-1,1,[1,-1])
        [row col] = size(Matrix) ;
        LB = varargin{1,1} ;
        UB = varargin{1,2} ;
        if size(varargin{1,3}) ~= [1 2]
            a = 1 ;
            b = 1 ;
        else
            Coef = varargin{1,3} ;
            a = Coef(1,1) ;
            b = Coef(1,2) ;
        end
        x = linspace(LB,UB,row*col) ;
        f = @(x) a.*exp(x.*b) ;
        y = f(x) ;
        S_X = sort(reshape(Matrix,[1,row*col])) ;
        S_y = sort(reshape(y,[1,row*col])) ;
        Result = zeros(row,col);
        for i = 1:row*col
            [r_X c_X] = find(Matrix == S_X(i)) ;
            [r_S_y c_S_y] = find(y == S_y(1)) ;
            Result(r_X,c_X) = x(r_S_y(1,1) , c_S_y(1,1)) ;
            S_y(1) = [] ;
        end
        varargout{1,1} = Result ;
        syms x A B ;
        F = A.*exp(x.*B) ;
        varargout{1,2} = simplify(subs(F,[A,B],[a,b])) ;
    case{'gaussian'}
        % varargin:
        %                   Low Boundary , Up Boundary(set) , [Coefficeint(a , c)]
        %                   a*exp(-((x-b)/c)^2)   
        %                   b = minimum x
        %Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'gaussian',-1,3,[1 0.5])
        [row col] = size(Matrix) ;
        LB = varargin{1,1} ;
        UB = varargin{1,2} ;
        if size(varargin{1,3}) ~= [1 2]
            a = 1 ;
            c = 0.5 ; % thin or fat
        else
            Coef = varargin{1,3} ;
            a = Coef(1,1) ;
            c = Coef(1,2)  ; % thin or fat
        end
        b = (UB + LB) / 2 ; % X maximum
        x = linspace(LB,UB,row*col) ;
        f = @(x) a.*exp(-((x-b)./c).^2) ;
        y = f(x) ;
        S_X = sort(reshape(Matrix,[1,row*col])) ;
        S_y = sort(reshape(y,[1,row*col])) ;
        Result = zeros(row,col);
        for i = 1:row*col
            [r_X c_X] = find(Matrix == S_X(i)) ;
            [r_S_y c_S_y] = find(y == S_y(1)) ;
            Result(r_X,c_X) = x(r_S_y(1,1) , c_S_y(1,1)) ;
            S_y(1) = [] ;
        end
        varargout{1,1} = Result ;
        syms x A B C ;
        F = A*exp(-((x-B) /C) ^2) ;
        varargout{1,2} = simplify(subs(F,[A,B,C],[a,b,c])) ;
    case{'power'}
        % varargin:
        %                   Low Boundary , Up Boundary , [Coefficeint(a,b)]
        %                                                                       lowest in 0 if b = 2k
        %                                                                       lowest in -1 if b = 2k+1
        %Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'power',-1,1,[2,3])
        [row col] = size(Matrix) ;
        LB = varargin{1,1} ;
        UB = varargin{1,2} ;
        if size(varargin{1,3}) ~= [1 2]
            a = 2 ;
            b = 3 ;
        else
            Coef = varargin{1,3} ;
            a = Coef(1,1) ;
            b = Coef(1,2) ;
        end
        x = linspace(LB,UB,row*col) ;
        f = @(x) a.*x.^b ;
        y = f(x) ;
        S_X = sort(reshape(Matrix,[1,row*col])) ;
        S_y = sort(reshape(y,[1,row*col])) ;
        Result = zeros(row,col);
        check = 1 ;
        for i = 1:row*col
            [r_X c_X] = find(Matrix == S_X(i)) ;
            [r_S_y c_S_y] = find(y == S_y(1)) ;
            if size(c_S_y) == [1,2]
                if check == 1
                    flag = 1 ;
                    check = 2 ;
                else
                    check = 1 ;
                    flag = 2 ;
                end
            elseif size(c_S_y) == [1,1]
                flag = 1 ;
            end
            Result(r_X,c_X) = x(r_S_y(1,1) , c_S_y(1,flag)) ;
            S_y(1) = [] ;
        end
        varargout{1,1} = Result ;
        syms x A B ;
        F = A.*x.^B ;
        varargout{1,2} = simplify(subs(F,[A,B],[a,b])) ;
    case{'polynomiyal'}
        % varargin:
        %                   Low Boundary , Up Boundary , [elongation,Y extermum]
        %Example:
        %                   Normalize([2 1500 5.5 ; 2.5 2700 6.5 ; 1.8 2000 4.5] , 'polynomiyal',-1,1,[1,0])
        [row col] = size(Matrix) ;
        LB = varargin{1,1} ;
        UB = varargin{1,2} ;
        b = (UB + LB) / 2 ; % X extermum
        if size(varargin{1,3}) ~= [1 2]
            a = 1 ;
            c = 0 ;
        else
            Coef = varargin{1,3} ;
            a = Coef(1,1) ;
            c = Coef(1,2) ;
        end
        x = linspace(LB,UB,row*col) ;
        f = @(x) a.*x.^2+b.*x+c ;
        y = f(x) ;
        S_X = sort(reshape(Matrix,[1,row*col])) ;
        S_y = sort(reshape(y,[1,row*col])) ;
        Result = zeros(row,col);
        check = 1 ;
        for i = 1:row*col
            [r_X c_X] = find(Matrix == S_X(i)) ;
            [r_S_y c_S_y] = find(y == S_y(1)) ;
            if size(c_S_y) == [1,2]
                if check == 1
                    flag = 1 ;
                    check = 2 ;
                else
                    check = 1 ;
                    flag = 2 ;
                end
            elseif size(c_S_y) == [1,1]
                flag = 1 ;
            end
            Result(r_X,c_X) = x(r_S_y(1,1) , c_S_y(1,flag)) ;
            S_y(1) = [] ;
        end
        varargout{1,1} = Result ;
        syms x A B C ;
        F = A.*x.^2+B.*x+C ;
        varargout{1,2} = simplify(subs(F,[A,B,C],[a,b,c])) ;
end
