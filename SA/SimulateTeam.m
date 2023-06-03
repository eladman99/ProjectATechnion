function [Team] = SimulateTeam()
    Team.graph = [0 10 0 0 0 0 0 0;
                  10 0 0 0 0 0 0 0;
                  0 0 0 11 0 0 0 0;
                  0 0 11 0 0 0 0 0;
                  0 0 0 0 0 14 0 0;
                  0 0 0 0 14 0 0 0;
                  0 0 0 0 0 0 0 16;
                  0 0 0 0 0 0 16 0
                        ];
    Team.gender = ['M' 'M' 'F' 'M' 'M' 'F' 'F' 'F'];
    Team.a = 1;