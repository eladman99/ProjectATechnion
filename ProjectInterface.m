%%
clear all;
clc;

Algorithm = input('Enter SA for Simulated-Annealing & CE for Cross-Entropy & Mix for mixed:\n','s');

if (~strcmp(Algorithm,'SA') && ~strcmp(Algorithm,'CE') && ~strcmp(Algorithm,'Mix'))
    fprintf('Wrong input!\n');
    return;
end
TypeOfTest = input('Enter Default for example or New for your own parameters\n','s');
% disp(['You entered: ' Algorithm ]);

if strcmp(TypeOfTest,'New')
    NumberOfPeople = input('Enter group size:\n');
    if (NumberOfPeople <= 0)
        fprintf('Wrong input!\n');
        return;
    end
    Team.graph  = zeros(NumberOfPeople);
    Team.gender = [];
    for i=1:NumberOfPeople
       Team.gender = [Team.gender input(['Enter gender, M or F, for ' num2str(i) ' please:\n'], 's')];
       if (Team.gender(i) ~= 'M' && Team.gender(i) ~= 'F' )
           fprintf('Wrong input!\n');
           return;
       end
    end
    for i=1:NumberOfPeople
        for j=i+1:NumberOfPeople
            Input = input(['Enter suitability for ' num2str(i) ',' num2str(j)  ' please:\n']);
            Team.graph (i,j) = Input;
            Team.graph (j,i) = Input;
        end 
    end
else
    Team = SimulateTeam();
end

switch Algorithm
    case 'SA'
        ProjectSA.ProjectSA(Team);
    case 'CE'
        ProjectCE.ProjectCE(Team);
    case 'Mix'
        ProjectMixed.ProjectMixed(Team);
end 