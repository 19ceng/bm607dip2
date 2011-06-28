f = imread('C:\Users\Shouldbe\Desktop\kidney.jpg'); % att���m�z resmi imread() fonksiyonu ile okuyoruz. 
figure;
subplot(4,2,1); imshow(f);title('orjinal');
%f = rgb2gray(f);        Normalde resmimiz renkli olarak d�s�n�rsek;rgb(Renkli
%                        red,green,blue) bunu gri forma �evirmemiz;gerekir
%                        fakat buradaki gri formda oldu�u i�in sorun yok...
%figure(2);imshow(f);

f(f>180) = 0;        %    Resimde a��r� beyaz alanlar oldu�undan parlakl�k de�eri 180 den fazla olanla� siyaha �evirdim.ikili(binary) 
 subplot(4,2,2);imshow(f);  title('f>180 leri siyaha �evrilmi�');                    % resim format�na �eviriyoruz. 
                       % �kili resim demek bizim belirledi�imiz
                       % s�n�r(treshold) de�erinden b�y�k koyuluk deerine sahip olanlara '1' de�erini yani beyaz,
                       % bu de�erin alt�nda olanlara da '0' de�erini verir buda siyah demektir. 
 r1 = im2bw(f,0.50037); 

subplot(4,2,3); imshow(r1); title('e�iten b�y�kse beyaz k���kse siyah');% Ve resmimizi ekrana bas�yoruz...


se = strel('disk',5); % Yap�sal element...�ap� 5 birim h�cre olan bir disk olu�turuyoruz...
r1 = imerode(r1,se);  % Resimde olu�an karma��kl� gidermek i�in erezyona u�rat�yoruz. 
subplot(4,2,4); imshow(r1); title('erezyona u�rat�lm�� hali');    % Erezyon i�leminden sonra..
%Resimde i�imize yaramayan k���k par�ac�klar olu�tu�unu g�r�yoruz..


r1 = bwareaopen(r1, 255);   % . Fonksiyonun(255) ald��� de�erden k���k h�cre say�s�ndan olu�mu� olanlar eler.
subplot(4,2,5); imshow(r1);title('k���k par�ac�klar�n yok edilmesi ');

se = strel('disk',5); % Yap�sal element...�ap� 5 birim h�cre olan bir disk olu�turuyoruz...
r1 = imdilate(r1,se); % Organlar�n i�erisinde erozyonun olu�turdu�u delikler mevcut.
                       % Yine ayn� 5 birimlik diskimizle resmimizi tar�yoruz ve resme imdilate() fonksiyonu ile 
                       % geni�letme uyguluyoruz.
 

subplot(4,2,6), imshow(r1); title('geni�letilmi� hali');


r1=imfill(r1,'holes'); % Resmimizin i�indeki delikleri dolduruyoruz..
subplot(4,2,7); imshow(r1); title('deliklerin doldurulmu� hali');
% f(~r1)= 0;  % ~r1 ile resmimizin tersini al�yoruz. Bu �u demek beyaz olan k�s�mlar� siyah, siyah olan k�s�mlar� ise beyaz yap�yoruz.    
%             %  B�ylece siyah k�s�mlar� se�ili hale getiriyoruz gibi d��nebiliriz. 
%             % Bu k�s�mlar� orijinal resmimizde 0 yani siyah de�eri vererek sadece organlar�n oldugu yerleri ortaya ��karm�� oluyoruz.
% figure(6); imshow(f);

g=~r1;
subplot(4,2,8); imshow(g);title('sonu�');

