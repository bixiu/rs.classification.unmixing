% Classes: 1, 7, 9 have to few training pixels. Even if we rearrange
% and transfer most of the test pixels as training pixels, the num. of
% rows (pixels) < num of dimensions. So we discard these 3 classes from
% our analysis. Classes 4 and 13 have also num. of rows (pixels) < num
% of dimensions, but we could increase this trainning pixel number by
% adding some of our testing pixels to out training set so that we can
% reach: num. of rows (pixels) > num. of dimensions

% Now using training pixels from all classes except 1, 7, 9 we check
% whether these training pixels from each class follow a Multivariate
% Normal Distribution.

function mvnd_check()
    
     [trainMatrixRe,testMatrixRe,trainLabelsRe,testLabelsRe,trainDataRe,testDataRe,means] = trainDataModify();
     % Calculate the distances of each training pixel in a specific class
     % to its mean
     
     for i = 1:15
         % for i = 1:size(trainMatrixRe,2)
         dist = [];
         if((i==1)||(i==7) ||(i==9))
             ;
         else
             C = cov(trainMatrixRe{i});
             for j = 1: size(trainMatrixRe{i},1)
                 x = trainMatrixRe{i}(j,:)';
                 d = sqrt((x-means(:,i))'*inv(C)*(x-means(:,i)));
                 dist = [dist; d*d];
             end
         end
         
         % sorting the distance vector
         sortedDist = sort(dist);
         chiValues = chi2pdf(sortedDist,size(trainMatrixRe{i},1));
         % chiValues = chi2pdf(sortedDist,166);
         figure;
         plot(chiValues,sortedDist,'r*');
         stop = 1;
     end
    stop = 1;
end