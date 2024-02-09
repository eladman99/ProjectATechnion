function [best_valid_price] = ProjectCE(Team)
% Project - using Cross-Entropy
%%
tic

%% initial parameters
params = ProjectCE.InitParametersCE(Team.graph);

%% intial probabilites
probabilites = ones(params.team_size);
probabilites = probabilites -diag(diag(probabilites));

%% Finding max-cut
solutions = zeros(params.num_of_lotteries,size(graph,2));

iteration = 0;
curr_price = 0;
price_rep_num = 0;
best_solution = zeros(1,size(Team.graph,1));
best_price = 0;
saved_solutions = [];
saved_mean_prices = [];
saved_probabilites = [];
best_valid_solution = 1:1:size(Team.graph,1);
best_valid_price = 0;

while iteration < params.max_iteration 
    [best_solutions sorted_prices]= ProjectCE.GenerateBestSolutions(params,Team,probabilites);
    
    % Calculating best cut
    if sorted_prices(1)> best_price
        best_price = sorted_prices(1);
        best_solution = best_solutions(1,:);
    end

    % Calculating the average prices
    saved_mean_prices = [saved_mean_prices mean(sorted_prices(1:round(params.perc_best_solutions*params.num_of_lotteries)))];

    % Calculating the next p
    probabilites = ProjectCE.CalculateNextProbabilty(params,Team,best_solutions,probabilites);
    saved_probabilites = ProjectCE.UpdateSavedProbabilities(saved_probabilites,probabilites);
    
    % Saving best valid solution
    if ProjectCE.SavingValidSolution(Team,best_solution) && best_valid_price < best_price
        best_valid_solution = best_solution;
        best_valid_price = best_price;
    end

    [price_rep_num,curr_price,stop] = ProjectCE.StopingCriteriaCE(params,curr_price,sorted_prices,price_rep_num);
    if(stop)
        break;
    end
    iteration = iteration +1;
end

toc
%% Figures
ProjectCE.Displaying(params,saved_mean_prices,saved_probabilites,Team,best_solution,best_valid_solution);
