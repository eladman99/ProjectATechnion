function [params] = InitParametersSA(graph)
    params.initial_temprature = 1e6;
    params.final_temprature = 1;
    params.pace = 0.995;
    params.norm = 3e0;
    params.team_size = size(graph,1);
    params.probability_to_rand_group = 0.1;
    params.probability_to_double_change = 0.3;
end
