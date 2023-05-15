function [params] = InitParametersCE(graph)
    params.num_of_lotteries = 1000;
    params.num_of_nodes = size(graph,1);
    params.seq_stop_number = 6;
    params.perc_best_solutions = 0.01;
    params.max_iteration = 10000;

end
