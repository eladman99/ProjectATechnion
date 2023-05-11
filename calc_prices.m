function [prices] = calc_prices(partitions,E)
    N = size(partitions,1);
    prices = zeros(N,1);
    for i=1:N
       V1 = find(partitions(i,:));
       V2 = find(~partitions(i,:));
       prices(i) = sum(sum(E(V1,V2)));
    end
end
