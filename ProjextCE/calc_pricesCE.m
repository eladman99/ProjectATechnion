function [prices] = calc_pricesCE(params,groups,graph)
        prices = zeros(params.num_of_lotteries,1);
    for i=1:params.num_of_lotteries
        for k=1:params.team_size
            V1 = find(groups(1,:) == k);
            V2 = find(groups(1,:) == k);
            % if someone is alone, the price that will be added is 0
            % calculating each team's grade, according to it's size, 
            % for bigger team, we normalize it.
            switch size(V1,2)
               case 3 
                 prices(i) = prices(i) + sum(sum(graph(V1,V2)))/4;
               case 4
                 prices(i) = prices(i) + sum(sum(graph(V1,V2)))/3;
               otherwise
                 prices(i) = prices(i) + sum(sum(graph(V1,V2)))/2;
           end
        end
    end
end


