function [params] = InitParametersCE(graph)
    params.num_of_lotteries = 100;
    params.num_of_nodes = size(graph,1);
    params.seq_stop_number = 5;
    params.perc_best_solutions = 0.05;
    params.max_iteration = 10000;

end
