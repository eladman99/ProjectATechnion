% MAX CUT using Cross Entropy
%%
clear all;
clc;

%% Creating a graph
max_edge_value = 10;
number_of_nodes = 30;
[graph,group_size] = SimulateGraph(number_of_nodes,max_edge_value);

%% calc the max price
blokc_mat=graph(group_size+1:number_of_nodes,1:group_size);
max_price=sum(blokc_mat(:));


%% initial parameters
params = InitParametersCE(graph);

%% Finding max-cut
solutions = zeros(params.num_of_lotteries,size(graph,2));
curr_prices = zeros(params.num_of_lotteries,1);
p = 0.5*ones(params.num_of_lotteries,params.num_of_nodes);
p_mean = p(1,:);

iteration = 0;
curr_price = 0;
price_rep_num = 0;
saved_solutions = [];
saved_prices = [];

while iteration < params.max_iteration 
    [sorted_solutions, sorted_prices] = GenerateSortedSolutionsAndPrices(params,graph,p);
    best_solutions = sorted_solutions(1:round(params.perc_best_solutions*params.num_of_lotteries),:);
    
    % Calculating the average prices
    saved_prices = [saved_prices mean(sorted_prices)];

    % Calculating the next p
    p_mean = p_mean*params.perc_of_advance + (1-params.perc_of_advance)*mean(best_solutions,1);
    p = repmat(p_mean,params.num_of_lotteries,1);
    
    saved_solutions = [saved_solutions ; p_mean];

    [price_rep_num,curr_price,stop] = StopingCriteria(params,curr_price,sorted_prices,price_rep_num);
    if(stop)
        break;
    end
    iteration = iteration +1;
end
    

%% Figures
Displaying(params,saved_solutions,saved_prices,p,max_price);

