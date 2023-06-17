function [final_groups] = GenerateSolutionCE(params,Team)
    left_without_team = randperm(params.team_size);
    
    team_index = 1;
    final_groups = zeros(1,params.team_size);
    while size(left_without_team,1) ~= 0 
            final_groups(left_without_team(1)) = team_index;
            left_without_team = Get_member_out(left_without_team,1);
            team_not_finsih = rand(1,1)>params.probabilty_to_stop;
            current_member_to_add_index = 1; 
        while team_not_finsih && current_member_to_add_index <= length(left_without_team)
           if GroupValidation(Team,final_groups,team_index,left_without_team(current_member_to_add_index))
                final_groups(current_member_to_add_index) = team_index;
                left_without_team = Get_member_out(left_without_team,current_member_to_add_index);
           end
           current_member_to_add_index = current_member_to_add_index + 1;
           team_not_finsih = rand(1,1)>params.probabilty_to_stop;
        end
        team_index = team_index + 1;
    end
end
