function [price] = calc_price(params,groups,graph)
    price = 0;
    for i=1:params.team_size
       V1 = find(groups(1,:) == i);
       V2 = find(groups(1,:) == i);
       % if someone is alone, the price that will be added is 0
       % calculating each team's grade, according to it's size, 
       % for bigger team, we normalize it.
       switch size(V1,2)
           case 3 
             price = price + sum(sum(graph(V1,V2)))/2.5;
           case 4
             price = price + sum(sum(graph(V1,V2)))/3;
           otherwise
             price = price + sum(sum(graph(V1,V2)))/2;
       end
    end
end


