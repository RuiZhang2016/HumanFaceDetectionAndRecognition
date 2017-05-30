% STARTUP set configs

home = '../';
addpath(strcat(home,'./external/caffe/matlab/+caffe/private'));
caffePath = fullfile(home, 'external', 'caffe', 'matlab');
pdollarToolboxPath=fullfile(home, 'toolbox');
dataPath=fullfile(home,'data','anuclass','*.JPG');

% Add paths
addpath(genpath(caffePath));
addpath(genpath(pdollarToolboxPath));

% Run caffe on cpu
caffe.set_mode_cpu();

% Load trained models
[PNet,RNet,ONet,LNet] = loadModels();

% Load Neural Network for face recognition
cd MatConvNet;
% Setup MatConvNet.
run matlab/vl_setupnn ;
net = load('./data/models/vgg-face.mat');
net = vl_simplenn_tidy(net);
cd ../;
