function A01112847_Practica_02
close all
warning off
clear all
clc

I = imread('Sloth.jpg');
IN = im2double(I);

%% Actividad 1
IB1 = I + (255 - max(max(max(I)))) + 100;
IB2 = I + (0 - max(min(min(I)))) - 100;

IC1 = I.*.3;
IC2 = I.*3;

figure,
subplot(2,3,1), imshow(I), title('A) Imagen original');
subplot(2,3,2),imshow(IB1), title('B) Brillo');
subplot(2,3,3),imshow(IB2), title('C) Obscuro');
subplot(2,3,4), imshow(I), title('D) Imagen original');
subplot(2,3,5), imshow(IC1), title('E) Bajo contraste');
subplot(2,3,6), imshow(IC2), title('F) Alto contraste');

%% Actividad 2

% Complementos
I_neg = imcomplement(I);
C = 1 - IN(:,:,1);
M = 1 - IN(:,:,2);
Y = 1 - IN(:,:,3);

CMY = cat(3,C,M,Y);
IG_RGB = rgb2gray(I);
IG_CMY = rgb2gray(CMY);
IG_I_neg = rgb2gray(I_neg);

figure,
subplot(2,3,1), imshow(I), title('A) Imagen original');
subplot(2,3,2), imshow(I_neg), title('B) Imagen en negativo');
subplot(2,3,3), imshow(CMY), title('C) Imagen en CMY');
subplot(2,3,4), imshow(IG_RGB), title('D) Imagen original en escala de grises');
subplot(2,3,5), imshow(IG_I_neg), title('E) Imagen en negativo en escala de grises');
subplot(2,3,6), imshow(IG_CMY), title('F) Imagen CMY en escala de grises');

% Logaritmos
[m , n] = size(I(:,:,1));

Log_I = zeros(m,n,3);
c = .2;
for z = 1:3
    for i = 1:m
       for j = 1:n
           Log_I(i,j,z) = c.*log(1+abs(double(I(i,j,z))));
       end
    end
end

IG_Log1 = rgb2gray(Log_I);

Log_I2 = zeros(m,n,3);
c = .1;
for z = 1:3
    for i = 1:m
       for j = 1:n
           Log_I2(i,j,z) = c.*log(1+abs(double(I(i,j,z))));
       end
    end
end
IG_Log2 = rgb2gray(Log_I2);

figure,
subplot(2,3,1), imshow(I), title('A )Imagen original');
subplot(2,3,2),imshow(Log_I), title('B) Imagen logarítmica 1');
subplot(2,3,3), imshow(Log_I2), title('C) Imagen logarítmica 2');
subplot(2,3,4), imshow(IG_RGB), title('D) Imagen original en escala de grises');
subplot(2,3,5), imshow(IG_Log1), title('E) Imagen logarítmica 1 en escala de grises');
subplot(2,3,6), imshow(IG_Log2), title('F) Imagen logarítmica 2 en escala de grises');

% Gamma correction

IG1 = imadjust(I,[], [0, 1]);
IG2 = imadjust(I, [], [.5, 1]);

IG_IG1 = rgb2gray(IG1);
IG_IG2 = rgb2gray(IG2);

figure,
subplot(2,3,1), imshow(I), title('A) Imagen Original');
subplot(2,3,2), imshow(IG1), title('B) Imagen Gamma 1');
subplot(2,3,3), imshow(IG2), title('C) Imagen Gamma 2');
subplot(2,3,4), imshow(IG_RGB), title('D) Imagen original en escala de grises');
subplot(2,3,5), imshow(IG_IG1), title('E) Imagen Gamma 1 en grises');
subplot(2,3,6), imshow(IG_IG2), title('F) Imagen Gamma 2 en grises');

%% Actividad 3 

% Restaurar perrito
I_perro = imread('perroparque1.jpg');
I_P_B = I_perro - 40;
IP_adj = I_P_B *2;
IP_adj_nor = im2double(IP_adj);

figure,
subplot(1,2,1), imshow(I_perro), title('A) Imagen original');
subplot(1,2,2),imshow(IP_adj), title('B) Imagen Restaurada');

% Aislar perrito
Gray = rgb2gray(IP_adj);
BW = im2bw(Gray, .65);

stats = regionprops('table', BW, 'Centroid','MajorAxisLength','MinorAxisLength');
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
[Max, ind] = max(diameters);
c = [centers(ind,1)+30, centers(ind,2)-5];
r = radii(ind);

[m,n] = size(I_perro(:,:,1));

canvas = zeros(m,n);
BW2 = im2bw(insertShape(canvas,'filledCircle',[c,r+70]));

R = IP_adj_nor(:,:,1);
G = IP_adj_nor(:,:,2);
B = IP_adj_nor(:,:,3);
I_perro_seg = cat(3,BW2.*R, BW2.*G, BW2.*B);

figure,
subplot(1,2,1),imshow(IP_adj), title('A) Imagen restaurada');
subplot(1,2,2), imshow(I_perro_seg), title('B) Imagen con sólo el perro');

% Encontrar a Wally
I_Donde = imread('dondeestawally.jpg');
I_Donde_n = im2double(I_Donde);
I_Aqui = imread('aquiestoy.jpg');

diff = I_Aqui - I_Donde;

BW_W = im2bw(diff,.06);

stats = regionprops('table',BW_W,'Centroid','MajorAxisLength','MinorAxisLength');
centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
[m, n] = size(I_Donde(:,:,1));
canvas = zeros(m,n);
BW_W2 = im2bw(insertShape(canvas,'filledCircle',[mean(centers)-10, max(radii)*2.4]));

cen = mean(centers)-10;
radi = max(radii)*2.4;

IC = imcrop(diff, [(cen(1) - radi), (cen(2) - radi), (radi*2), (radi*2)]);

I_Donde_seg = cat(3,I_Donde_n(:,:,1).*BW_W2, I_Donde_n(:,:,2).*BW_W2, I_Donde_n(:,:,3).*BW_W2);

IC_D = imcrop(I_Donde_seg, [(cen(1) - radi), (cen(2) - radi), (radi*2), (radi*2)]);

figure,
subplot(2,2,1), imshow(I_Donde), title('A) ¿Dónde esta Wally?');
subplot(2,2,2), imshow(I_Aqui), title('B) Aquí esta'),
subplot(2,2,3), imshow(IC), title('C) Wally encontrado'),
subplot(2,2,4), imshow(IC_D), title('D) Wally!');

%% Actividad 4

% Se utilizó la imagen del perro ajustada
figure,
subplot(2,3,1), imshow(R), title('A) Componente R');
subplot(2,3,2), imshow(G), title('B) Componente G');
subplot(2,3,3), imshow(B), title('C) Componente B');
subplot(2,3,4), imhist(R), title('D) Histograma de R');
subplot(2,3,5), imhist(G), title('E) Histograma de G');
subplot(2,3,6), imhist(B), title('F) Histograma de B');

end