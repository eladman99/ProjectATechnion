
block2M = [0 10;
          10 0];    % Price = 20/2 = 10
block2M_gender = 'MM';
block2F = [0 10;
          10 0];    % Price = 20/2 = 10
block2F_gender = 'FF';
block2MF = [0 10;
          10 0];    % Price = 20/2 = 10
block2MF_gender = 'MF';
block3 = [0 8 10;
          8 0 8 ;
          10 8 0];  % Price = 52/2.5 = 20.8
block3_gender = 'FFF';
block4 = [0 8 10 9;
          8 0 8 9 ;
          10 8 0 7;
          9 9 7 0];  % Price = 102/3 = 34
block4_gender = 'MMMM';

BestPrice = zeros(1,10);
OurPriceSA = zeros(1,10);
OurPriceCE = zeros(1,10);
X = zeros(1,10); %Number fo people

%% 1st iteration
Team.graph = blkdiag(block4);
Team.gender = block4_gender;
X(1) = 4;
BestPrice(1) = 34;
OurPriceSA(1) =  ProjectSA.ProjectSA(Team);
OurPriceCE(1) =  ProjectCE.ProjectCE(Team);

%% 2nd iteration
Team.graph = blkdiag(block4,block2M);
Team.gender = [block4_gender block2M_gender];
X(2) = 6;
BestPrice(2) = 34 + 10;
OurPriceSA(2) =  ProjectSA.ProjectSA(Team);
OurPriceCE(2) =  ProjectCE.ProjectCE(Team);

%% 3rd iteration
Team.graph = blkdiag(block4,block2M,block2F);
Team.gender = [block4_gender block2M_gender block2F_gender ];
X(3) = 8;
BestPrice(3) = 34 + 10 + 10;
OurPriceSA(3) =  ProjectSA.ProjectSA(Team);
OurPriceCE(3) =  ProjectCE.ProjectCE(Team);

%% 4rd iteration
Team.graph = blkdiag(block4,block2M,block2F,block3);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender];
X(4) = 11;
BestPrice(4) = 34 + 10 + 10 + 20.8;
OurPriceSA(4) =  ProjectSA.ProjectSA(Team);
OurPriceCE(4) =  ProjectCE.ProjectCE(Team);

%% 5th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender];
X(5) = 13;
BestPrice(5) = 34 + 10 + 10 + 20.8 +10;
OurPriceSA(5) =  ProjectSA.ProjectSA(Team);
OurPriceCE(5) =  ProjectCE.ProjectCE(Team);

%% 6th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF,block2M);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender block2M_gender];
X(6) = 15;
BestPrice(6) = 34 + 10 + 10 + 20.8 +10 +10;
OurPriceSA(6) =  ProjectSA.ProjectSA(Team);
OurPriceCE(6) =  ProjectCE.ProjectCE(Team);

%% 7th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF,block2M, block3);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender block2M_gender block3_gender];
X(7) = 18;
BestPrice(7) = 34 + 10 + 10 + 20.8 +10 +10 + 20.8;
OurPriceSA(7) =  ProjectSA.ProjectSA(Team);
OurPriceCE(7) =  ProjectCE.ProjectCE(Team);

%% 8th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF,block2M, block3, block2MF);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender block2M_gender block3_gender block2MF_gender];
X(8) = 20;
BestPrice(8) = 34 + 10 + 10 + 20.8 +10 +10 + 20.8 +10;
OurPriceSA(8) =  ProjectSA.ProjectSA(Team);
OurPriceCE(8) =  ProjectCE.ProjectCE(Team);

%% 9th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF,block2M, block3, block2MF,block2F);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender block2M_gender block3_gender block2MF_gender block2F_gender];
X(9) = 22;
BestPrice(9) = 34 + 10 + 10 + 20.8 +10 +10 + 20.8 +10 +10;
OurPriceSA(9) =  ProjectSA.ProjectSA(Team);
OurPriceCE(9) =  ProjectCE.ProjectCE(Team);

%% 10th iteration
Team.graph = blkdiag(block4,block2M,block2F,block3,block2MF,block2M, block3, block2MF,block2F, block2M);
Team.gender = [block4_gender block2M_gender block2F_gender block3_gender block2MF_gender block2M_gender block3_gender block2MF_gender block2F_gender block2M_gender];
X(10) = 24;
BestPrice(10) = 34 + 10 + 10 + 20.8 +10 +10 + 20.8 +10 +10 +10;
OurPriceSA(10) =  ProjectSA.ProjectSA(Team);
OurPriceCE(10) =  ProjectCE.ProjectCE(Team);

%% Plot

figure(1);
plot(X,BestPrice,'-', 'MarkerEdgeColor', 'r','MarkerFaceColor', 'b');
hold on;
plot(X,OurPriceSA,'-', 'MarkerEdgeColor', 'r','MarkerFaceColor', 'r');
plot(X,OurPriceCE,'-', 'MarkerEdgeColor', 'r','MarkerFaceColor', 'r');
scatter(X, BestPrice, 'o', 'MarkerEdgeColor', 'r','MarkerFaceColor', 'b');
scatter(X, OurPriceCE, 'o', 'MarkerEdgeColor', 'y','MarkerFaceColor', 'y');
scatter(X, OurPriceSA, 'o', 'MarkerEdgeColor', 'r','MarkerFaceColor', 'r');
ylabel('Price');
xlabel('Group size');
title('Robustness check for SA and CE');
legend('Optimal price','SA price','CE price');
hold off;

