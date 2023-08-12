function [combine_members] = MembersCombine(final_groups,new_member,team_index,probabilites)
    members_indexes = find(final_groups,team_index);
    avg_probabilty = mean(probabilites(members_indexes,new_member))/sum(probabilites(new_member,:));
    combine_members = rand(1,1)<avg_probabilty;
     if avg_probabilty > 1 %DEBUG
         print("avg_probabilty > 1");
     end
end
