clear all; clc;
img = imread('C:\Users\david\OneDrive\Escritorio\20230317_084649.jpg');
gray_im = rgb2gray(img);
A=double(img)./255;
%A=uint8(img) ./255;
imshow(A)
[m,n,p]=size(A);
B=zeros(m,n,p);
%kernel
h = [-2 -1 0 ; -1 1 1; 0 1 2];
for c=1 : 3
    for i=2 : m-1
        for j=2: n-1
           B(i,j,c)= h(1,1)*A(i-1,j-1,c)   +h(1,2)*A(i-1, j,c)    +h(1,3)*A(i-1,j+1,c)...  
                 + h(2,1)*A(i,j-1,c)     +h(2,2)*A(i, j,c)      +h(2,3)*A(i,j+1,c)...
                 + h(3,1)*A(i+1,j-1,c)   +h(3,2)*A(i+1, j,c)    +h(3,3)*A(i+1,j+1,c);
        end
    end
end
figure
imshow(B)