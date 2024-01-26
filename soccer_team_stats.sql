create table teamStats(
    matchesDrew int,
    matchesWon  int,
    matchesLost int,
    averageScored float,
    averageScoredAgainst    float, --assuming conceded
    currentTableRanking     int,
    year_                  int not null,
    TeamName         char(30),
    primary key (year_, TeamName),
    foreign key (TeamName) references Teams ON DELETE CASCADE);

grant select on teamStats to public;

-- Premier League

-- Arsenal Stats:
-- 2023/2024 current season
insert into teamStats values(
    3,
    9,
    1,
    2.1, --avg goals scored in 13 matches
    0.8,
    1,
    2023, --2023/24 season
    'Arsenal');

-- 2022/2023
insert into teamStats values(
    6,
    26,
    6,
    2.3, --avg goals scored in 38 matches
    1.1,
    2,
    2022, 
    'Arsenal');

-- 2021/2022
insert into teamStats values(
    3,
    22,
    13,
    1.6, --avg goals scored in 38 matches
    1.3,
    5,
    2021,
    'Arsenal');

-- Liverpool Stats:
-- 2023/2024 current season
insert into teamStats values(
    4,
    8,
    1,
    2.2, --avg goals scored in 13 matches
    0.8,
    3,
    2023, --2023/24 season
    'Liverpool');

-- 2022/2023
insert into teamStats values(
    10,
    19,
    9,
    2, --avg goals scored in 38 matches
    1.2,
    5,
    2022, 
    'Liverpool');

-- 2021/2022
insert into teamStats values(
    8,
    28,
    2,
    2.5, --avg goals scored in 38 matches
    0.7,
    2,
    2021,
    'Liverpool');


-- Manchester United Stats:
-- 2023/2024 current season
insert into teamStats values(
    0,
    8,
    5,
    1.2, --avg goals scored in 13 matches
    1.2,
    6,
    2023, --2023/24 season
    'Manchester United');

-- 2022/2023
insert into teamStats values(
    6,
    23,
    9,
    1.5, --avg goals scored in 38 matches
    1.1,
    3,
    2022, 
    'Manchester United');

-- 2021/2022
insert into teamStats values(
    10,
    16,
    12,
    1.5, --avg goals scored in 38 matches
    1.5,
    6,
    2021,
    'Manchester United');



-- Laliga

-- Barcelona Stats:
-- 2023/2024 current season
insert into teamStats values(
    4,
    9,
    1,
    1.9, --avg goals scored in 14 matches
    1,
    4,
    2023, --2023/24 season
    'Barcelona');

-- 2022/2023
insert into teamStats values(
    4,
    28,
    6,
    1.8, --avg goals scored in 38 matches
    0.5,
    1,
    2022, 
    'Barcelona');

-- 2021/2022
insert into teamStats values(
    10,
    21,
    7,
    1.8, --avg goals scored in 38 matches
    1,
    2,
    2021,
    'Barcelona');

-- Real Madrid Stats:
-- 2023/2024 current season
insert into teamStats values(
    2,
    11,
    1,
    2.2, --avg goals scored in 14 matches
    0.6,
    1,
    2023, --2023/24 season
    'Real Madrid');

-- 2022/2023
insert into teamStats values(
    6,
    24,
    8,
    2, --avg goals scored in 38 matches
    1,
    2,
    2022, 
    'Real Madrid');

-- 2021/2022
insert into teamStats values(
    8,
    26,
    4,
    2.1, --avg goals scored in 38 matches
    0.8,
    1,
    2021,
    'Real Madrid');
    
-- Atlético Madrid Stats:
-- 2023/2024 current season
insert into teamStats values(
    1,
    10,
    2,
    2.3, --avg goals scored in 13 matches
    0.9,
    3,
    2023, --2023/24 season
    'Atletico Madrid');

-- 2022/2023
insert into teamStats values(
    8,
    23,
    7,
    1.8, --avg goals scored in 38 matches
    0.9,
    3,
    2022, 
    'Atletico Madrid');

-- 2021/2022
insert into teamStats values(
    8,
    21,
    9,
    1.7, --avg goals scored in 38 matches
    1.1,
    3,
    2021,
    'Atletico Madrid');