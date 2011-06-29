I = imread('coins.png');
imshow(I)

 title('Orjinal resim')
level = graythresh(I);  % eþik belirleniyor..
BW = im2bw(I,level); % siyah beyaz resim çýkarýlýr

figure;
imshow(BW)
title('Otsu Eþiklenmesi')
BW2 = imfill(BW,'holes');     % boþluklarý doldurur
figure ; imshow(BW2)
title('Delikler Kapatýlmýþ Resim')
L = bwlabel(BW2,4)  ;      %etiketleme

figure; imshow(L) 
title('Etiketlenmiþ Resim')


