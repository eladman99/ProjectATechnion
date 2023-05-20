function [params] = InitParametersSA(graph)
    params.initial_temprature = 1e4;
    params.final_temprature = 1;
    params.pace = 0.999;
    params.norm = 1e0;
    params.num_of_nodes = size(graph,1);
end
