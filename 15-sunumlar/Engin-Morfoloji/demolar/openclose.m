f = imread('C:\Users\Shouldbe\Desktop\bozukkare.jpg'); %Komutu ile resmimizi okuyup f adlý deðiþken içerisine aktarýyoruz.


%üzerinde saçma sapan lekeler ve þekiller bulunan bir dikdörtgen görüyorsunuz. 
% Bu gereksiz lekelerden þeklimizi arýndýrmak ve tertemiz bir dikdötgen ortaya çýkarmak istiyoruz. 

imshow(f);
figure(1);imshow(f);
t = strel('square',12); %12*12 boyutunda bir yapýsal element oluþturuyoruz.(dikkat edin dörtgen!). 
%Bu yapýsal element resmi dolaþýp bozukluklarý gidermeye çalýþacak.

f = imopen(f,t); % 'imopen()' fonksiyonu resmimizi 't' yapýsal elementi ile dolaþýr boyu 50x50 den küçük olan 
% yani 12x12 lik kare matrisin içerisine girebilecek herþeyi yutar. ayrýca
% büyük resimleri de bu oranda kýrpar. Dolayýsýyla dikdörtgen de
% kenarlarýnda biraz küçülmüþ olacak
figure(2); imshow(f); % Bu arada karenin içinde kalan noktalarda aynen kaldý. Eee onlarý yok edemiyormuyuz???

f = imclose(f,t); % 'imclose()' komutu resmimizi 't' yapýsal elementi ile dolaþtý 
% ve 12x12 lik bir kare matrisle resmin beyaz kýsmýný merkezi olacak
% þekilde geniþletti-dilation-(böylece iç kýsýmdaki boþluklar yok oldu). 
% Fonksiyon ardýndan büyüttüðü oranda tekrar küçülttü-erosion-.(resim eski
% haline döndü). 
figure(3); imshow(f); % Resmin son haline bakalým.