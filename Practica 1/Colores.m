function [Iout] = Colores()
clear all
close all
warning off

%% Actividad 1
I = imread('perritos.jpg');

MaxIR = max(max(I(:,:,1)));
MinIR = min(min(I(:,:,1)));


MaxIG = max(max(I(:,:,2)));
MinIG = min(min(I(:,:,2)));


MaxIB = max(max(I(:,:,3)));
MinIB = min(min(I(:,:,3)));

% disp(MaxIR);
% disp(MinIR);

% disp(MaxIG);
% disp(MinIG);

% disp(MaxIB);
% disp(MinIB);

IN = im2double(I);

MaxIN1 = max(max(IN(:,:,1)));
MinIN1 = min(min(IN(:,:,1)));

MaxIN2 = max(max(IN(:,:,2)));
MinIN2 = min(min(IN(:,:,2)));

MaxIN3 = max(max(IN(:,:,3)));
MinIN3 = min(min(IN(:,:,3)));


% disp(MaxIN1);
% disp(MinIN1);

% disp(MaxIN2);
% disp(MinIN2);

% disp(MaxIN3);
% disp(MinIN3);


I8 = im2uint8(I);

% imshow(I8);

Max8_1 =  max(max(I8(:,:,1)));
Min8_1 = min(min(I8(:,:,1)));

Max8_2 =  max(max(I8(:,:,2)));
Min8_2 = min(min(I8(:,:,2)));

Max8_3 =  max(max(I8(:,:,3)));
Min8_3 = min(min(I8(:,:,3)));

% disp(Max8_1);
% disp(Min8_1);

% disp(Max8_2);
% disp(Min8_2);

% disp(Max8_3);
% disp(Min8_3);

% figure,
% subplot(3,1,1), imshow(I), title('A) RGB');
% subplot(3,1,2), imshow(IN), title('B) Normalizada');
% subplot(3,1,3), imshow(I8), title('C) 8 bits');

%% Actividad 2

IG = rgb2gray(I);
IGM = (I(:,:,1)+ I(:,:,2)+I(:,:,3))/3;


IC = 1 - IN(:,:,1);
IM = 1 - IN(:,:,2);
IY = 1 - IN(:,:,3);

CMY= cat(3,IC,IM,IY);

% imshow(CMY)

IYIQ = rgb2ntsc(I);

IY2 = IYIQ(:,:,1);
II = IYIQ(:,:,2);
IQ = IYIQ(:,:,3);

Y = 0.299.*I(:,:,1) + 0.587.*I(:,:,2) +.114.*I(:,:,3);
U = -.147.*I(:,:,1) - 0.289.*(I(:,:,2)) + .425.*(I(:,:,3));
V= 0.615.*(I(:,:,1)) -.515.*(I(:,:,2)) +.1.*(I(:,:,3));

YUV = cat(3,Y,U,V);

% imshow(YUV);


YCbCr = rgb2ycbcr(I);

Y2 = YCbCr(:,:,1);
Cb = YCbCr(:,:,2);
Cr = YCbCr(:,:,3);

R = (I(:,:,1));
G = I(:,:,2);
B = I(:,:,3);

a = 0.5*(2*(R)-G-B);
b = sqrt(3)/2*(G-B);

H = zeros(size(R));
S = zeros(size(R));
I2 = IGM;

mn = min(I,[],3);
nz=I2~=0;
S(nz) = 1-mn(nz)./I2(nz);
S(~nz) = 0;

H(nz) = atan2(double(b(nz)),double(a(nz)))*(180/pi);
H(H<0) = H(H<0)+360;
H(~nz) = 0;

HSI = cat(3,H,S,I2);

% figure,
% subplot(2,3,1), imshow(R), title('A) Componente R');
% subplot(2,3,2), imshow(G), title('B) Componente G');
% subplot(2,3,3), imshow(B), title('C) Componente B');
% subplot(2,3,4), imshow(IC), title('D) Componente C');
% subplot(2,3,5), imshow(IM), title('E) Componente M');
% subplot(2,3,6), imshow(IY), title('F) Componente Y');
% 
% figure,
% subplot(2,3,6), imshow(IG), title('F) Imagen en Gris');
% subplot(2,3,2), imshow(HSI), title('B) Imagen HSI');
% subplot(2,3,3), imshow(CMY), title('C) Imagen CMY');
% subplot(2,3,4), imshow(YUV), title('D) Imagen YUV');
% subplot(2,3,5), imshow(YCbCr), title('E) Imagen YCbCr');
% subplot(2,3,1), imshow(I), title('A) Imagen RGB');


%% Actividad 3

[Iin2, map2] = rgb2ind(I,2);

[Iin4, map4] = rgb2ind(I,4);

[Iin8, map8] = rgb2ind(I,8);

[Iin16, map16] = rgb2ind(I,16);

[Iin32, map32] = rgb2ind(I,32);

% figure,
% imagesc(R),colormap('cool'), title('Cool');
% figure,
% imagesc(R),colormap('Hot'), title('Hot');
% figure,
% imagesc(R),colormap('Jet'), title('Jet');
% figure,
% imagesc(R),colormap('copper'), title('Copper');
% figure,
% imagesc(R),colormap('Spring'), title('Spring');
% figure,
% imagesc(R),colormap('Parula'), title('Parula');
 
% figure,
% subplot(2,3,1), imshow(I), title('A) Imagen original');
% subplot(2,3,2), imagesc(Iin2), colormap(map2), title('B) Indexado 2');
% subplot(2,3,3), imagesc(Iin4), colormap(map4), title('C) Indexado 4');
% subplot(2,3,4), imagesc(Iin8), colormap(map8), title('D) Indexado 8');
% subplot(2,3,5), imagesc(Iin16), colormap(map16), title('E) Indexado 16');
% subplot(2,3,6), imagesc(Iin32), colormap(map32), title('F) Indexado 32');

% Iout = IN.';

Iout = permute(IN,[2 1 3]);

end