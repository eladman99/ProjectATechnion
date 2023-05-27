function [price] = calc_price(partitions,graph)
       V1 = find(partitions(1,:));
       V2 = find(~partitions(1,:));
       price = sum(sum(graph(V1,V2)));
end
