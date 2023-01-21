clear all
clc
close all
I=imread('lena.bmp');
figure, imshow(I); title('normal');
I= rgb2gray(I); %rgb to grey
figure,
imshow(I);
title('grayscale');