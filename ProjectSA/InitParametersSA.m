function [params] = InitParametersSA(graph)
    params.initial_temprature = 1e4;
    params.final_temprature = 1;
    params.pace = 0.995;
    params.norm = 1e0;
    params.team_size = size(graph,1);
    params.probability_to_rand_group = 0.01;
    params.probability_to_double_change = 0.0;
end
