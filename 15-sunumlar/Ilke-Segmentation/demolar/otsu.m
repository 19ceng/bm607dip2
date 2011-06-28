I = imread('coins.png');
imshow(I)

 title('Orjinal resim')
level = graythresh(I);  % eşik belirleniyor..
BW = im2bw(I,level); % siyah beyaz resim çıkarılır

figure;
imshow(BW)
title('Otsu Eşiklenmesi')
BW2 = imfill(BW,'holes');     % boşlukları doldurur
figure ; imshow(BW2)
title('Delikler Kapatılmış Resim')
L = bwlabel(BW2,4)  ;      %etiketleme

figure; imshow(L) 
title('Etiketlenmiş Resim')


