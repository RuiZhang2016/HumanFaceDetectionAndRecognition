function evaluationFD()
% EVALUATION plots the precision-recall curve for the prediction results.
%   res: the results of prediction
close all;

faceDetection1 = ones(58,1);
faceDetection1(4) = 0;
faceDetection1(12) = 0;
DFtarget1 = ones(58,1);
DFtarget1(12) = 0;

faceDetection2 = ones(59,1);
faceDetection2(58) = 0;
faceDetection2(55) = 0;
faceDetection2(34) = 0;
DFtarget2 = ones(59,1);

faceDetection3 = ones(59,1);
faceDetection3(59) = 0;
DFtarget3 = ones(59,1);
precisionRecall([faceDetection1;faceDetection2;faceDetection3],[DFtarget1;...
    DFtarget2;DFtarget3]);