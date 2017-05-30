function [PNet,RNet,ONet,LNet] = loadModels()
% LOADMODELS loads caffe models into Matlab
%    PNet,RNet,ONet: three CNN architectures, see details in 
% Zhang, Kaipeng, Zhanpeng Zhang, Zhifeng Li, and Yu Qiao. "Joint 
% Face Detection and Alignment Using Multitask Cascaded Convolutional
% Networks." IEEE Signal Processing Letters 23, no. 10 (2016): 1499-1503.
% 
% Author: Rui Zhang
% Date: 14 May 2017

caffeModelPath='./model';
%load caffe models
prototxtDir =strcat(caffeModelPath,'/det1.prototxt');
modelDir = strcat(caffeModelPath,'/det1.caffemodel');
PNet=caffe.Net(prototxtDir,modelDir,'test');
prototxtDir = strcat(caffeModelPath,'/det2.prototxt');
modelDir = strcat(caffeModelPath,'/det2.caffemodel');
RNet=caffe.Net(prototxtDir,modelDir,'test');	
prototxtDir = strcat(caffeModelPath,'/det3.prototxt');
modelDir = strcat(caffeModelPath,'/det3.caffemodel');
ONet=caffe.Net(prototxtDir,modelDir,'test');	
prototxtDir = strcat(caffeModelPath,'/det4.prototxt');
modelDir = strcat(caffeModelPath,'/det4.caffemodel');
LNet=caffe.Net(prototxtDir,modelDir,'test');	
end
