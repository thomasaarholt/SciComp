clear
clc

A = zeros(15,40);

%% Hello
% H
letter = 1;
A = fullcolumn(A,2,letter);
A(5:6,4:5) = 1;  
A = fullcolumn(A,6,letter);

% E
letter = 2;
A = fullcolumn(A,10,letter);
A(3:4,12:15) = 1;  
A(6:7,12:15) = 1;  
A(9:10,12:15) = 1;  

% L
letter = 3;
A = fullcolumn(A,18,letter);
A(10:11,20:23) = 1;  


% L
letter = 4;
A = fullcolumn(A,26,letter);
A(11:12,28:31) = 1;  

% O 
letter = 5;
A = fullcolumn(A,34,letter);
A = fullcolumn(A,37,letter);
A(6:7,36:37) = 1;  
A(12:13,36:37) = 1;  

spy(A)
pause

[U,S,V] = svd(A);
plot(U)
pause
plot(S)
pause
plot(V)
pause

semilogy(U)
pause
semilogy(S)
pause
semilogy(V)
pause

rankA = rank(A)

2norm = norm(A,2)

end

for i = 1:rank(A)
B = norm(A,i)
pause
pcolor(B)
pause
colormap(gray)
pause
set(H,'YDir','reverse')
pause
end