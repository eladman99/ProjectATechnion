function [params] = InitParametersCE(graph)
    params.num_of_lotteries = 1000;
    params.team_size = size(graph,1);
    params.seq_stop_number = 20;
    params.perc_best_solutions = 0.01;
    params.max_iteration = 10;
    params.perc_of_advance = 0.2;
    params.probabilty_to_stop = 0.1;

end
