function squareboxes = rec2square(boundingboxes)
% REC2SQUARE converts bounding boxes to square boxes.
%    boundingboxes: a nx9 matrix, each row containing a bounding box.
%    squareboxes: resulting boxes
% 
% Modify codes on https://github.com/kpzhang93/
% MTCNN_face_detection_alignment/blob/master/code/codes/MTCNNv2/rerec.m

	squareboxes=boundingboxes(:,1:4);
    
    h=boundingboxes(:,4)-boundingboxes(:,2);
	w=boundingboxes(:,3)-boundingboxes(:,1);
    
    maxl=max([w';h'])';
    
    % Keep the center of the box
    % Change the upper left corner
    squareboxes(:,1)=boundingboxes(:,1)+w.*0.5-maxl.*0.5;
    squareboxes(:,2)=boundingboxes(:,2)+h.*0.5-maxl.*0.5;
    
    % Change the lower right corner
    squareboxes(:,3:4)=squareboxes(:,1:2)+repmat(maxl,[1 2]);
end

