function [trainData,trainLabels] = assembleTrainDataAsMatrix(initialTrainData, initialTrainMatrix, initialNeighMatrix, initialNeighData)
trainData = [];
trainLabels = [];
numClasses = 16;
for i = 1:(numClasses)
    trainData = [trainData; initialTrainMatrix{i}(:,:)];
    for j = 1:size(initialTrainMatrix{i},1)
        trainLabels = [trainLabels; i];
    end
    trainData = [trainData; initialNeighMatrix{i}];
    
    for j = 1:size(initialNeighMatrix{i},1)
        trainLabels = [trainLabels; i];
    end
end
end