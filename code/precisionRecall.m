function precisionRecall(score,target )
%precisionRecall  plots the Precision-Recall curve
%   score: prediction/classification results
%   target: ground truth

[score,inds]= sort(score);

n = size(score,1);
precision = zeros(n,1);
recall = precision;
for ii = 1:n
    TP = 0;FP = 0;FN = 0;
    threshold = score(ii);
    res = score>threshold;
    TP = res(res == target);
    TP = TP(TP>0);
    FP = res(res ~= target);
    FP = FP(FP>0);
    FN = res(res ~= target);
    FN = FN(FN<1);
    
    precision(ii) = size(TP)/(TP+FP);
    recall(ii) = TP/(TP+FN);
end

figure;
plot(recall, precision,'r-','LineWidth',2);
ylabel('Precision');
xlabel('Recall');
xlim([0 1])
ylim([0 1])
end

