% MAX CUT using simulated annealing
%%
clear all;
clc;

%% Creating a graph
max_edge_value = 10;
num_of_nodes = 8;
[graph,group_size] = SimulateGraph(num_of_nodes,max_edge_value);

%% initial parameters
params = InitParametersSA(graph);

%% Algorithm
% intialing first random solution
p = 0.5*ones(1,params.num_of_nodes);
generated = rand(1,params.num_of_nodes);
current_solution = p > generated;

price_current = calc_price(current_solution,graph);
best_price = price_current;
best_cut = current_solution;

saved_solutions = [];
temprature = params.initial_temprature;

while temprature > params.final_temprature
    saved_solutions = [saved_solutions ; current_solution];
    
    rand_node_to_change = randi(params.num_of_nodes);
    next_guess_solution = current_solution;
    next_guess_solution(rand_node_to_change) = not(next_guess_solution(rand_node_to_change)); 
    
    [next_guess_solution,best_price,best_cut] = DecideTheCurrSolution(params,temprature,current_solution,next_guess_solution,best_price,best_cut,graph);

    temprature = temprature*params.pace; 
end


%% figures
Displaying(params,saved_solutions,best_cut);



