function A01112847_Practica_03
clear all
close all
warning off
clc

I = imread('With_Love.jpg');
IG = rgb2gray(I);

%% Actividad 1
%% Ruido
IN = imnoise(I,'gaussian',.2);
ING = imnoise(IG,'gaussian',.01);
IN2 = imnoise(I,'gaussian',.09);
ING2 = imnoise(IG,'gaussian',.32);

figure,
subplot(2,3,1), imshow(I), title('A) Imagen Original');
subplot(2,3,2), imshow(IN), title('B) Gaussiano 1');
subplot(2,3,3), imshow(IN2), title('C) Gaussiano 2');
subplot(2,3,4), imshow(IG), title('D) Imagen Original en escala de grises');
subplot(2,3,5), imshow(ING), title('E) Gaussiano 1 en escala de grises');
subplot(2,3,6), imshow(ING2), title('F) Gaussiano 2 en escala de grises');

%% Ruido Salt/Pepper

INS = imnoise(I,'salt & pepper',.08) ;
INP = imnoise(I,'salt & pepper',.02);
INGS = imnoise(IG,'salt & pepper',.58) ;
INGP = imnoise(IG,'salt & pepper',.14);

figure,
subplot(2,3,1), imshow(I), title('A) Imagen Original')
subplot(2,3,2), imshow(INS), title('B) Salt')
subplot(2,3,3), imshow(INP), title('C) Pepper')
subplot(2,3,4), imshow(IG), title('D) Imagen Original')
subplot(2,3,5), imshow(INGS), title('E) Salt en escala de grises')
subplot(2,3,6), imshow(INGP), title('F) Pepper en escala de grises')

%% Ruido uniforme

INU = imnoise(I,'speckle',.18) ;
INU2 = imnoise(I,'speckle',.02);
INGU= imnoise(IG,'speckle',.58) ;
INGU2 = imnoise(IG,'speckle',.14);

figure,
subplot(2,3,1), imshow(I), title('A) Imagen Original')
subplot(2,3,2), imshow(INU), title('B) Uniformidad 1')
subplot(2,3,3), imshow(INU2), title('C) Uniformidad 2')
subplot(2,3,4), imshow(IG), title('D) Imagen Original')
subplot(2,3,5), imshow(INGU), title('E) Uniformidad 1 en escala de grises')
subplot(2,3,6), imshow(INGU2), title('F) Uniformidad 2 en escala de grises')

%% Actividad 2
close all
Kmed = (1/81)*ones(9);
KPond = (1/32)*[1 2 1 ; 2 4 2; 1 2 1];

Filtm = imfilter(IN,Kmed);
Filtp = imfilter(IN,KPond);
ING = rgb2gray(IN);
Filtmedi = medfilt2(ING);

figure,
subplot(2,2,1), imshow(IN) , title('A) Imagen con ruido');
subplot(2,2,2), imshow(Filtm), title('B) Filtro de Media');
subplot(2,2,3), imshow(Filtp), title('C) Filtro de Media ponderada');
subplot(2,2,4), imshow(Filtmedi), title('D) Filtro de Mediana');

%% Salt

INSG = rgb2gray(INS);
INPG = rgb2gray(INP);

Filtms = imfilter(INS,Kmed);
Filtps = imfilter(INS,KPond);
Filtmp = imfilter(INP,Kmed);
Filtpp = imfilter(INP,KPond);
Filtmedis = medfilt2(INSG);
Filtmedip = medfilt2(INPG);

figure,
subplot(2,2,1), imshow(INS) , title('A) Imagen con ruido');
subplot(2,2,2), imshow(Filtms), title('B) Filtro de Media');
subplot(2,2,3), imshow(Filtps), title('C) Filtro de Media ponderada');
subplot(2,2,4), imshow(Filtmedis), title('D) Filtro de Mediana');

%%

figure,
subplot(2,2,1), imshow(INP) , ...
    title('A) Imagen con ruido')
subplot(2,2,2), imshow(Filtmp), ...
    title('B) Filtro de Media')
subplot(2,2,3), imshow(Filtpp), ...
    title('C) Filtro de Media ponderada')
