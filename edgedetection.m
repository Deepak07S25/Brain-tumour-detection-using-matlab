
  
   im1=imread('circles.png'); %Original Image
[r c]=size(im1); %Rows and Columns of the image  

figure;
imshow(im1);
title('Original Image');
                                               
 
%Strucrural Elements
r_se=input('Enter the number of rows of structural elements: ');
c_se=input('Enter the number of columns of structural elements: ');
SE=input('Enter the Structural Elements: ');
 
r_pad=(r_se-1)/2;
c_padd=(c_se-1)/2;
im_pad=padarray(im1,[r_pad c_padd],0);                  %Zero Padding
 
for i= 1+r_pad : r+r_pad
    for j= 1+c_padd : c+c_padd
        
        sub_image= im_pad(i-r_pad:i+r_pad, j-c_padd:j+c_padd);
        res_1= sub_image & SE;                                         %Bitwise ANDING
        subt= res_1-SE;                                                        %If two images are equal
        
        if subt==0
            ero_res(i-r_pad,j-c_padd)= 1;                           %If Hit
        else
            ero_res(i-r_pad,j-c_padd)= 0;                           %If Miss
        end
    end
end
 
erod_edge=(im2double(im1)-ero_res);                     %Boundary Detection
 






for i= 1+r_pad : r+r_pad
    for j= 1+c_padd : c+c_padd
        
        sub_image_2= im_pad(i-r_pad:i+r_pad, j-c_padd:j+c_padd);
        res_2= sub_image_2 & SE; ;                                         %Bitwise ANDING
        
        if (sum(sum(res_2))>0)                                                 %If any HIT
            dil_res(i-r_pad,j-c_padd)= 1; ;                                 %If Hit
        else
            dil_res(i-r_pad,j-c_padd)= 0; ;                                 %If Miss
        end
    end
end
 
dil_edge=(dil_res-im2double(im1));
 
im3_pad= padarray(ero_res,[1,1]);
for i= 1+r_pad : r+r_pad
    for j= 1+c_padd : c+c_padd
        
        sub_image_2= im3_pad(i-r_pad:i+r_pad, j-c_padd:j+c_padd);
        res_3= sub_image_2 & SE; ;                                         %Bitwise ANDING
        
        if (sum(sum(res_3))>0)                                                 %If any HIT
            open(i-r_pad,j-c_padd)= 1; ;                                    %If Hit
        else
            open(i-r_pad,j-c_padd)= 0; ;                                   %If Miss
        end
    end
end
 
im4_pad= padarray(dil_res,[1,1]);
for i= 1+r_pad : r+r_pad
    for j= 1+c_padd : c+c_padd
        
        sub_image= im4_pad(i-r_pad:i+r_pad, j-c_padd:j+c_padd);
        res_1= sub_image & SE; ;                                         %Bitwise ANDING
        subt= res_1-SE;                                                           %If two images are equal
        
        if subt==0
            close(i-r_pad,j-c_padd)= 1; ;                                %If Hit
        else
            close(i-r_pad,j-c_padd)= 0; ;                                %If Miss
        end
    end
end
 

figure;
subplot(2,2,1);
imshow( ero_res);
title('Eroded Image');
 
subplot(2,2,2);
imshow(erod_edge);
title('Boundary Obtained Through Erosion');
 
subplot(2,2,3);
imshow(dil_res);
title('Dilated Image');
 
subplot(2,2,4);
imshow(dil_edge);
title('Boundary Obtained Through Dilation');
 
figure;
subplot(1,2,1);
imshow(open);
title('Opening');
 
subplot(1,2,2);
imshow(close);
title('Closing');
 
