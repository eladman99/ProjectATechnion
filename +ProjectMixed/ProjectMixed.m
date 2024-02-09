function [] = ProjectMixed(Team)
% Project - Mixed Algo CE and then SA

%% initial parameters CE
params = ProjectMixed.InitParametersCE(Team.graph);

%% intial probabilites CE
probabilites = ones(params.team_size);
probabilites = probabilites -diag(diag(probabilites));

%% Finding max-cut CE
solutions = zeros(params.num_of_lotteries,size(graph,2));

iteration = 0;
curr_price = 0;
price_rep_num = 0;
best_solution = zeros(1,size(Team.graph,1));
best_price = 0;
saved_solutions = [];
saved_mean_prices = [];
saved_probabilites = [];

while iteration < params.max_iteration 
    [best_solutions sorted_prices]= ProjectMixed.GenerateBestSolutionsCE(params,Team,probabilites);
    
    % Calculating best cut CE
    if sorted_prices(1)> best_price
        best_price = sorted_prices(1);
        best_solution = best_solutions(1,:);
    end

    % Calculating the average prices CE
    saved_mean_prices = [saved_mean_prices mean(sorted_prices(1:round(params.perc_best_solutions*params.num_of_lotteries)))];

    % Calculating the next probabilities CE
    probabilites = ProjectMixed.CalculateNextProbabilty(params,Team,best_solutions,probabilites);
    saved_probabilites = ProjectMixed.UpdateSavedProbabilities(saved_probabilites,probabilites);
    
    [price_rep_num,curr_price,stop] = ProjectMixed.StopingCriteriaCE(params,curr_price,sorted_prices,price_rep_num);
    if(stop)
        break;
    end
    iteration = iteration +1;
end


%% FiguresCE
ProjectMixed.DisplayingCE(params,saved_mean_prices,saved_probabilites,Team,best_solution);


%% start the SA algoritm with the current solution

current_solution = best_solution;

%% Initial parameters  SA
params = ProjectMixed.InitParametersSA(Team.graph);

%% Algorithm SA
% intialing first random solution


price_current = ProjectMixed.calc_priceSA(params,current_solution,Team.graph);
best_price = price_current;
best_solution = current_solution;

saved_temprature = [];
saved_probabilty_to_take = [];
saved_prices = [];
saved_solutions = [];
temprature = params.initial_temprature;

while temprature > params.final_temprature
    saved_solutions = [saved_solutions ; current_solution];
    
    saved_temprature = [saved_temprature temprature];
    saved_prices = [saved_prices best_price];

    [valid, next_guess_solution] = ProjectMixed.GenerateSolutionSA(params,Team,current_solution); 
    
    if(valid)
        [current_solution,best_price,best_solution,curr_probabilty] = ProjectMixed.DecideTheCurrSolutionSA(params,temprature,current_solution,next_guess_solution,best_price,best_solution,Team.graph);
        saved_probabilty_to_take = [saved_probabilty_to_take  curr_probabilty];
        temprature = temprature*params.pace;
    end

end

%% figures
ProjectMixed.DisplayingSA(params,saved_solutions,saved_prices,saved_probabilty_to_take,saved_temprature,best_solution,Team);