subplot(2,2,4), imshow(Filtmedip), ...
    title('D) Filtro de Mediana')

%% Uniforme 

INUG = rgb2gray(INU);

Filtmu = imfilter(INU,Kmed);
Filtpu = imfilter(INU,KPond);
Filtmediu = medfilt2(INUG);

figure,
subplot(2,2,1), imshow(INU) , ...
    title('A) Imagen con ruido')
subplot(2,2,2), imshow(Filtmu), ...
    title('B) Filtro de Media')
subplot(2,2,3), imshow(Filtpu), ...
    title('C) Filtro de Media ponderada')
subplot(2,2,4), imshow(Filtmediu), ...
    title('D) Filtro de Mediana')

%% Actividad 3
% Sustraccion media

% Filtro de sustraccion media
KSM = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Filtro laplaciano
KLap = fspecial('laplacian');

% Filtro menos laplaciano
KmLap = -KLap;

FSM = imfilter(I,KSM);
FL = imfilter(I,KLap);
FmL = imfilter(I,KmLap);

figure,
subplot(2,2,1), imshow(I) , ...
    title('A) Imagen original')
subplot(2,2,2), imshow(FSM), ...
    title('B) Filtro de Sustraccion media')
subplot(2,2,3), imshow(FL), ...
    title('C) Filtro Laplaciano')
subplot(2,2,4), imshow(FmL), ...
    title('D) Filtro menos Laplaciano')


% Lo mismo pero para escala de grises

FSM = imfilter(IG,KSM);
FL = imfilter(IG,KLap);
FmL = imfilter(IG,KmLap);

figure,
subplot(2,2,1), imshow(IG) , title('A) Imagen con original');
subplot(2,2,2), imshow(FSM), title('B) Filtro de Sustraccion media');
subplot(2,2,3), imshow(FL), title('C) Filtro Laplaciano');
subplot(2,2,4), imshow(FmL), title('D) Filtro menos Laplaciano');

%% Actividad 4

% Norte
Kn = [1 1 1; 1 -2 1 ; -1 -1 -1];

% Este
Ke = [-1 1 1; -1 -2 1 ;-1 1 1] ;

FN = imfilter(I,Kn);
FS = imfilter(I, Kn, 'conv'); 
FE = imfilter(I,Ke);
FO = imfilter(I, Ke, 'conv');

FT = FN + FS + FE + FO;

figure,
subplot(2,3,1), imshow(I) , title('A) Imagen original');
subplot(2,3,2), imshow(FN), title('B) Filtro Norte');
subplot(2,3,3), imshow(FS), title('C) Filtro Sur');
subplot(2,3,4), imshow(FE), title('D) Filtro Este');
subplot(2,3,5), imshow(FO), title('E) Filtro Oeste');
subplot(2,3,6), imshow(FT), title('F) Suma de los filtros direccionales');

% Lo mismo para escala de grises

figure,
FNG = imfilter(IG,Kn);
FSG = imfilter(IG, Kn, 'conv'); 
FEG = imfilter(IG,Ke);
FOG = imfilter(IG, Ke, 'conv');

FTG = FNG + FSG + FEG + FOG;

subplot(2,3,1), imshow(IG), title('A) Imagen original');
subplot(2,3,2), imshow(FNG), title('B) Filtro Norte');
subplot(2,3,3), imshow(FSG), title('C) Filtro Sur');
subplot(2,3,4), imshow(FEG), title('D) Filtro Este');
subplot(2,3,5), imshow(FOG), title('E) Filtro Oeste');
subplot(2,3,6), imshow(FTG), title('F) Suma de los filtros direccionales');

% Sobel RGB

KSC = fspecial('sobel');
KSF = KSC.';

SC = imfilter(I,KSC);
SF = imfilter(I,KSF);
ST = SC + SF;

figure,
subplot(2,2,1), imshow(I), title('A) Imagen original');
subplot(2,2,2), imshow(SC), title('B) Filtro Sobel Horizontal');
subplot(2,2,3), imshow(SF), title('C) Filtro Sobel Vertical');
subplot(2,2,4), imshow(ST), title('D) Filtro Sobel');

