create table teamStats(
    matchesDrew int,
    matchesWon  int,
    matchesLost int,
    averageScored float,
    averageScoredAgainst    float,
    currentTableRanking     int,
    year_                  int not null,
    TeamName         char(30),
    primary key (year_, TeamName),
    foreign key (TeamName) references Teams ON DELETE CASCADE);

grant select on teamStats to public;


-- insert into teamStats values(
--     0,
--     48,
--     34,
--     120.7,
--     118.2,
--     7,
--     2023,
--     'Sacramento Kings');


-- insert into teamStats values(
--     0,
--     30,
--     52,
--     110.3,
--     115.8,
--     24,
--     2022,
--     'Sacramento Kings');


-- insert into teamStats values(
--     0,
--     31,
--     41,
--     113.7,
--     117.4,
--     23,
--     2021,
--     'Sacramento Kings');
