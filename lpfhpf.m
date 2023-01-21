clc;
close all;
clear all;
 
inp=input('1.Low Pass Filter 2.High Pass Filter \n ');    
D=input('Enter the Distance of the Filter: ');                    %Frequency Range
 
im1=imread('pout.tif');
[r c]=size(im1);                 %Rows and Columns of the image
im_d=im2double(im1);   %Integer into double datatype
 
msk=zeros(r,c);                %New Image of same rows and columns that of the original image
Cx=round(r/2);                 % X-component of  centre of the new image
Cy=round(c/2);                 % Y-component of  centre of the new image
 
for i=1:r
    for j=1:c
        Ed=sqrt(((Cx-i).^2) + ((Cy-j).^2));      %Euclidean Distance
        Ed=round(Ed);                                     %Rounding of the Euclidean Distance
        
        if inp==1                                               %For Low Pass Filter
            if Ed<=D
                msk(i,j)=255;                               %White
            else
                msk(i,j)=0;                                    %Black      
            end
        else if inp ==2                                      %For High Pass Filter
                if Ed<=D
                    msk(i,j)=0;                                %Black      
                else
                    msk(i,j)=255;                            %White
                end
            end
        end
    end
end




 
im_fft= fft2(im_d);                            %FFT of the Original Image
im_shift= fftshift(im_fft);                 %Shifting of Coordinates(Low Frequency At centre)
im_filt= (im_shift).*(msk);               %Filtering
 
im_rs=ifftshift(im_filt);                    %Reverse Shift(High Frequency at Center)
result=ifft2(im_rs);                           %IDFT
im_2=uint8(result);                          %Double into Integer datatype 
 
subplot(1,2,1);
imshow(im_fft);
title('Fourier Transform of Orignal Image');
subplot(1,2,2);
imshow(im_filt);
title('Frequency Domain');
 
figure;
 
subplot(1,2,1);
imshow(im1);
title('Original Image');
 
if inp==1
    subplot(1,2,2);
    imshow(im_2);
    title('Low Pass Filtered Image');
else
    subplot(1,2,2);
    imshow(im_2);
    title('High Pass Filtered Image');
end