% Sobel Gris

SCG = edge(IG,'sobel','horizontal');
SFG = edge(IG, 'sobel','vertical');
STG = SCG+SFG;

figure,
subplot(2,2,1), imshow(IG), title('A) Imagen original');
subplot(2,2,2), imshow(SCG), title('B) Filtro Sobel Horizontal');
subplot(2,2,3), imshow(SFG), title('C) Filtro Sobel Vertical');
subplot(2,2,4), imshow(STG), title('D) Filtro Sobel');

% Canny

C = edge(IG, 'canny');

figure,
subplot(1,2,1), imshow(IG), title('A) Imagen original');
subplot(1,2,2), imshow(C), title('B) Filtro Canny');

% Prewitt

Pv = fspecial('Prewitt');
Ph = Pv.';
P45 = imrotate(Pv,45, 'crop');
Pm45 = imrotate(Pv,-45, 'crop');

FPv = imfilter(IG,Pv);
FPh = imfilter(IG,Ph);
FP45 = imfilter(IG,P45);
FPm45 = imfilter(IG,Pm45);
FPT = FPv + FPh + FP45 + FPm45;

figure,
subplot(2,3,1), imshow(IG), title('A) Imagen original');
subplot(2,3,2), imshow(FPv), title('B) Filtro Prewitt vertical');
subplot(2,3,3), imshow(FPh), title('C) Filtro Prewitt horizontal');
subplot(2,3,4), imshow(FPm45), title('D) Filtro Prewitt -45°');
subplot(2,3,5), imshow(FP45), title('E) Filtro Prewitt 45°');
subplot(2,3,6), imshow(FPT), title('F) Suma de los filtros Prewitt');

%% Actividad 5

% Suivizado conservador
close all
clear all
clc
I = imread('koala.jpg');
IG = rgb2gray(I);

IS = imnoise(I,'salt & pepper',0.05) ;
IGS = imnoise(IG,'salt & pepper',0.05) ;

[m, n] = size(IG);

arr = zeros(1,8);

Canvas1 = zeros(m-2,n-2,3);
Canvas2 = zeros(m-2,n-2);
a = 1;
b = 1;
p = 1;

for z = 1:3
    for i = 2:m-1
        for j = 2:n-1
             for s = -a:a
                 for t = -b:b
                    if(s ~= 0 && t ~= 0)
                        arr(p) = IS(i+s,j+t,z);
                        p = p + 1;
                        
                    end
                 end
             end
             p = 1;
             
             if(IS(i,j,z) > max(arr))
                 Canvas1(i-1,j-1,z) = max(arr);
                 
             elseif(IS(i,j,z) < min(arr))
                 Canvas1(i-1,j-1,z) = min(arr);
                  
             else
                 Canvas1(i-1,j-1,z) = IS(i,j,z);
%                 Canvas1(i-1,j-1,z) = median(a+++++++++++++rr);
                
             end

        end
    end
end


figure,
subplot(1,2,1), imshow(IS), title('Imagen con ruido sal');
subplot(1,2,2), imshow(uint8(Canvas1)),title('Imagen suavizada');
%
a = 1;
b = 1;
p = 1;

for i = 2:m-1
    for j = 2:n-1
         for s = -a:a
             for t =-b:b
                 if(t ~= 0 && s ~= 0)
                    arr(p) = IGS(i+s,j+t);
                    p = p + 1;
                    
                 end
             end
         end
         p = 1;

         if(IGS(i,j) > max(arr))
             Canvas2(i-1,j-1) = max(arr);

         elseif(IGS(i,j) < min(arr))
             Canvas2(i-1,j-1) = min(arr);

         else
            Canvas2(i-1,j-1) = IGS(i, j);
%             Canvas2(i-1,j-1) = median(arr);

         end
         
    end
end

figure,
subplot(1,2,1), imshow(IGS), title('Imagen en escala de grises con ruido sal');
subplot(1,2,2), imshow(uint8(Canvas2)), title('Imagen en escala de grises suavizada');

end