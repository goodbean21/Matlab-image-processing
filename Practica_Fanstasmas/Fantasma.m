function Fantasma
    close all
    clear all
    warning off
    clc
%%
    diff1 = 0;
    diff2 = 0;
    dur = 0;
    x = 0;
    y = 0;
    vidObj1 = 0;
    vidObj2 = 0;
    a = .8;
    
    vidObj1 = VideoReader('VID_20180129_104548.mp4');
    vidObj2 = VideoReader('VID_20180129_104612.mp4');

    x = round(vidObj1.Duration*vidObj1.FrameRate-1);
    y = round(vidObj2.Duration*vidObj2.FrameRate-1);
    
    if x > y
        diff1 = x - y - 1;
        dur = y;
        
    elseif y > x
        diff2 = y - x - 1;
        dur = x;
        
    else
        diff2 = 0;
        diff1 = 0;
        dur = x;
        
    end

    for i = 330:1:dur-55
       vidFrame1 = read(vidObj1,i + diff1);
       vidFrame2 = read(vidObj2,i + diff2);
       vidFrame3 = .9*((a*(vidFrame1)+(1-a)*vidFrame2)-40);
       vidGray = rgb2gray(vidFrame3);
       noise = imnoise(vidGray,'gaussian');
       imshow(noise);

    end
end
