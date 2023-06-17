% Project - using Cross-Entropy
%%
clear all;
clc;

%% Creating team
Team = SimulateTeamCE();

%% initial parameters
params = InitParametersCE(Team.graph);

%% intial probabilites
probabilites = ones(params.team_size);

solution = GenerateSolutionCE(params,Team,probabilites);

%% Finding max-cut
solutions = zeros(params.num_of_lotteries,size(graph,2));

iteration = 0;
curr_price = 0;
price_rep_num = 0;
saved_solutions = [];
saved_prices = [];

while iteration < params.max_iteration 
    [best_solutions sorted_prices]= GenerateBestSolutions(params,Team,probabilites);
    
    % Calculating the average prices
    saved_prices = [saved_prices mean(sorted_prices)];

    % Calculating the next p
    probabilites = CalculateNextProbabilty(params,Team,best_solutions,probabilites);


    [price_rep_num,curr_price,stop] = StopingCriteriaCE(params,curr_price,sorted_prices,price_rep_num);
    if(stop)
        break;
    end
    iteration = iteration +1;
end
    

%% Figures
%Displaying(params,saved_prices,p,max_price);
