create table matches_1(
    matchDate date,
    leagueName varchar(40),
    stadium     varchar(40),
    primary key(matchDate, stadium),
    foreign key(leagueName)
    references leagues(leagueName)
    ON DELETE CASCADE);

grant select on matches_1 to public;

-- Im doing matchDate foreign key referencing matches_1 so that the 2 tables are connected 
create table matches_2(
    stadium     varchar(40),
    matchDate  date,
    result     char(20),
    score      char(15),
    leagueName varchar(40),
    primary key(matchDate),
    foreign key(leagueName)
    references leagues(leagueName)
    ON DELETE CASCADE,
    foreign key(matchDate, stadium)
    references matches_1(matchDate, stadium)
    ON DELETE CASCADE);

grant select on matches_2 to public;

create table play(
    matchDate   date,
    stadium     varchar(40),  
    awayTeamName varchar(40),
    homeTeamName varchar(40), -- same as the team name in its team table
    primary key(matchDate, stadium, homeTeamName),
    foreign key(matchDate, stadium)
    references matches_1(matchDate, stadium)
    ON DELETE CASCADE,
    foreign key(homeTeamName) 
    references teams(teamName)
    ON DELETE CASCADE);

grant select on play to public;


-- Premier League 2023/2024 5 matches

insert into matches_1 values("");

