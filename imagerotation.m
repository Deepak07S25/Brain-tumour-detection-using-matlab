clc;
clear all;
close all;
 
im1= imread('cameraman.tif');                  % Read the image
 
theta_d=input('Enter the angle of rotation(degree): ');
theta_r=((theta_d*3.142)/180);                % Conversion of degree into radian
 
[m,n]= size(im1);                                           % Number of rows and columns in the image
 
x_centre=round(m/2);                                 % Centre of the image
y_centre=round(n/2); 
 
for i=1:m
  p=x_centre-i;
    for j=1:n
        q=y_centre-j;                                         
        
        a=p*(cos(theta_r)) - q*(sin(theta_r));    % Origin of the image
        b=p*(sin(theta_r)) + q*(cos(theta_r));
        
        a=round(a+ (m/2)+ x_centre);                 % New Origin of the image
        b=round(b+ (n/2)+ y_centre);
        
        im2(a,b)=im1(i,j);                                        % Mapping of the image
        im2(a-1,b)=im1(i,j);
        im2(a+1,b)=im1(i,j);
        im2(a,b-1)=im1(i,j);
        im2(a,b+1)=im1(i,j);
    end
end
 

subplot(1,3,1);
imshow(im1);                                                     % Show the original image
title('Original');
 
subplot(1,3,2);
imshow(im2);                                                     % Show the image after the rotation
title('After Rotation');    
 
z=imrotate(im1,(360-theta_d));                     % By default Anti-clockwise rotation
subplot(1,3,3);
imshow(z);                                                    % Show the image after the rotation using function
title('Using Function');







Enter the angle of rotation(degree): 90
