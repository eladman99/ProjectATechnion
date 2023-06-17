function [price_rep_num,curr_price,stop] = StopingCriteriaC(params,curr_price,next_prices,price_rep_num)
    if(curr_price == next_prices(1))
        price_rep_num = price_rep_num + 1;
    else
        price_rep_num = 0;
    end
    stop = false;   
    if(price_rep_num == params.seq_stop_number)
        stop = true;
    end
    curr_price = next_prices(1);
end
