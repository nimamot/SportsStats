create table matches_1(
    matchDate char(10),
    leagueName char(30),
    stadium     varchar(40),
    primary key(matchDate, stadium),
    foreign key(leagueName)
    references leagues(leagueName)
    ON DELETE CASCADE);

    grant select on matches_1 to public;

    insert into matches_1 values('24/10/23','NBA','Ball Arena');
    insert into matches_1 values('24/10/23','NBA','Chase Center');
    insert into matches_1 values('25/10/23','NBA','Barclays Center');
    insert into matches_1 values('25/10/23','NBA','United Center');


    create table matches_2(
    matchDate char(10),
    leagueName char(30),
    stadium     varchar(40),
    result     char(30),
    score      char(15),
    primary key(matchDate, stadium),
    foreign key(leagueName) references leagues(leagueName) ON DELETE CASCADE, 
    foreign key(matchDate, stadium) references matches_1(matchDate, stadium) ON DELETE CASCADE);

    grant select on matches_2 to public;

    insert into matches_2 values('24/10/23','NBA','Ball Arena', 'Denver Nuggets', '119-107');
    insert into matches_2 values('24/10/23','NBA','Chase Center','Phoenix Suns', '108-104');
    insert into matches_2 values('25/10/23','NBA','Barclays Center','Cleveland Cavaliers', '114-113');
    insert into matches_2 values('25/10/23','NBA','United Center', 'Oklahoma City Thunder', '124-104');




    create table play(
    matchDate char(10),
    stadium     varchar(40),  
    awayTeamName char(30),
    homeTeamName char(30), -- same as the team name in its team table
    primary key(matchDate, stadium, homeTeamName),
    foreign key(matchDate, stadium)
    references matches_1(matchDate, stadium)
    ON DELETE CASCADE,
    foreign key(homeTeamName) references teams(teamName) ON DELETE CASCADE);

    grant select on play to public;


    insert into play values('24/10/23','Ball Arena', 'Los Angeles Lakers', 'Denver Nuggets');
    insert into play values('24/10/23','Chase Center','Phoenix Suns','Golden State Warriors');
    insert into play values('25/10/23','Barclays Center','Cleveland Cavaliers','Brooklyn Nets');
    insert into play values('25/10/23','United Center','Oklahoma City Thunder', 'Chicago Bulls');