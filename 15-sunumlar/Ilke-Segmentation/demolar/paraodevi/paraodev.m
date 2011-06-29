clear all
I = imread('para.jpg');  %paralarýn olduðu resmi okur
I=rgb2gray(I);
%% ÝLK DEÐERLER
bir=0; elli=0; ybes=0; on=0; bes=0; h=0;
%%

I= imnoise(I,'salt & pepper',0.02); % tuz biber gürültüsü ekler
figure(1)
imshow(I)

I=medfilt2(I); % tuz biber gürültüsünü yok eden median filtre.
figure 
imshow(I)

% FIXME: graythresh, im2bw
BW=I>mean(I(:)); %paralarý arka plandan ayýrýr. BW resmi yapar.

BW=medfilt2(BW); % 2 boyutlu median filtreden geçilir.
BW=BW<1;
BW = imfill(BW,'holes');
BW=medfilt2(BW,[16,16]);
figure
imshow(BW)

L=bwlabel(BW,4); %etiketleme yapýlýr
Para_sayisi=max(L(:)) % kaç tane para olduðunu bulur.


yuv=regionprops(L,'Eccentricity');
yuv=cat(1,yuv.Eccentricity);

%% PARA OLMAYAN NESNELERÝN AYIKLANMASI

for i=1:Para_sayisi
    
    if yuv(i)>0.42
        LL=L~=i;
        
        h=h+1;

        LL=LL<1;
        BW=BW-LL;
    
    end
    
end
%%

L=bwlabel(BW,4);
alan=regionprops(L,'MajorAxisLength');
Para_boylari = cat(1, alan.MajorAxisLength);
orta = regionprops(L, {'Centroid', 'PixelIdxList'});


hold on
Para_sayisi=Para_sayisi-h
orta = cat(1, orta.Centroid);
ref=Para_boylari(1);

%% REFERANS DAÝRESÝNÝ BULMAK

for i=1:Para_sayisi 
       ref_bulma(i)=orta(i,1)+orta(i,2);
end

ref=min(ref_bulma);

%% 


%% PARALARIN SAYILMASI

for i=1:Para_sayisi
    
    ref_now=orta(i,1)+orta(i,2);
    j=ref/Para_boylari(i);
    
    if ref_now==ref
        
        deger=sprintf('Referans');
        
    elseif j>0.75 && j<=0.91365
        
        bir=bir+1;
        deger=sprintf('1 TL' );
   
    elseif j<=1.0205
        
        elli=elli+1;
        deger=sprintf('50 Kr' );
        
    elseif j<=1.14785
        
        ybes=ybes+1;
        deger=sprintf('25 Kr' );
    
    elseif j<=1.2694
    
        on=on+1;
        deger=sprintf('10 Kr' );
    
    else
        
        bes=bes+1;
        deger=sprintf('5 Kr' );
    
    end
   
        text(orta(i,1), orta(i,2), sprintf('%s', deger));  %Para degerlerini text olarak üzerlerine yazar
        ref_bulma(i)=orta(i,1)+orta(i,2);

end

%%

b=bir+elli*0.5+ybes*0.25+on*0.1+bes*0.05;
toplam_para=sprintf('%s TL' , num2str(b) )


