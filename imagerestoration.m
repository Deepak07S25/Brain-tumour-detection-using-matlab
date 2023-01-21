clc; 
close all; 
clear all;  

im=imread('livingroom.tif');                  %Read the image
[r,c]=size(im);                                             %Rows and Columns of the Image
im_n=imnoise(im,'salt & pepper');        %Adding Salt & Pepper Noise the image 
 
msk_r=input('Enter number of rows of the mask: ');        %Rows of Empty Mask 
msk_c=input('Enter number of columns of the mask: '); %Columns of Empty Mask

R_padded=(msk_r-1)/2;                                                         % Number of rows to be padded
C_padded=(msk_c-1)/2; ;                                                      % Number of columns to be padded
im_pad=padarray(im,[R_padded,C_padded],0);               %Zero Padding
 
 for i=(1+R_padded):(r+R_padded)
     for j=(1+C_padded):(c+C_padded)
         sub_img=im_pad(i-R_padded:i+R_padded,j-C_padded:j+C_padded);  
         med=median(median(sub_img));                               %Median Of the Image
         result(i-R_padded,j-C_padded)=med;                        %Replacing(Filtering) of the Image
     end 
 end
 
subplot(2,3,1);                                                                        
imshow(im);
title('Original Image');
 
subplot(2,3,2);
imshow(im_n);
title('Noisy Image (Salt & Pepper)');
 
subplot(2,3,3);
imshow(result);
title('Filtered Image');
 

 
