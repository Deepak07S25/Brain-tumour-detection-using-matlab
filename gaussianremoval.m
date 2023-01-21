%Read in image
im = imread('moon.tif');
xlabel('Original');
%Add gaussian noise
noiseIm = imnoise(im, 'gaussian', .1);
subplot(2,3,1),imshow(noiseIm);
xlabel('Gaussian');
%Average filtering
denoise1 = filter2(fspecial('average',3),noiseIm)/255;
subplot(2,3,2), imshow(denoise1);
xlabel('Average Filter');
%Median filtering 
denoise2 = medfilt2(noiseIm);
subplot(2,3,3), imshow(denoise2);
xlabel('Median Filter');
%Gaussian filtering sts error
denoise3 = imgaussfilt(noiseIm, 2);
subplot(2,3,4), imshow(denoise3);
xlabel('Gausssian Filter');
%rank order filtering
denoise4 = ordfilt2(noiseIm,5,ones(3));
subplot(2,3,5), imshow(denoise4);
xlabel('Rank Order Filter');
%Weiner filtering
denoise5 = wiener2(noiseIm, [9,9]);
subplot(2,3,6), imshow(denoise5);
xlabel('Weiner Filter');