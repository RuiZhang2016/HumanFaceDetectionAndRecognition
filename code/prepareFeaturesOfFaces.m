% Use VGG net to extract features of faces with face alignment.
close all;
clear;
clc;

% Add paths
run startup.m
index = 3;
dataPath=fullfile(home,'res',strcat('detected_faces',num2str(index)),'*.jpg');

% Read images
files = dir(dataPath);
nImages = size(files,1)-1;

features =[];
for ii = 1:nImages
    img=imread(strcat(files(ii).folder,'/',files(ii).name));
    features = [features face2features(img,net)];
end
save(strcat('../res/detected_faces',num2str(index),'/features.mat'),'features');