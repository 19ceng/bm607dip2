I = imread('coins.png');
imshow(I)

 title('Orjinal resim')
level = graythresh(I);  % e�ik belirleniyor..
BW = im2bw(I,level); % siyah beyaz resim ��kar�l�r

figure;
imshow(BW)
title('Otsu E�iklenmesi')
BW2 = imfill(BW,'holes');     % bo�luklar� doldurur
figure ; imshow(BW2)
title('Delikler Kapat�lm�� Resim')
L = bwlabel(BW2,4)  ;      %etiketleme

figure; imshow(L) 
title('Etiketlenmi� Resim')


