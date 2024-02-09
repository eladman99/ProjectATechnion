function [best_price] = ProjectSA(Team)
% Project - using simulated annealing
%%
tic

%% Initial parameters 
params = ProjectSA.InitParametersSA(Team.graph);

%% Algorithm
% intialing first random solution

current_solution = 1:1:params.team_size;

price_current = ProjectSA.calc_price(params,current_solution,Team.graph);
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

    [valid, next_guess_solution] = ProjectSA.GenerateSolution(params,Team,current_solution); 
    
    if(valid)
        [current_solution,best_price,best_solution,curr_probabilty] = ProjectSA.DecideTheCurrSolution(params,temprature,current_solution,next_guess_solution,best_price,best_solution,Team.graph);
        saved_probabilty_to_take = [saved_probabilty_to_take  curr_probabilty];
        temprature = temprature*params.pace;
    end

end

toc
%% figures
ProjectSA.Displaying(params,saved_solutions,saved_prices,saved_probabilty_to_take,saved_temprature,best_solution,Team);
