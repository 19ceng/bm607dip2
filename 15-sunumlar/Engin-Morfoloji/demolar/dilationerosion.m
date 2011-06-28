f = imread('C:\Users\Shouldbe\Desktop\kidney.jpg'); % attýðýmýz resmi imread() fonksiyonu ile okuyoruz. 
figure;
subplot(4,2,1); imshow(f);title('orjinal');
%f = rgb2gray(f);        Normalde resmimiz renkli olarak düsünürsek;rgb(Renkli
%                        red,green,blue) bunu gri forma çevirmemiz;gerekir
%                        fakat buradaki gri formda olduðu için sorun yok...
%figure(2);imshow(f);

f(f>180) = 0;        %    Resimde aþýrý beyaz alanlar olduðundan parlaklýk deðeri 180 den fazla olanlaý siyaha çevirdim.ikili(binary) 
 subplot(4,2,2);imshow(f);  title('f>180 leri siyaha çevrilmiþ');                    % resim formatýna çeviriyoruz. 
                       % Ýkili resim demek bizim belirlediðimiz
                       % sýnýr(treshold) deðerinden büyük koyuluk deerine sahip olanlara '1' deðerini yani beyaz,
                       % bu deðerin altýnda olanlara da '0' deðerini verir buda siyah demektir. 
 r1 = im2bw(f,0.50037); 

subplot(4,2,3); imshow(r1); title('eþiten büyükse beyaz küçükse siyah');% Ve resmimizi ekrana basýyoruz...


se = strel('disk',5); % Yapýsal element...Çapý 5 birim hücre olan bir disk oluþturuyoruz...
r1 = imerode(r1,se);  % Resimde oluþan karmaþýklý gidermek için erezyona uðratýyoruz. 
subplot(4,2,4); imshow(r1); title('erezyona uðratýlmýþ hali');    % Erezyon iþleminden sonra..
%Resimde iþimize yaramayan küçük parçacýklar oluþtuðunu görüyoruz..


r1 = bwareaopen(r1, 255);   % . Fonksiyonun(255) aldýðý deðerden küçük hücre sayýsýndan oluþmuþ olanlar eler.
subplot(4,2,5); imshow(r1);title('küçük parçacýklarýn yok edilmesi ');

se = strel('disk',5); % Yapýsal element...Çapý 5 birim hücre olan bir disk oluþturuyoruz...
r1 = imdilate(r1,se); % Organlarýn içerisinde erozyonun oluþturduðu delikler mevcut.
                       % Yine ayný 5 birimlik diskimizle resmimizi tarýyoruz ve resme imdilate() fonksiyonu ile 
                       % geniþletme uyguluyoruz.
 

subplot(4,2,6), imshow(r1); title('geniþletilmiþ hali');


r1=imfill(r1,'holes'); % Resmimizin içindeki delikleri dolduruyoruz..
subplot(4,2,7); imshow(r1); title('deliklerin doldurulmuþ hali');
% f(~r1)= 0;  % ~r1 ile resmimizin tersini alýyoruz. Bu þu demek beyaz olan kýsýmlarý siyah, siyah olan kýsýmlarý ise beyaz yapýyoruz.    
%             %  Böylece siyah kýsýmlarý seçili hale getiriyoruz gibi dþünebiliriz. 
%             % Bu kýsýmlarý orijinal resmimizde 0 yani siyah deðeri vererek sadece organlarýn oldugu yerleri ortaya çýkarmýþ oluyoruz.
% figure(6); imshow(f);

g=~r1;
subplot(4,2,8); imshow(g);title('sonuç');

