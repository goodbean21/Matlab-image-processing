function A01112847

%% Actividad 1
warning off
clear all
close all
clc

I = imread('cells(1).jpg');
IG = rgb2gray(I);
A = [];

Thresh = graythresh(IG);

BW = im2bw(IG, Thresh);
BW_c = imcomplement(BW);

Disk = strel('disk', 1);

Ero1 = imdilate(BW_c, Disk);

Props = regionprops('table',BW_c, 'centroid','Area');
A = Props.Area;

Mean_A = floor(mean(A));

BW_o = bwareaopen(BW_c,Mean_A);

figure,
subplot(2,3,1), imshow(IG), title ('A) Imagen en escala de grises')
subplot(2,3,2), imshow(BW), title ('B) Imagen binarizada')
subplot(2,3,3), imshow(BW_c), title ('C) Complemento de la imagen binarziada')
subplot(2,3,4), imshow(Ero1), title ('D) Dilatación del complemento')
subplot(2,3,5), imshow(BW_c), title ('E) Complemento de la imagen binrazida')
subplot(2,3,6), imshow(BW_o), title ('F) Binarización de area abierta')

%% Actividad 2

Bothat = bwmorph(BW, 'Bothat');
Close = bwmorph(BW, 'Close');
Majority = bwmorph(BW, 'Majority');
Spur = bwmorph(BW, 'Spur');
Bridge = bwmorph(BW, 'Bridge');
Fill = bwmorph(BW, 'Fill');
HBreak = bwmorph(BW, 'HBreak');
Thicken = bwmorph(BW, 'Thicken');
Branchpoint = bwmorph(BW, 'Branchpoint');
Thin = bwmorph(BW, 'Thin');

figure,
subplot(2,3,1), imshow(Bothat), title('A) Bot Hat de la imagen binarizada')
subplot(2,3,2), imshow(Close), title('B) Cierre de la imagen binarizada')
subplot(2,3,3), imshow(Majority), title('C) Mayoritariamente de la imagen binarizada')
subplot(2,3,4), imshow(Spur), title('D) pur de la imagen binarizada')
subplot(2,3,5), imshow(Bridge), title('E) Puente de la imagen binarizada')
subplot(2,3,6), imshow(Fill), title('F) Relleno de la imagen binarizada')
%%
Bothat = bwmorph(BW_c, 'Bothat');
Close = bwmorph(BW_c, 'Close');
Majority = bwmorph(BW_c, 'Majority');
Spur = bwmorph(BW_c, 'Spur');
Bridge = bwmorph(BW_c, 'Bridge');
Fill = bwmorph(BW_c, 'Fill');
HBreak = bwmorph(BW_c, 'HBreak');
Thicken = bwmorph(BW_c, 'Thicken');
Branchpoint = bwmorph(BW_c, 'Branchpoint');
Thin = bwmorph(BW, 'Thin');

figure,
subplot(2,3,1), imshow(Bothat), title('A) Bot Hat del complemento')
subplot(2,3,2), imshow(Close), title('B) Cierre del complemento')
subplot(2,3,3), imshow(Majority), title('C) Mayoritariamente del complemento')
subplot(2,3,4), imshow(Spur), title('D) Spur del complemento')
subplot(2,3,5), imshow(Bridge), title('E) Puente del complemento')
subplot(2,3,6), imshow(Fill), title('F) Relleno del complemento')


%% Actividad 3
% Parte 1
I = imread('cells2.jpg');
IG = rgb2gray(I);
A = [];

Thresh = graythresh(IG);

BW = im2bw(IG, Thresh);
BW_c = imcomplement(BW);

Disk = strel('disk', 1);

Ero1 = imerode(BW_c, Disk);

Props = regionprops('table',BW_c, 'centroid','Area');
A = Props.Area;c

Mean_A = floor(mean(A));

BW_o = bwareaopen(BW_c,Mean_A);

figure,
subplot(2,3,1), imshow(IG), title ('A) Imagen en escala de grises')
subplot(2,3,2), imshow(BW), title ('B) Imagen binarizada')
subplot(2,3,3), imshow(BW_c), title ('C) Complemento de la imagen binarziada')
subplot(2,3,4), imshow(Ero1), title ('D) Erosion del complemento')
subplot(2,3,5), imshow(BW_c), title ('E) Complemento de la imagen binrazida')
subplot(2,3,6), imshow(BW_o), title ('F) Binarización de area abierta')

A = [];

Thresh = graythresh(IG);

BW = im2bw(IG, Thresh);
BW_c = imcomplement(BW);

Com = imcomplement(BW_c);

Props = regionprops('table',BW_c, 'centroid','Area');
A = Props.Area;

Mean_A = floor(mean(A));

BW_o = bwareaopen(BW_c,Mean_A);

figure,
subplot(2,3,1), imshow(IG), title ('A) Imagen en escala de grises')
subplot(2,3,2), imshow(BW), title ('B) Imagen binarizada')
subplot(2,3,3), imshow(BW_c), title ('C) Complemento de la imagen binarziada')
subplot(2,3,4), imshow(Com), title ('D) Erosion del complemento')
subplot(2,3,5), imshow(BW_c), title ('E) Complemento de la imagen binrazida')
subplot(2,3,6), imshow(BW_o), title ('F) Binarización de area abierta')

% Parte 2
I = imread('cells4.jpg'); % Imagen nueva
IG = rgb2gray(I);
A = [];

Thresh = graythresh(IG);

BW = im2bw(IG, Thresh);
BW_c = imcomplement(BW);

Disk = strel('disk', 1);

Ero1 = imerode(BW_c, Disk);

Props = regionprops('table',BW_c, 'centroid','Area');
A = Props.Area;

Mean_A = floor(mean(A));

BW_o = bwareaopen(BW_c,Mean_A);

figure,
subplot(2,3,1), imshow(IG), title ('A) Imagen en escala de grises')
subplot(2,3,2), imshow(BW), title ('B) Imagen binarizada')
subplot(2,3,3), imshow(BW_c), title ('C) Complemento de la imagen binarziada')
subplot(2,3,4), imshow(Ero1), title ('D) Erosion del complemento')
subplot(2,3,5), imshow(BW_c), title ('E) Complemento de la imagen binrazida')
subplot(2,3,6), imshow(BW_o), title ('F) Binarización de area abierta')

A = [];

Thresh = graythresh(IG);

BW = im2bw(IG, Thresh);
BW_c = imcomplement(BW);

Com = imcomplement(BW_c);

Props = regionprops('table',BW_c, 'centroid','Area');
A = Props.Area;

Mean_A = floor(mean(A));

BW_o = bwareaopen(BW_c,Mean_A);

figure,
subplot(2,3,1), imshow(IG), title ('A) Imagen en escala de grises')
subplot(2,3,2), imshow(BW), title ('B) Imagen binarizada')
subplot(2,3,3), imshow(BW_c), title ('C) Complemento de la imagen binarziada')
subplot(2,3,4), imshow(Com), title ('D) Erosion del complemento')
subplot(2,3,5), imshow(BW_c), title ('E) Complemento de la imagen binrazida')
subplot(2,3,6), imshow(BW_o), title ('F) Binarización de area abierta')


end