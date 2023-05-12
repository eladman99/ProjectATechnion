function [params] = InitParametersSA(graph)
    params.initial_temprature = 1e7;
    params.final_temprature = 1;
    params.pace = 0.99;
    params.norm = 1e3;
    params.num_of_nodes = size(graph,1);
end
