function [dy,dy2,dx,dx2,y,y2,x,x2,tmpw,tmph] = pad(total_boxes,w,h)
% PAD moves bounding boxes out of the original image into the image.
%     total_boxes: nx9, each line contains a bounding box
%     w: width of the original image
%     h: height of the original image
% Modify codes on https://github.com/kpzhang93/
% MTCNN_face_detection_alignment/blob/master/code/codes/MTCNNv2/pad.m

% Current width and height
tmpw=total_boxes(:,3)-total_boxes(:,1)+1;
tmph=total_boxes(:,4)-total_boxes(:,2)+1;
numbox=size(total_boxes,1);

% Pre-defind variables
dx=ones(numbox,1);
dy=ones(numbox,1);
dx2=tmpw;
dy2=tmph;

% Coordinates of bounding boxes' corners
x=total_boxes(:,1);
y=total_boxes(:,2);
x2=total_boxes(:,3);
y2=total_boxes(:,4);

% If bounding boxes are out of the original image, move the outliers 
% to the boundaries
tmp=find(x2>w);
dx2(tmp)=-x2(tmp)+w+tmpw(tmp);
x2(tmp)=w;

tmp=find(y2>h);
dy2(tmp)=-y2(tmp)+h+tmph(tmp);
y2(tmp)=h;

tmp=find(x<1);
dx(tmp)=2-x(tmp);
x(tmp)=1;

tmp=find(y<1);
dy(tmp)=2-y(tmp);
y(tmp)=1;
end

