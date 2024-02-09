function [left_without_team] = Get_member_out(left_without_team, index)
    if index ~= 1
        left_without_team = [left_without_team(1:index-1) left_without_team(index+1:end)];
    else if index == length(left_without_team)
        left_without_team = left_without_team(1:end-1);
    else
        left_without_team = left_without_team(2:end);
    end

end
