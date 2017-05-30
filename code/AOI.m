function areas = AOI( img, imgs )
%AOI computes areas of intersections between an image and a group of images
%   img: an image
%   imgs: a group of images
%   ares: areas of intersection
%
% Author: Rui Zhang
% Date: 10 May 2017

xx1 = max(x1(i), x1(I(1:last-1)));
yy1 = max(y1(i), y1(I(1:last-1)));
xx2 = min(x2(i), x2(I(1:last-1)));
yy2 = min(y2(i), y2(I(1:last-1)));
w = max(0.0, xx2-xx1+1);
h = max(0.0, yy2-yy1+1);
inter = w.*h;


end

