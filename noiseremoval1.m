clc;
clear all;
close all;
%salt and pepper noise removal
%read in image
im = imread('cameraman.tif');
figure, subplot(2,3,1), imshow(im);
xlabel('original');
%add salt and pepper noise
noiseIm = imnoise(im, 'salt & pepper',.05);
subplot(2,3,2),imshow(noiseIm);
xlabel('Salt and Pepper');
%Average Filtering
denoise1 = filter2(fspecial('average',3), noiseIm)/255;
subplot(2,3,3), imshow(denoise1);
xlabel('Average filter');
%Median Filtering
denoise2 = medfilt2(noiseIm);
subplot(2,3,4), imshow(denoise2);
xlabel('Median filter');

%rank order filtering  
denoise4 = ordfilt2(noiseIm,5,ones(3));
subplot(2,3,5), imshow(denoise4);
xlabel('Rank Order Filter');
%wiener filtering
denoise5 = wiener2(noiseIm,[9,9]);
subplot(2,3,6), imshow(denoise5);
xlabel('wiener filter');