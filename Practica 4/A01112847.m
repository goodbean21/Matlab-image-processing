function A01112847
warning off
close all
clear all
clc

%% Actividad 1

canvas = zeros(500);

c = 4*[5.29452054794521;4.06164383561645;1.04794520547947;3.37671232876713;2.41780821917808;5.70547945205479;8.30821917808220;7.76027397260276;10.0890410958904;6.80136986301372;5.29452054794521];
r = 4*[1.25342465753425;4.13013698630137;4.67808219178083;6.32191780821918;9.60958904109589;7.55479452054795;10.0205479452055;6.32191780821918;4.54109589041097;4.26712328767124;1.25342465753425];

for i = 1:3
    x = floor(random('unif',1,500));
    y = floor(random('unif',1,500));
    
    canvas(x,y) = imcomplement(canvas(x,y));

end

Square = strel('square', 20);
Disk = strel('disk', 15);
Line = strel('line',50, 20);
Dime = strel('diamond', 30);
Star = poly2mask(c, r, 40, 40);

% dilatación

Dil_Square = imdilate(canvas, Square);
Dil_Disk = imdilate(canvas, Disk);
Dil_Line = imdilate(canvas, Line);
Dil_Dime = imdilate(canvas, Dime);
Dil_Star = imdilate(canvas, Star);

figure,
subplot(2,3,1), imshow(canvas), title('A) Imagen original');
subplot(2,3,2), imshow(Dil_Square), title('B) Dilatación con cuadrado');
subplot(2,3,3), imshow(Dil_Disk), title('C) Dilatación con disco');
subplot(2,3,4), imshow(Dil_Line), title('D) Dilatación con linea');
subplot(2,3,5), imshow(Dil_Dime), title('E) Dilatación diamante');
subplot(2,3,6), imshow(Dil_Star), title('F) Dilatación con estrella');

%% Actividad 2

I = imread('cuadro.jpg');
IG = rgb2gray(I);
BW = im2bw(IG, 0.6);
BW_c = imcomplement(BW);

Px = strel('disk',1);

% Aplicar elemento estructural?
Ero_px = imerode(BW, Px);
Ero_px_c = imerode(BW_c, Px);

figure,
subplot(2,2,1), imshow(BW), title('A) Imagen en binario');
subplot(2,2,2), imshow(Ero_px), title('B) Erosión de la imagen en binario');
subplot(2,2,3), imshow(BW_c), title('C) Complemento de la imagen en binario');
subplot(2,2,4), imshow(Ero_px_c), title('D) Erosión del complemento');


%% Actividad 3

I = imread('celulitas.jpg');
IG = rgb2gray(I);
Thresh = graythresh(IG);
BW = im2bw(IG, Thresh);
disk1 = strel('disk', 7);

open = imopen(imcomplement(BW), disk1);
Seg1 = uint8(open.*double(I(:,:,1)));
Seg2 = uint8(open.*double(I(:,:,2)));
Seg3 = uint8(open.*double(I(:,:,3)));

Seg = cat(3, Seg1, Seg2, Seg3);

figure,
subplot(2,2,1), imshow(IG), title('A) Imagen en escala de grises');
subplot(2,2,2), imshow(BW), title('B) Imagen binarizada');
subplot(2,2,3), imshow(open), title('C) Operación morfológica');
subplot(2,2,4), imshow(Seg), title('D) Imagen segmentada');

%% Actividad 4

I = imread('tcolor2.jpg');
IG = rgb2gray(I);

[m, n] = size(IG);

canvas = zeros(m, n);
disk2 = strel('disk', 10);

for i = 1:m
    for j=1:n
        if(IG(i,j) > 0.65*255 && IG(i,j) < 0.75*255)
            canvas(i,j) = 1;
            
        end
    end
end

Ero1 = imdilate(canvas, disk2);
    
for i = 1:3
    Ero1 = imerode(Ero1, disk2);
    Ero1 = imopen(Ero1, disk2);
    
end

disk1 = strel('disk', 18);

Ero1 = imdilate(Ero1, disk1);

canvas = zeros(m,n);

for i = 1:m
    for j=1:n
        if(IG(i,j) > 0.25*255 && IG(i,j) < 0.35*255)
            canvas(i,j) = 1;
            
        end
    end
end

Ero2 = imdilate(canvas, disk2);
    
for i = 1:2
    Ero2 = imerode(Ero2, disk2);
    Ero2 = imopen(Ero2, disk2);
    
end

disk1 = strel('disk', 10);

Ero2 = imdilate(Ero2, disk1);

canvas = zeros(m,n);

for i = 1:m
    for j=1:n
        if(IG(i,j) > 0.05*255 && IG(i,j) < 0.15*255)
            canvas(i,j) = 1;
            
        end
    end
end

for i = 1:m
    for j=1:n
        if(IG(i,j) > 0.45*255 && IG(i,j) < 0.55*255)
            canvas(i,j) = 1;
            
        end
    end
end


Ero3 = imdilate(canvas, disk2);
    
for i = 1:2
    Ero3 = imerode(Ero3, disk2);
    Ero3 = imopen(Ero3, disk2);
    
end

disk1 = strel('disk', 10);

Ero3 = imdilate(Ero3, disk1);

ERO = uint8(Ero1 + Ero2 + Ero3);

CA = cat(3,I(:,:,1).*ERO, I(:,:,2).*ERO, I(:,:,3).*ERO);

figure,
subplot(1,2,1), imshow(I), title('A) Imagen original')
subplot(1,2,2), imshow(CA), title('B) Imagen aislada');

end