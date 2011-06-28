f = imread('C:\Users\Shouldbe\Desktop\bozukkare.jpg'); %Komutu ile resmimizi okuyup f adl� de�i�ken i�erisine aktar�yoruz.


%�zerinde sa�ma sapan lekeler ve �ekiller bulunan bir dikd�rtgen g�r�yorsunuz. 
% Bu gereksiz lekelerden �eklimizi ar�nd�rmak ve tertemiz bir dikd�tgen ortaya ��karmak istiyoruz. 

imshow(f);
figure(1);imshow(f);
t = strel('square',12); %12*12 boyutunda bir yap�sal element olu�turuyoruz.(dikkat edin d�rtgen!). 
%Bu yap�sal element resmi dola��p bozukluklar� gidermeye �al��acak.

f = imopen(f,t); % 'imopen()' fonksiyonu resmimizi 't' yap�sal elementi ile dola��r boyu 50x50 den k���k olan 
% yani 12x12 lik kare matrisin i�erisine girebilecek her�eyi yutar. ayr�ca
% b�y�k resimleri de bu oranda k�rpar. Dolay�s�yla dikd�rtgen de
% kenarlar�nda biraz k���lm�� olacak
figure(2); imshow(f); % Bu arada karenin i�inde kalan noktalarda aynen kald�. Eee onlar� yok edemiyormuyuz???

f = imclose(f,t); % 'imclose()' komutu resmimizi 't' yap�sal elementi ile dola�t� 
% ve 12x12 lik bir kare matrisle resmin beyaz k�sm�n� merkezi olacak
% �ekilde geni�letti-dilation-(b�ylece i� k�s�mdaki bo�luklar yok oldu). 
% Fonksiyon ard�ndan b�y�tt��� oranda tekrar k���ltt�-erosion-.(resim eski
% haline d�nd�). 
figure(3); imshow(f); % Resmin son haline bakal�m.