function [sorted_solutions,sorted_prices] = GenerateSortedSolutionsAndPrices(params,graph,p)
    % returns sorted solutions, sorted prices
    generated = rand(params.num_of_lotteries,params.num_of_nodes);  
    solutions = p > generated;
    curr_prices = calc_prices(solutions,graph);
    [sorted_prices, idx_sorted] = sort(curr_prices,'descend');
    sorted_solutions = solutions(idx_sorted,:);
end
