function [Team] = SimulateTeamMix()
    Team.graph = [0 10 0 3 0 0 0 -inf 0 0 -inf 0 0 0;
                  10 0 10 10 0 0 0 0 0 0 0 0 0 0;
                  0 10 0 10 0 0 0 0 0 0 0 0 0 0;
                  3 10 10 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 10 0 0 0 0 0 0 0 0;
                  0 0 0 0 10 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 10 10 0 0 0 0 0;
                  -inf 0 0 0 0 0 10 0 10 0 0 0 0 0;
                  0 0 0 0 0 0 10 10 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 15 15 15 0;
                  -inf 0 0 0 0 0 0 0 0 15 0 15 15 0;
                  0 0 0 0 0 0 0 0 0 15 15 0 15 0;
                  0 0 0 0 0 0 0 0 0 15 15 15 0 0;
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0
                        ];

    Team.graph = Team.graph + 3 ;
    Team.gender = ['M' 'M' 'M' 'M' 'F' 'F' 'F' 'F' 'F' 'F' 'F' 'F' 'M' 'F'];