function [params] = InitParametersSA(graph)
    params.initial_temprature = 1e4;
    params.final_temprature = 1;
    params.pace = 0.9995;
    params.norm = 1e0;
    params.team_size = size(graph,1);
    params.probability_to_be_alone = 0.1;
end