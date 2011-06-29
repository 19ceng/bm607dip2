I = imread('apartman.jpg');
figure 
imshow(I)
I=rgb2gray(I);
BW = edge(I,'canny');
imshow(BW)