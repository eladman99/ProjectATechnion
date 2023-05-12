function [next_guess_solution,best_price,best_cut] = DecideTheCurrSolution(params,temprature,current_solution,next_guess_solution,best_price,best_cut,graph)
    price_current = calc_price(current_solution,graph);    
    price_next = calc_price(next_guess_solution,graph);

    delta_price = (price_next - price_current)*params.norm;
    if delta_price > 0 || rand() < exp(-delta_price/temprature)
       current_solution = next_guess_solution; 
       price_current = calc_price(current_solution,graph);
    end
    

    if price_current > best_price
        best_price = price_current;
        best_cut = current_solution;
    end 

end
