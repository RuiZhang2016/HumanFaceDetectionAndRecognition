function features = face2features(img,net)
% FACE2FEATURES uses NN to extracts features
% img: an image, mxnx3
% net: vgg network
% features: 4096 dimensional features
% 
% Author: Rui Zhang
% Date: 13 May 2017

im_ = single(img);
im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
im_ = im_ - net.meta.normalization.averageImage;

% Extracting features by VGG
res = vl_simplenn(net, im_);
features = squeeze(gather(res(35).x));
features = features/sqrt(sum(features.^2));

end

