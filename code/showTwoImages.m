function showTwoImages(f1,f2 )
% Show two image in a figure

im1 = imread(strcat(f1.folder,'/',f1.name));
im2 = imread(strcat(f2.folder,'/',f2.name));

figure;
subplot(1,2,1); imshow(im1);title('Detected face');
subplot(1,2,2); imshow(im2);title('Known face');
end

