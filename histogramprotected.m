clc;
clear all;
close all;
 
im1=imread('pout.tif');               %Image
subplot(2,2,1);
imshow(im1);                               %Display the Original Image
title('Original Image');
 
[row col]=size(im1);                    %Number of rows and Columns present in the image
 
subplot(2,2,2);
imhist(im1);                                  %Histogram of the Original Image
xlabel('Gray Level or Intensity');
ylabel('Number of Pixels');
title('Histogram of Original Image');
 
handle=imhist(im1);
cdf=cumsum(handle);                              %Cumulative Distributive Function
normalized_cdf=(1/(row*col))*cdf;      %Normalization Of CDF
s=round(255*normalized_cdf);             %Transfer function of the image
 
%Mapping Of Equalized Image
for i=1:row
    for j=1:col
        r=im1(i,j);
        z=s(r+1);
        im_equ(i,j)=z;
     end
end
 







im_equ=uint8(im_equ);              %Conversion Of double into integer data type
subplot(2,2,3);
imshow(im_equ);                         %Display the Equalized image
title('Equalized Image');
 
 
subplot(2,2,4);
imhist(im_equ);                         %Histogram of New image
xlabel('Gray Level or Intensity');
ylabel('Number of Pixels');
title('Histogram of Equalized Image');
 
figure;
plot(s);                                        %Plot the Transfer Function
xlabel('Old Intensity');
ylabel('New Intensity');
title('Transfer Function');
