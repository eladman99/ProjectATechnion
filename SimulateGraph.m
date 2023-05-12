function [graph,group_size] = SimulateGraph(number_of_nodes,max_edge_value)
    group_size = floor(rand(1,1)*number_of_nodes);
    random_matrix = randi([1,max_edge_value],number_of_nodes,number_of_nodes);
    graph = triu (random_matrix);
    graph = graph - graph';
    graph = abs(graph);
    graph(1:group_size,1:group_size) = 0;
    graph(group_size+1:number_of_nodes,group_size+1:number_of_nodes) = 0;
end
