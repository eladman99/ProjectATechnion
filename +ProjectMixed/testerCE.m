numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
k = 3;
numSamples = 1000;
numIterations = 100;
eliteFraction = 0.1;

[bestPartition, bestDifference] = ProjectCE(numbers, k, numSamples, numIterations, eliteFraction);
disp('Best Partition:');
disp(bestPartition);
disp('Best Difference:');
disp(bestDifference);