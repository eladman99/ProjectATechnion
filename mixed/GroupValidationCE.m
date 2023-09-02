function [valid] = GroupValidationCE(Team,groups,group_index,selected_member)
        valid = false;
        selected_team_indexes = find(groups == group_index);
        % checking number of male and female of the moving team
        num_of_male = sum(Team.gender(selected_team_indexes) == 'M');
        num_of_female= sum(Team.gender(selected_team_indexes) == 'F');
        if Team.gender(selected_member) == 'M'
            num_of_male = num_of_male +1;
        else 
            num_of_female = num_of_female + 1;
        end
    % Checking the validation of the new solution
    if num_of_male == 1 && num_of_female == 1
        valid = true;
    elseif num_of_male == 2 && num_of_female == 0
        valid = true;
    elseif num_of_male == 4 && num_of_female == 0
        valid = true;
    elseif num_of_male == 3 && num_of_female == 0 
        valid = true; 
    elseif num_of_male == 0 && num_of_female == 2
        valid = true;
    elseif num_of_male == 0 && num_of_female == 3
        valid = true;
    elseif num_of_male == 0 && num_of_female == 1 %% alone
        valid = true;
    elseif num_of_male == 1 && num_of_female == 0 %% alone
        valid = true;
    end
end
