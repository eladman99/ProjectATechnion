function [final_groups] = GenerateSolutionCE(params,Team,probabilites)
    left_without_team = randperm(params.team_size);
    
    team_index = 1;
    final_groups = zeros(1,params.team_size);
    while size(left_without_team,2) ~= 0 
            final_groups(left_without_team(1)) = team_index;
            left_without_team = ProjectMixed.Get_member_outCE(left_without_team,1);
            team_not_finsih = rand(1,1)>params.probabilty_to_stop;
            current_member_to_add_index = 1; 
        while team_not_finsih && current_member_to_add_index <= length(left_without_team)
           if ~ProjectMixed.MembersCombine(final_groups,left_without_team(current_member_to_add_index),team_index,probabilites)
               current_member_to_add_index = current_member_to_add_index + 1;
               continue;
           end
           if ProjectMixed.GroupValidationCE(Team,final_groups,team_index,left_without_team(current_member_to_add_index))
                final_groups(left_without_team(current_member_to_add_index)) = team_index;
                left_without_team = ProjectMixed.Get_member_outCE(left_without_team,current_member_to_add_index);
           else
                current_member_to_add_index = current_member_to_add_index + 1;
           end
           if current_member_to_add_index == length(left_without_team) +1 
                %wrap around the index if we didnt add no one from that round
                current_member_to_add_index = 1;
           end
           team_not_finsih = rand(1,1)>params.probabilty_to_stop;
         end
        team_index = team_index + 1;
    end
end
