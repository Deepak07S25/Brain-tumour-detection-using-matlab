clc;
close all;
clear all;
 
im1=imread('livingroom.tif');   
                                                    %Read the image
[r c]=size(im1);                        %Number of rows and columns
 
r_mask=input('Enter the number of rows: '); 
                                  %Number of rows of masking matrix
c_mask=input('Enter the number of columns: '); 
                               %Number of columns of masking matrix
 
mask=input('Enter the masking matrix: ');           %Masking matrix
 
r_add=((r_mask-1)/2);                  %Number of rows to be padded
c_add=((c_mask-1)/2);               %Number of columns to be padded
 
padding=padarray(im1,[r_add c_add],0);                %Zero Padding
 
pad_d=double(padding);                %Integer into Double Datatype
 
for i=(1+r_add):(r+r_add)
    for j=(1+c_add):(c+c_add)
        sub_img=pad_d(i-r_add:i+r_add,j-c_add:j+c_add);
        
        con_sum=sum(sum(mask .* sub_img));             %Convolution
        
        result(i-r_add,j-c_add)=con_sum;        %New Filtered image
    end
end
 
im1=double(im1);                      %Integer into Double datatype
 
sharpening= result+im1;                        %Sharpening of Image
 
im1=uint8(im1);                       %Double into Integer datatype
subplot(1,2,1);
imshow(im1);                            %Display the Original image
title('Original Image');
subplot(1,2,2);
imshow(result);                         %Display the Filtered image
title('Filtered Image');
 







figure;
 
subplot(1,2,1);
imshow(im1);                %Display the Original image
title('Orginal Image');
 
sharp=uint8(sharpening);    %Double into Integer datatype
subplot(1,2,2);
imshow(sharp);              %Display the Sharpened image
title('Sharpened Image');

 

 
