function plotResult(img, boxes, labels,res, SAVE, savingPath)
%PLOTRESULT shows detection results
%   img: a matrix containing the detected image, in a size of [m,n,3];
%   boxes: bounding box returned by MTCNN
%   labels: the labels of bounding boxes
%   res: a list of True/False denoting the results
%   SAVE: boolean, true: save detected faces, false: not save
%   savingPath: the path of folder saving detected faces
%
% Author: Rui Zhang
% Date: 9 May 2017

nbox=size(boxes,1);
display(strcat('#present students: ',num2str(nbox)));
boxes64 = int64(boxes);
f=figure();
imshow(img);
hold on;
color = ['r','g'];
for ii=1:nbox
    if sum(boxes(ii,1:4)>0)==4
        face = img(boxes64(ii,2):boxes64(ii,4),boxes64(ii,1):boxes64(ii,3),:);
        rectangle('Position',[boxes(ii,1:2) boxes(ii,3:4)-boxes(ii,1:2)],...
            'Edgecolor',color(res(ii)+1),'LineWidth',2);
        text(double(boxes(ii,1)),double(boxes(ii,2)-60),...
            num2str(labels(ii)),'Color',color(res(ii)+1),'FontSize',15);
%         if SAVE
%             imwrite(face,strcat(savingPath,'/',num2str(ii),'.jpg'));
%         end
    end
end
hold off;

if SAVE
    saveas(f,strcat(savingPath,'/wholeImg.jpg'));
end
end

