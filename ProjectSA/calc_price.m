function [price] = calc_prices(params,groups,graph)
    price = 0;
    for i=1:params.team_size
       V1 = find(groups(1,:) == i);
       V2 = find(groups(1,:) == i);
       % if someone is alone, the price that will be added is 0
       price = price + sum(sum(graph(V1,V2)))/2;
    end
end


