drop table sports;
drop table play;
drop table sponsoredBy;
drop table covers;
drop table playersStats;
drop table teamStats;
drop table coaches;
drop table players;
drop table sportPeople;
drop table teams;
drop table matches_2;
drop table matches_1;
drop table leagues;
drop table news_2;
drop table news_1;
drop table sponsors;


create table sports (
    sportName char(20) not null,
    popularity int,
    picture char(200),
    primary key (sportName));

    grant select on sports to public;

create table leagues (
    leagueName varchar(40) not null,
    country varchar(40),
    startDate char(15),
    endDate   char(15),
    picture char(200),
    sportName char(20) not null,
    primary key (leagueName));

    grant select on leagues to public;


create table news_1(
    title varchar(300) not null,
    author  varchar(30) not null,
    publishingDate date,
    link varchar(300),
    primary key(title, author));

    grant select on news_1 to public;

create table news_2(
    title varchar(300),
    author varchar(30),
    publisher varchar(35),
    primary key(author),
    foreign key(author, title)
    references news_1(author, title)
    ON DELETE CASCADE);

    grant select on news_2 to public;


-- combined with participates in rel
-- !!! changed location to city, since location won't work in sql
create table teams (
    teamName varchar(30) not null,
    city varchar(40),
    leagueName varchar(40),
    picture char(200),
    primary key (teamName),
    foreign key (leagueName) 
    references leagues
    ON DELETE CASCADE);

    grant select on teams to public;

-- MATCHES: none of the matches will have homeTeam awayTeam since those 2 are in 'covers' now
-- not really sure about our primary/foreign keys now since |^|
-- Not doing Matches_3 anymore cuz it would ony have stadium, will put stadium in matches_1
create table matches_1(
    stadium     varchar(40),
    matchDate char(10),
    leagueName varchar(40),
    primary key(matchDate, stadium),
    foreign key(leagueName) 
    references leagues(leagueName)
     ON DELETE CASCADE);

    grant select on matches_1 to public;

-- Im doing matchDate foreign key referencing matches_1 so that the 2 tables are connected 
create table matches_2(
    stadium     varchar(40),
    matchDate  char(10),
    leagueName varchar(40),
    result     char(30),
    score      char(15),
    primary key(matchDate, stadium),
    foreign key(leagueName) references leagues(leagueName) ON DELETE CASCADE,
    foreign key(matchDate, stadium) references matches_1(matchDate, stadium) ON DELETE CASCADE);

    grant select on matches_2 to public;

create table sponsors(
    sponsorName    varchar(30),
    startDate      date,
    endDate        date,
    primary key(sponsorName));

    grant select on sponsors to public;

create table teamStats(
    matchesDrew int,
    matchesWon  int,
    matchesLost int,
    averageScored float,
    averageScoredAgainst    float,
    currentTableRanking     int,
    year_                   int not null,
    teamName         varchar(30),
    primary key (year_, teamName),
    foreign key (teamName)
    references teams
    ON DELETE CASCADE);

    grant select on teamStats to public;

CREATE TABLE sportPeople (
        nationality     char(20) not null,
        name_           varchar(30) not null,
        birthDate       char(10) not null,
        teamName        varchar(30),
        picture char(200),
        primary key(name_, nationality, birthDate),
        foreign key (teamName)
         references Teams
        ON DELETE CASCADE);
 
        grant select on sportPeople to public;

    create table coaches (
        NumOfSeasons    int,
        name_           varchar(30),
        teamName        varchar(30),
        birthDate       char(10),
        nationality     char(20),
        primary key(name_, nationality, birthDate),
        foreign key(name_, nationality, birthDate)
        references sportPeople
        ON DELETE CASCADE);

        grant select on coaches to public;

    CREATE TABLE players (
    nationality     char(20) not null,
    name_           varchar(30) not null,
    birthDate       char(10) not null,
    teamName        char(30),
    position        char(40),
    kitNum          int,
    primary key(name_, TeamName),
    foreign key(name_, nationality, birthDate) 
    references sportPeople
     ON DELETE CASCADE);

grant select on players to public;

    create table playersStats(
        wins    int,
        losses  int,
        year_   int not null,
        averageRating float,
        appearances   float,
        name_         varchar(30),
        teamName     char(30),
        primary key (year_, name_),
        foreign key (name_, teamName)
        references players 
        ON DELETE CASCADE);

    grant select on playersStats to public;

    create table covers(
        leagueName   varchar(40), 
        newsTitle   varchar(300),
        newsAuthor  varchar(30),
        primary key(leagueName, newsTitle, newsAuthor),  
        foreign key(newsTitle, newsAuthor)
        references news_1(title, author)
        ON DELETE CASCADE,
        foreign key(leagueName)
        references leagues
        ON DELETE CASCADE);

    grant select on covers to public;

    create table sponsoredBy(
        teamName    varchar(30),
        sponsorName varchar(30),
        primary key(teamName, sponsorName),
        foreign key(teamName)
        references teams(teamName)
        ON DELETE CASCADE,
        foreign key(sponsorName)
        references sponsors(sponsorName)
        ON DELETE CASCADE);

    grant select on covers to public;

    -- !!! play now has awayTeamName and HomeTeamName so matches won't have those anymore
    -- !!! also have to modify our relational schema
    create table play(
        stadium     varchar(40),
        matchDate   char(10),
        awayTeamName char(30),
        teamName varchar(30), -- same as the team name in its team table
        primary key(matchDate, stadium, teamName),
        foreign key(matchDate, stadium) references matches_1(matchDate, stadium) ON DELETE CASCADE,
        foreign key(teamName) references teams(teamName)ON DELETE CASCADE);

    grant select on play to public;

insert into sports values('Basketball', '5', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/255px-Basketball.png');
insert into sports values('Soccer', '5', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/255px-Basketball.png');
insert into sports values('Hockey', '5', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/255px-Basketball.png');


--  inserts for basketball
-- teams from the 22/23 NBA season
insert into leagues values('NBA', 'USA', '18/10/22', '12/06/23', 'https://a4.espncdn.com/combiner/i?img=%2Fi%2Fespn%2Fmisc_logos%2F500%2Fnba.png', 'Basketball');
insert into Leagues values('WNBA', 'USA', '19/05/23', '10/09/23', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/WNBA-2023.png','Basketball');

insert into Teams values('Sacramento Kings', 'Sacramento, CA', 'NBA', '//upload.wikimedia.org/wikipedia/en/thumb/c/c7/SacramentoKings.svg/180px-SacramentoKings.svg.png');
insert into Teams values('Golden State Warriors', 'San Francisco, CA', 'NBA', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/01/Golden_State_Warriors_logo.svg/800px-Golden_State_Warriors_logo.svg.png');
insert into Teams values('Atlanta Hawks', 'Atlanta, GA', 'NBA', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/24/Atlanta_Hawks_logo.svg/1024px-Atlanta_Hawks_logo.svg.png');
insert into Teams values('Boston Celtics', 'Boston, MA', 'NBA', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8f/Boston_Celtics.svg/800px-Boston_Celtics.svg.png');
insert into Teams values('Oklahoma City Thunder', 'Oklahoma City, OK', 'NBA', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5d/Oklahoma_City_Thunder.svg/1024px-Oklahoma_City_Thunder.svg.png');
insert into Teams values('Los Angeles Lakers', 'Los Angeles, CA', 'NBA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Los_Angeles_Lakers_logo.svg/1920px-Los_Angeles_Lakers_logo.svg.png');
insert into Teams values('Utah Jazz', 'Salt Lake City, UT', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/UTA-2023.png');
insert into Teams values('Memphis Grizzlies', 'Memphis, TN', 'NBA', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/Memphis_Grizzlies.svg/800px-Memphis_Grizzlies.svg.png');
insert into Teams values('Milwaukee Bucks', 'Milwaukee, WI', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/LAL-2023.png');


UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/0/01/Golden_State_Warriors_logo.svg/800px-Golden_State_Warriors_logo.svg.png' WHERE TeamName='Golden State Warriors';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/2/24/Atlanta_Hawks_logo.svg/1024px-Atlanta_Hawks_logo.svg.png' WHERE TeamName='Atlanta Hawks';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8f/Boston_Celtics.svg/800px-Boston_Celtics.svg.png' WHERE TeamName='Boston Celtics';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5d/Oklahoma_City_Thunder.svg/1024px-Oklahoma_City_Thunder.svg.png' WHERE TeamName='Oklahoma City Thunder';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Los_Angeles_Lakers_logo.svg/1920px-Los_Angeles_Lakers_logo.svg.png' WHERE TeamName='Los Angeles Lakers';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/Memphis_Grizzlies.svg/800px-Memphis_Grizzlies.svg.png' WHERE TeamName='Memphis Grizzlies';
UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Milwaukee_Bucks_logo.svg/800px-Milwaukee_Bucks_logo.svg.png' WHERE TeamName='Milwaukee Bucks';
UPDATE Teams SET picture = 'https://cdn.ssref.net/req/202311071/tlogo/bbr/LAL-2023.png' WHERE TeamName='Los Angeles Lakers';


insert into Teams values('Indiana Pacers', 'Indianapolis, IN', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/IND-2023.png');
insert into Teams values('New York Knicks', 'New York City, NY', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/NYK-2023.png');
insert into Teams values('Denver Nuggets', 'Denver, CO', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/DEN-2023.png');
insert into Teams values('Minnesota Timberwolves', 'Minneapolis, MN', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/MIN-2023.png');
insert into Teams values('Philadelphia 76ers', 'Philadelphia, PA', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/PHI-2023.png');
insert into Teams values('New Orleans Pelicans', 'New Orleans , LA', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/NOP-2023.png');
insert into Teams values('Dallas Mavericks', 'Dallas, TX', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/DAL-2023.png');
insert into Teams values('Phoenix Suns', 'Phoenix, AZ', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/PHO-2023.png');
insert into Teams values('Los Angeles Clippers', 'Los Angeles, CA', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/LAC-2023.png');
insert into Teams values('Portland Trail Blazers', 'New Orleans, LA', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/POR-2023.png');
insert into Teams values('Brooklyn Nets', 'New York City, NY', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/BRK-2023.png');
insert into Teams values('Washington Wizards', 'Washington D.C.', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/WAS-2023.png');
insert into Teams values('Chicago Bulls', 'Chicago, IL', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/CHI-2023.png');
insert into Teams values('Toronto Raptors', 'Toronto, ON, CANADA', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/TOR-2023.png');
insert into Teams values('Cleveland Cavaliers', 'Cleveland, OH', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/CLE-2023.png');
insert into Teams values('Orlando Magic', 'Orlando, FL', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/ORL-2023.png');
insert into Teams values('Charlotte Hornets', 'Charlotte, NC', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/CHO-2023.png');
insert into Teams values('Houston Rockets', 'Houston, TX', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/HOU-2023.png');
insert into Teams values('Detroit Pistons', 'Detroit, MI', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/DET-2023.png');
insert into Teams values('Miami Heat', 'Miami, FL', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/MIA-2023.png');
insert into Teams values('San Antonio Spurs', 'San Antonio, TX', 'NBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/SAS-2023.png');

--wnba
insert into Teams values('Las Vegas Aces', 'Las Vegas, NV', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/LVA-2023.png');
insert into Teams values('New York Liberty', 'New York City, NY', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/NYL-2023.png');
insert into Teams values('Connecticut Sun', 'Uncasville, CT', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/CON-2023.png');
insert into Teams values('Dallas Wings', 'Dallas, TX', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/DAL-2023.png');
insert into Teams values('Atlanta Dream', 'College Park, GR', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/ATL-2023.png');
insert into Teams values('Minnesota Lynx', 'Minneapolis, MB', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/MIN-2023.png');



-- Inserts for basketball for players

insert into sportPeople values('American', 'Harrison Barnes', '30/05/92', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/barneha02.jpg');
insert into players values('American', 'Harrison Barnes', '30/05/92','Sacramento Kings',' Power Forward and Small Forward', 40);

insert into sportPeople values('American', 'Deonte Burton', '31/01/94', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/burtode02.jpg');
insert into players values('American', 'Deonte Burton', '31/01/94','Sacramento Kings',' Power/Small Forward, Shooting Guard', 23);

insert into sportPeople values('American', 'Terence B. Davis II', '16/05/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/daviste02.jpg');
insert into players values('American', 'Terence B. Davis II', '16/05/97','Sacramento Kings',  'Shooting Guard', 3);

insert into sportPeople values('Australian', 'Matthew Dellavedova ', '08/09/90', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/dellama01.jpg');
insert into players values('Australian', 'Matthew Dellavedova ', '08/09/90','Sacramento Kings',' Point Guard and Shooting Guard', 8);

insert into sportPeople values('American', 'Perry Dozier Jr.', '25/10/96', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/doziepj01.jpg');
insert into players values('American', 'Perry Dozier Jr.', '25/10/96','Sacramento Kings','  Shooting/Point Guard, Small Forward', 35);

insert into sportPeople values('American', 'Kessler Donovan Edwards', '09/08/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/edwarke02.jpg');
insert into players values('American', 'Kessler Donovan Edwards', '09/08/00','Sacramento Kings','  Small Forward', 14);

insert into sportPeople values('American', 'Keon Tyrese Ellis', '08/01/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/elliske01.jpg');
insert into players values('American', 'Keon Tyrese Ellis', '08/01/00','Sacramento Kings','Shooting Guard ', 23);

insert into sportPeople values('American', 'DeAaron Martez Fox', '20/12/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/foxde01.jpg');
insert into players values('American', 'DeAaron Martez Fox', '20/12/97','Sacramento Kings','Point Guard', 5);

insert into sportPeople values('American', 'Richaun Diante Holmes', '15/10/93', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/holmeri01.jpg');
insert into players values('American', 'Richaun Diante Holmes', '15/10/93','Sacramento Kings','Center and Power Forward', 22);

insert into sportPeople values('American', 'Kevin Huerter', '27/08/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/huertke01.jpg');
insert into players values('American', 'Kevin Huerter', '27/08/98','Sacramento Kings','Shooting Guard and Small Forward', 9);

insert into sportPeople values('Ukrainian', 'Oleksiy (Alex) Len', '16/06/93', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/lenal01.jpg');
insert into players values('Ukrainian', 'Oleksiy (Alex) Len', '16/06/93','Sacramento Kings','Center', 27);

insert into sportPeople values('Canadian', 'Trey Anthony Lyles', '11/05/95', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/lylestr01.jpg');
insert into players values('Canadian', 'Trey Anthony Lyles', '11/05/95','Sacramento Kings','Power Forward', 41);

insert into sportPeople values('American', 'Chimezie Chukwudum Metu', '22/03/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/metuch01.jpg');
insert into players values('American', 'Chimezie Chukwudum Metu', '22/03/97','Sacramento Kings','Shooting Guard and Small Forward', 7);

insert into sportPeople values('American', 'Davion DeMonte Earl Mitchell', '05/09/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/mitchda01.jpg');
insert into players values('American', 'Davion DeMonte Earl Mitchell', '05/09/98','Sacramento Kings','Shooting Guard and Small Forward', 15);

insert into sportPeople values('Nigerian', 'Chima Moneke', '24/12/95', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/monekch01.jpg');
insert into players values('Nigerian', 'Chima Moneke', '24/12/95','Sacramento Kings','Small Forward', 19);

insert into sportPeople values('American', 'Malik Ahmad Monk', '04/02/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/monkma01.jpg');
insert into players values('American', 'Malik Ahmad Monk', '04/02/98','Sacramento Kings','Shooting Guard', 0);

insert into sportPeople values('American', 'Keegan Mitchell Murray', '19/08/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/murrake02.jpg');
insert into players values('American', 'Keegan Mitchell Murray', '19/08/00','Sacramento Kings','Small Forward', 13);

insert into sportPeople values('American', 'Chikezie Okpala', '28/04/99', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/okpalkz01.jpg');
insert into players values('American', 'Chikezie Okpala', '28/04/99','Sacramento Kings','Power Forward', 30);

insert into sportPeople values('Portuguese', 'Neemias Esdras Barbosa Queta', '13/07/99', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/mitchda01.jpg');
insert into players values('Portuguese', 'Neemias Esdras Barbosa Queta', '13/07/99','Sacramento Kings','Center', 88);

insert into sportPeople values('American', 'Domantas Sabonis', '03/05/96', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/sabondo01.jpg');
insert into players values('American', 'Domantas Sabonis', '03/05/96','Sacramento Kings','Power Forward and Center', 10);




insert into sportPeople values('American', 'LaMelo Ball', '22/08/01', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/ballla01.jpg');
insert into players values('American', 'LaMelo Ball', '22/08/01','Charlotte Hornets','Point Guard', 1);

insert into sportPeople values('American', 'James Bouknight', '18/09/00', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/bouknja01.jpg');
insert into players values('American', 'James Bouknight', '18/09/00','Charlotte Hornets','Shooting Guard', 2);

insert into sportPeople values('American', 'Gordon Hayward', '23/03/90', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/haywago01.jpg');
insert into players values('American', 'Gordon Hayward', '23/03/90','Charlotte Hornets','Small Forward and Power Forward', 20);

insert into sportPeople values('Bahamian', 'Kai Jones', '19/01/01', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/joneska01.jpg');
insert into players values('Bahamian', 'Kai Jones', '19/01/01','Charlotte Hornets','Center', 23);

insert into sportPeople values('French', 'Theo Maledon', '12/06/01', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/maledth01.jpg');
insert into players values('French', 'Theo Maledon', '12/06/01','Charlotte Hornets','Point Guard', 9);

insert into sportPeople values('American', 'Cody Lee Martin', '28/09/95', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/martico01.jpg');
insert into players values('American', 'Cody Lee Martin', '28/09/95','Charlotte Hornets','Small Forward',11 );

insert into sportPeople values('American', 'Jalen Marquis McDaniels', '31/01/98', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/mcdanja01.jpg');
insert into players values('American', 'Jalen Marquis McDaniels', '31/01/98','Charlotte Hornets','Small Forward', 6);

insert into sportPeople values('American', 'Bryce Alexander McGowens', '08/11/02', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/mcgowbr01.jpg');
insert into players values('American', 'Bryce Alexander McGowens', '08/11/02','Charlotte Hornets','Shooting Guard', 7);

insert into sportPeople values('Ukrainian', 'Sviatoslav Mykhailiuk', '10/06/97', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/mykhasv01.jpg');
insert into players values('Ukrainian', 'Sviatoslav Mykhailiuk', '10/06/97','Charlotte Hornets','Small Forward', 10);

insert into sportPeople values('American', 'Kelly Paul Oubre Jr.', '09/12/95', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/oubreke01.jpg');
insert into players values('American', 'Kelly Paul Oubre Jr.', '09/12/95','Charlotte Hornets','Small Forward', 12);

insert into sportPeople values('American', 'Mason Alexander Plumlee', '05/03/90', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/plumlma01.jpg');
insert into players values('American', 'Mason Alexander Plumlee', '05/03/90','Charlotte Hornets','Center',24 );

insert into sportPeople values('Jamacian', 'Nicholas Richards', '29/11/97', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/richani01.jpg');
insert into players values('Jamacian', 'Nicholas Richards', '29/11/97','Charlotte Hornets','Center and Power Forward', 4);

insert into sportPeople values('American', 'Terry William Rozier III', '17/03/94', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/roziete01.jpg');
insert into players values('American', 'Terry William Rozier III', '17/03/94','Charlotte Hornets','Point Guard and Shooting Guard', 3);

insert into sportPeople values('American', 'Kobi Jordan Simmons', '04/07/97', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/simmoko01.jpg');
insert into players values('American', 'Kobi Jordan Simmons', '04/07/97','Charlotte Hornets','Shooting Guard and Point Guard', 14);

insert into sportPeople values('American', 'Dennis Cliff Smith Jr.', '24/11/97', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/smithde03.jpg');
insert into players values('American', 'Dennis Cliff Smith Jr.', '24/11/97','Charlotte Hornets','Point Guard', 8);

insert into sportPeople values('American', 'Xavier Sneed', '21/12/97', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/sneedxa01.jpg');
insert into players values('American', 'Xavier Sneed', '21/12/97','Charlotte Hornets','Small Forward', 22);

insert into sportPeople values('American', 'Joxhow Panom Thor', '26/08/02', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/thorjt01.jpg');
insert into players values('American', 'Joxhow Panom Thor', '26/08/02','Charlotte Hornets','Power Forward', 21);

insert into sportPeople values('American', 'Paul Jamaine Washington Jr.', '23/08/98', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/washipj01.jpg');
insert into players values('American', 'Paul Jamaine Washington Jr.', '23/08/98','Charlotte Hornets','Power Forward and Center', 25);

insert into sportPeople values('American', 'Mark Oluwafemi Williams', '16/12/01', 'Charlotte Hornets', 'https://www.basketball-reference.com/req/202106291/images/headshots/willima07.jpg');
insert into players values('American', 'Mark Oluwafemi Williams', '16/12/01','Charlotte Hornets','Center', 5);



insert into sportPeople values('American', 'Stefanie Dolson', '08/01/92', 'New York Liberty', 'https://www.basketball-reference.com/req/202106291/images/headshots/dolsost01w.jpg');
insert into players values('American', 'Stefanie Dolson', '08/01/92','New York Liberty','Center', 31);

insert into sportPeople values('American', 'Sabrina Ionescu', '06/12/97', 'New York Liberty', 'https://www.basketball-reference.com/req/202106291/images/headshots/ionessa01w.jpg');
insert into players values('American', 'Sabrina Ionescu', '06/12/97','New York Liberty','Guard', 20);

insert into sportPeople values('Bahamian', 'Jonquel Jones', '05/01/94', 'New York Liberty', 'https://www.basketball-reference.com/req/202106291/images/headshots/jonesjo01w.jpg');
insert into players values('Bahamian', 'Jonquel Jones', '05/01/94','New York Liberty','Forward', 35);

insert into sportPeople values('American', 'Betnijah Laney', '29/10/93', 'New York Liberty', 'https://www.basketball-reference.com/req/202106291/images/headshots/laneybe01w.jpg');
insert into players values('American', 'Betnijah Laney', '29/10/93','New York Liberty','Guard-Forward', 44);

insert into sportPeople values('German', 'Nyara Sabally', '26/02/00', 'New York Liberty', 'https://www.basketball-reference.com/req/202106291/images/headshots/sabalny01w.jpg');
insert into players values('German', 'Nyara Sabally', '26/02/00','New York Liberty','Forward', 8);


insert into sportPeople values('Australian', 'Rebecca Allen', '06/11/92', 'Connecticut Sun', 'https://www.basketball-reference.com/req/202106291/images/headshots/allenre01w.jpg');
insert into players values('Australian', 'Rebecca Allen', '06/11/92','Connecticut Sun','Guard',9 );

insert into sportPeople values('American', 'DeWanna Bonner', '21/08/87', 'Connecticut Sun', 'https://www.basketball-reference.com/req/202106291/images/headshots/bonnede01w.jpg');
insert into players values('American', 'DeWanna Bonner', '21/08/87','Connecticut Sun','Forward-Guard', 24);

insert into sportPeople values('American', 'Leigha Brown', '14/07/00', 'Connecticut Sun', 'https://www.basketball-reference.com/req/202106291/images/headshots/brownle05w.jpg');
insert into players values('American', 'Leigha Brown', '14/07/00','Connecticut Sun','Guard', 32);

insert into sportPeople values('American', 'DiJonai Carrington', '08/01/98', 'Connecticut Sun', 'https://www.basketball-reference.com/req/202106291/images/headshots/carridi01w.jpg');
insert into players values('American', 'DiJonai Carrington', '08/01/98','Connecticut Sun','Guard-Forward', 21);

insert into sportPeople values('American', 'Tyasha Harris', '01/05/98', 'Connecticut Sun', 'https://www.basketball-reference.com/req/202106291/images/headshots/harrity01w.jpg');
insert into players values('American', 'Tyasha Harris', '01/05/98','Connecticut Sun','Guard', 52);


insert into sportPeople values('American', 'Kalani Brown', '21/03/97', 'Dallas Wings', 'https://www.basketball-reference.com/req/202106291/images/headshots/brownka01w.jpg');
insert into players values('American', 'Kalani Brown', '21/03/97','Dallas Wings','Center', 21);

insert into sportPeople values('American', 'Veronica Grace Burton', '12/07/00', 'Dallas Wings', 'https://www.basketball-reference.com/req/202106291/images/headshots/burtove01w.jpg');
insert into players values('American', 'Veronica Grace Burton', '12/07/00','Dallas Wings','Guard', 12);

insert into sportPeople values('American', 'Crystal Dangerfield', '11/05/98', 'Dallas Wings', 'https://www.basketball-reference.com/req/202106291/images/headshots/dangecr01w.jpg');
insert into players values('American', 'Crystal Dangerfield', '11/05/98','Dallas Wings','Guard',11 );

insert into sportPeople values('American', 'Diamond DeShields', '05/03/95', 'Dallas Wings', 'https://www.basketball-reference.com/req/202106291/images/headshots/deshidi01w.jpg');
insert into players values('American', 'Diamond DeShields', '05/03/95','Dallas Wings','Guard',88 );

insert into sportPeople values('American', 'Natasha Howard', '02/09/91', 'Dallas Wings', 'https://www.basketball-reference.com/req/202106291/images/headshots/howarna01w.jpg');
insert into players values('American', 'Natasha Howard', '02/09/91','Dallas Wings','Forward', 6);

--------------



insert into sportPeople values('American', 'Laeticia Amihere', '10/07/01', 'Atlanta Dream', 'https://www.basketball-reference.com/req/202106291/images/headshots/amihela01w.jpg');
insert into players values('American', 'Laeticia Amihere', '10/07/01','Atlanta Dream','Forward', 7);

insert into sportPeople values('American', 'Monique Billings', '02/05/92', 'Atlanta Dream', 'https://www.basketball-reference.com/req/202106291/images/headshots/billimo01w.jpg');
insert into players values('American', 'Monique Billings', '02/05/92','Atlanta Dream','Forward', 25);

insert into sportPeople values('American', 'Nia Coffey', '11/06/95', 'Atlanta Dream', 'https://www.basketball-reference.com/req/202106291/images/headshots/coffeni01w.jpg');
insert into players values('American', 'Nia Coffey', '11/06/95','Atlanta Dream','Forward', 12);

insert into sportPeople values('American', 'Asia Durr', '05/04/97', 'Atlanta Dream', 'https://www.basketball-reference.com/req/202106291/images/headshots/durras01w.jpg');
insert into players values('American', 'Asia Durr', '05/04/97','Atlanta Dream','Guard', 23);

insert into sportPeople values('American', 'Allisha Gray', '12/01/95', 'Atlanta Dream', 'https://www.basketball-reference.com/req/202106291/images/headshots/grayal01w.jpg');
insert into players values('American', 'Allisha Gray', '12/01/95','Atlanta Dream','Guard', 15);




insert into sportPeople values('Canadian', 'Natalie Achonwa', '22/11/92', 'Minnesota Lynx', 'https://www.basketball-reference.com/req/202106291/images/headshots/achonna01w.jpg');
insert into players values('Canadian', 'Natalie Achonwa', '22/11/92','Minnesota Lynx','Forward', 11);

insert into sportPeople values('American', 'Lindsay Allen', '20/03/95', 'Minnesota Lynx', 'https://www.basketball-reference.com/req/202106291/images/headshots/allenli01w.jpg');
insert into players values('American', 'Lindsay Allen', '20/03/95','Minnesota Lynx','Guard', 2);

insert into sportPeople values('American', 'Rachel Banham', '15/07/93', 'Minnesota Lynx', 'https://www.basketball-reference.com/req/202106291/images/headshots/banhara01w.jpg');
insert into players values('American', 'Rachel Banham', '15/07/93','Minnesota Lynx','Guard', 15);

insert into sportPeople values('Canadian', 'Bridget Carleton', '22/05/97', 'Minnesota Lynx', 'https://www.basketball-reference.com/req/202106291/images/headshots/carlebr01w.jpg');
insert into players values('Canadian', 'Bridget Carleton', '22/05/97','Minnesota Lynx','Forward', 6);

insert into sportPeople values('American', 'Napheesa Collier', '23/09/96', 'Minnesota Lynx', 'https://www.basketball-reference.com/req/202106291/images/headshots/collina01w.jpg');
insert into players values('American', 'Napheesa Collier', '23/09/96','Minnesota Lynx','Forward', 24);


insert into sportPeople values('American', 'Kierstan Bell', '16/03/00', 'Las Vegas Aces', 'https://www.basketball-reference.com/req/202106291/images/headshots/bellki01w.jpg');
insert into players values('American', 'Kierstan Bell', '16/03/00','Las Vegas Aces','Guard', 1);

insert into sportPeople values('American', 'Alysha Clark', '07/07/87', 'Las Vegas Aces', 'https://www.basketball-reference.com/req/202106291/images/headshots/clarkal01w.jpg');
insert into players values('American', 'Alysha Clark', '07/07/87','Las Vegas Aces','Forward', 7);

insert into sportPeople values('American', 'Alaina Coates', '07/04/95', 'Las Vegas Aces', 'https://www.basketball-reference.com/req/202106291/images/headshots/coateal01w.jpg');
insert into players values('American', 'Alaina Coates', '07/04/95','Las Vegas Aces', 'Center',81);

insert into sportPeople values('American', 'Sydney Colson', '06/08/89', 'Las Vegas Aces', 'https://www.basketball-reference.com/req/202106291/images/headshots/colsosy01w.jpg');
insert into players values('American', 'Sydney Colson', '06/08/89','Las Vegas Aces','Guard', 51);

insert into sportPeople values('Australian', 'Cayla George', '01/05/89', 'Las Vegas Aces', 'https://www.basketball-reference.com/req/202106291/images/headshots/francca01w.jpg');
insert into players values('Australian', 'Cayla George', '01/05/89','Las Vegas Aces','Center Forward', 13);


-- inserts for basketball team stats

insert into teamStats values(
    0,
    48,
    34,
    120.7,
    118.2,
    7,
    2023,
    'Sacramento Kings');


insert into teamStats values(
    0,
    30,
    52,
    110.3,
    115.8,
    24,
    2022,
    'Sacramento Kings');


insert into teamStats values(
    0,
    31,
    41,
    113.7,
    117.4,
    23,
    2021,
    'Sacramento Kings');



---------------------------------------------------------------------------------------------------------------
-- Basketball matches might need some reordering because the schema is old



-- insert into matches_1 values('24/10/23','NBA','Ball Arena');
-- insert into matches_1 values('24/10/23','NBA','Chase Center');
-- insert into matches_1 values('25/10/23','NBA','Barclays Center');
-- insert into matches_1 values('25/10/23','NBA','United Center');

-- insert into matches_2 values('24/10/23','NBA','Ball Arena', 'Denver Nuggets', '119-107');
-- insert into matches_2 values('24/10/23','NBA','Chase Center','Phoenix Suns', '108-104');
-- insert into matches_2 values('25/10/23','NBA','Barclays Center','Cleveland Cavaliers', '114-113');
-- insert into matches_2 values('25/10/23','NBA','United Center', 'Oklahoma City Thunder', '124-104');

-- insert into play values('24/10/23','Ball Arena', 'Los Angeles Lakers', 'Denver Nuggets');
-- insert into play values('24/10/23','Chase Center','Phoenix Suns','Golden State Warriors');
-- insert into play values('25/10/23','Barclays Center','Cleveland Cavaliers','Brooklyn Nets');
-- insert into play values('25/10/23','United Center','Oklahoma City Thunder', 'Chicago Bulls');


-- insert into matches_1 values('20/05/23','WNBA','College Park Center');
-- insert into matches_2 values('20/05/23','WNBA','College Park Center', 'Dallas Wings', '85-78');
-- insert into play values('20/05/23','College Park Center', 'Atlanta Dream', 'Dallas Wings');

-- insert into matches_1 values('23/05/23','WNBA','Target Center');
-- insert into matches_2 values('23/05/23','WNBA','Target Center', 'Atlanta Dream', '83-77');
-- insert into play values('23/05/23','Target Center', 'Atlanta Dream', 'Minnesota Lynx');

-- insert into matches_1 values('27/05/23','WNBA','Barclays Center');
-- insert into matches_2 values('27/05/23','WNBA','Barclays Center', 'New York Liberty', '81-65');
-- insert into play values('27/05/23','Barclays Center', 'Connecticut Sun', 'New York Liberty');

-- insert into matches_1 values('06/06/23','WNBA','Mohegan Sun Arena');
-- insert into matches_2 values('06/06/23','WNBA','Mohegan Sun Arena', 'Las Vegas Aces', '90-84');
-- insert into play values('06/06/23','Mohegan Sun Arena', 'Las Vegas Aces', 'Connecticut Sun');


---------------------------------------------------------------------------------------------------------------




-- Hockey inserts
insert into Leagues values('NHL', 'Canada', '18/10/22', '12/06/23', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/800px-National_Football_League_logo.svg.png', 'Hockey');

-- Hokey inserts Teams
insert into Teams values('Vancouver Canucks', 'Vancouver, BC', 'NHL', 'https://cdn.ssref.net/req/202311071/tlogo/hr/VAN.png');
insert into Teams values('Anaheim Ducks', 'Anaheim, CA', 'NHL', 'https://cdn.ssref.net/req/202311071/tlogo/hr/ANA.png');
insert into Teams values('Toronto Maple Leafs', 'Toronto, ON', 'NHL', 'https://cdn.ssref.net/req/202311071/tlogo/hr/TOR.png');
insert into Teams values('Edmonton Oilers', 'Edmonton, AB', 'NHL', 'https://cdn.ssref.net/req/202311071/tlogo/hr/EDM.png');

-- Hokey teamplayers inserts
-- Vancouver Canucks
 -- Elias Pettersson
insert into sportPeople values('Sweden', 'Elias Pettersson', '12/11/98', 'Vancouver Canucks', 'https://www.hockey-reference.com/req/202301051/images/headshots/petteel01-2020.jpg');
insert into players values('Sweden', 'Elias Pettersson', '12/11/98','Vancouver Canucks','Center', 40);

 -- Andrei Kuz
 insert into sportPeople values('Russia', 'Andrei Kuzmenko', '04/02/96', 'Vancouver Canucks', 'https://en.khl.ru/images/teamplayers/11090/19215.jpg');
insert into players values('Russia', 'Andrei Kuzmenko', '04/02/96','Vancouver Canucks','Left Wing', 96);

 --brock br
  insert into sportPeople values('USA', 'Brock Boeser', '25/02/97', 'Vancouver Canucks', 'https://www.hockey-reference.com/req/202301051/images/headshots/boesebr01-2020.jpg');
insert into players values('USA', 'Brock Boeser', '25/02/97','Vancouver Canucks','Right Wing', 6);

 -- Quinn Hughes
   insert into sportPeople values('USA', 'Quinn Hughes', '14/10/99', 'Vancouver Canucks', 'https://www.hockey-reference.com/req/202301051/images/headshots/hughequ01-2020.jpg');
insert into players values('USA', 'Quinn Hughes', '14/10/99','Vancouver Canucks','Left Defenseman', 43);

 --Tyler Myers
insert into sportPeople values('USA', 'Tyler Myers', '01/02/99', 'Vancouver Canucks', 'https://www.hockey-reference.com/req/202301051/images/headshots/myersty01-2020.jpg');
insert into players values('USA', 'Tyler Myers', '01/02/99','Vancouver Canucks','Right Defenseman', 57);

-- Thatcher Demko
insert into sportPeople values('USA', 'Thatcher Demko', '08/12/95', 'Vancouver Canucks', 'https://www.hockey-reference.com/req/202301051/images/headshots/demkoth01-2020.jpg');
insert into players values('USA', 'Thatcher Demko', '08/12/95','Vancouver Canucks','Goalie', 35);

------------------------------------------

-- Hokey teamplayers inserts
-- Anaheim Ducks
 -- Mason McTavish
insert into sportPeople values('Switzerland', 'Mason McTavish', '30/01/03', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/mctavma01-2022.jpg');
insert into players values('Switzerland', 'Mason McTavish', '30/01/03','Anaheim Ducks','Center', 37);

 -- Nathan Beaulieu
insert into sportPeople values('Canada', 'Nathan Beaulieu', '05/12/92', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/beaulna01-2020.jpg');
insert into players values('Canada', 'Nathan Beaulieu', '05/12/92','Anaheim Ducks','Left Defenseman', 28);

 -- Simon Benoit
insert into sportPeople values('Canada', 'Simon Benoit', '19/09/98', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/benoisi01-2020.jpg');
insert into players values('Canada', 'Simon Benoit', '19/09/98','Anaheim Ducks','Right Defenseman', 13);

 -- Max Comtois
insert into sportPeople values('Canada', 'Max Comtois', '04/02/92', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/carrisa01-2020.jpg');
insert into players values('Canada', 'Max Comtois', '04/02/92','Anaheim Ducks','Left Wing', 39);

 -- Lukáš Dostál
insert into sportPeople values('Czech Republic', 'Lukas Dostal', '22/06/00', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/dostalu01-2020.jpg');
insert into players values('Czech Republic', 'Lukas Dostal', '22/06/00','Anaheim Ducks','Goalie', 1);

 -- Brett Leason
insert into sportPeople values('Canada', 'Brett Leason', '30/04/99', 'Anaheim Ducks', 'https://www.hockey-reference.com/req/202301051/images/headshots/leasobr01-2022.jpg');
insert into players values('Canada', 'Brett Leason', '30/04/99','Anaheim Ducks','Right Wing', 20);
------------------------------------------

-- Hokey teamplayers inserts
-- Toronto Maple Leafs
 -- Nicholas Abruzzese
insert into sportPeople values('USA', 'Nicholas Abruzzese', '04/06/99', 'Toronto Maple Leafs', 'https://www.hockey-reference.com/req/202301051/images/headshots/abruzni01-2022.jpg');
insert into players values('USA', 'Nicholas Abruzzese', '04/06/99','Toronto Maple Leafs','Center', 26);

 -- Jett Alexander
insert into sportPeople values('Canada', 'Jett Alexander', '08/11/99', 'Toronto Maple Leafs', 'https://www.hockeydb.com/ihdb/photos/jett-alexander-2023-2866.jpg');
insert into players values('Canada', 'Jett Alexander', '08/11/99','Toronto Maple Leafs','Goalie', 40);

 -- Joey Anderson
insert into sportPeople values('USA', 'Joey Anderson', '19/06/98', 'Toronto Maple Leafs', 'https://www.hockey-reference.com/req/202301051/images/headshots/anderjo08-2020.jpg');
insert into players values('USA', 'Joey Anderson', '19/06/98','Toronto Maple Leafs','Right Defenseman', 28);

 --Jordie Benn
insert into sportPeople values('Canada', 'Jordie Benn', '26/06/87', 'Toronto Maple Leafs', 'https://www.hockey-reference.com/req/202301051/images/headshots/bennjo01-2020.jpg');
insert into players values('Canada', 'Jordie Benn', '26/06/87','Toronto Maple Leafs','Left Defenseman', 18);

--  Michael Bunting
insert into sportPeople values('Canada', 'Michael Bunting', '17/09/95', 'Toronto Maple Leafs', 'https://www.hockey-reference.com/req/202301051/images/headshots/buntimi01-2020.jpg');
insert into players values('Canada', 'Michael Bunting', '17/09/95','Toronto Maple Leafs','Left Wing', 58);

 -- Mitch Marner
insert into sportPeople values('Canada', 'Mitch Marner', '05/05/97', 'Toronto Maple Leafs', 'https://www.hockey-reference.com/req/202301051/images/headshots/marnemi01-2022.jpg');
insert into players values('Canada', 'Mitch Marner', '05/05/97','Toronto Maple Leafs','Right Wing', 16);



-- Hokey teamplayers inserts
-- Evan Bouchard
 -- Nicholas Abruzzese
insert into sportPeople values('Canada', 'Evan Bouchard', '20/10/99', 'Edmonton Oilers', 'https://www.hockey-reference.com/req/202301051/images/headshots/bouchev01-2020.jpg');
insert into players values('Canada', 'Evan Bouchard', '20/10/99','Edmonton Oilers','Right Defenseman', 2);

 -- Matthew Berlin
insert into sportPeople values('Canada', 'Matthew Berlin', '20/01/98', 'Edmonton Oilers', 'https://images.contactout.com/profiles/644b13b3d22cf1063eb615b31ddb8416');
insert into players values('Canada', 'Matthew Berlin', '20/01/98','Edmonton Oilers','Goalie', 33);

 -- Nick Bjugstad
insert into sportPeople values('USA', 'Nick Bjugstad', '11/06/92', 'Edmonton Oilers', 'https://www.hockey-reference.com/req/202301051/images/headshots/anderjo08-2020.jpg');
insert into players values('USA', 'Nick Bjugstad', '11/06/92','Edmonton Oilers','Center', 72);

 -- 	Brett Kulak
insert into sportPeople values('Canada', 'Brett Kulak', '26/06/94', 'Edmonton Oilers', 'https://www.hockey-reference.com/req/202301051/images/headshots/kulakbr01-2020.jpg');
insert into players values('Canada', 'Brett Kulak', '26/06/94','Edmonton Oilers','Left Defenseman', 27);

--  Evander Kane
insert into sportPeople values('Canada', 'Evander Kane', '01/09/91', 'Edmonton Oilers', 'https://www.hockey-reference.com/req/202301051/images/headshots/kaneev01-2020.jpg');
insert into players values('Canada', 'Evander Kane', '01/09/91','Edmonton Oilers','Left Wing', 91);

 -- Kailer Yamamoto
insert into sportPeople values('USA', 'Kailer Yamamoto', '05/05/98', 'Edmonton Oilers', 'https://www.hockey-reference.com/req/202301051/images/headshots/yamamka01-2020.jpg');
insert into players values('USA', 'Kailer Yamamoto', '05/05/98','Edmonton Oilers','Right Wing', 56);

-- ------------------------------------------

-- Team stats for Vancouver Canucks
-- check avgScored it's weird, Shariq knows
-- https://www.hockey-reference.com/teams/VAN/2023.html
insert into teamStats values(
    0,
    38,
    37,
    276,
    298,
    6,
    2023,
    'Vancouver Canucks');


insert into teamStats values(
    0,
    40,
    30,
    249,
    236,
    5,
    2022,
    'Vancouver Canucks');


insert into teamStats values(
    0,
    23,
    29,
    151,
    188,
    7,
    2021,
    'Vancouver Canucks');


-- Team stats for Anaheim Ducks
insert into teamStats values(
    0,
    23,
    47,
    209,
    338,
    8,
    2023,
    'Anaheim Ducks');


insert into teamStats values(
    0,
    31,
    37,
    232,
    271,
    7,
    2022,
    'Anaheim Ducks');


insert into teamStats values(
    0,
    17,
    30,
    126,
    179,
    8,
    2021,
    'Anaheim Ducks');


-- Team stats for Toronto Maple Leafs
insert into teamStats values(
    0,
    50,
    21,
    279,
    222,
    2,
    2023,
    'Toronto Maple Leafs');


insert into teamStats values(
    0,
    54,
    21,
    315,
    253,
    2,
    2022,
    'Toronto Maple Leafs');


insert into teamStats values(
    0,
    35,
    14,
    187,
    148,
    1,
    2021,
    'Toronto Maple Leafs');


-- Team stats for Edmonton Oilers
-- !!! two teams came 2nd
insert into teamStats values(
    0,
    50,
    23,
    325,
    260,
    2,
    2023,
    'Edmonton Oilers');


insert into teamStats values(
    0,
    49,
    27,
    290,
    252,
    2,
    2022,
    'Edmonton Oilers');


insert into teamStats values(
    0,
    35,
    19,
    183,
    154,
    2,
    2021,
    'Edmonton Oilers');


--Vancouver Canuck NHL  2022/2023 playerStat

insert into playersStats values(
    38,
    44,
    2023, --2022/2023 season
    4.4,
    80,
    'Elias Pettersson',
    'Vancouver Canucks');

insert into playersStats values(
    35,
    46,
    2023, --2022/2023 season
    7.3,
    81,
    'Andrei Kuzmenko',
    'Vancouver Canucks');

insert into playersStats values(
    30,
    44,
    2023, --2022/2023 season
    3.8,
    74,
    'Brock Boeser',
    'Vancouver Canucks');

insert into playersStats values(
    40,
    38,
    2023, --2022/2023 season
    4.5,
    78,
    'Quinn Hughes',
    'Vancouver Canucks');

    insert into playersStats values(
    36,
    42,
    2023, --2022/2023 season
    6.8,
    78,
    'Tyler Myers',
    'Vancouver Canucks');

    insert into playersStats values(
    14,
    14,
    2023, --2022/2023 season
    4.5,
    32,
    'Thatcher Demko',
    'Vancouver Canucks');


--Anaheim Ducks NHL  2022/2023 playerStat

insert into playersStats values(
    38,
    42,
    2023, --2022/2023 season
    3.6,
    80,
    'Mason McTavish',
    'Anaheim Ducks');

insert into playersStats values(
    25,
    27,
    2023, --2022/2023 season
    7.5,
    52,
    'Nathan Beaulieu',
    'Anaheim Ducks');

insert into playersStats values(
    4,
    10,
    2023, --2022/2023 season
    3.7,
    19,
    'Lukas Dostal',
    'Anaheim Ducks');

insert into playersStats values(
    40,
    38,
    2023, --2022/2023 season
    5.1,
    78,
    'Simon Benoit',
    'Anaheim Ducks');

    insert into playersStats values(
    40,
    29,
    2023, --2022/2023 season
    6.8,
    69,
    'Max Comtois',
    'Anaheim Ducks');

    insert into playersStats values(
    25,
    29,
    2023, --2022/2023 season
    4.9,
    54,
    'Brett Leason',
    'Anaheim Ducks');


--Toronto Maple Leafs NHL  2022/2023 playerStat

insert into playersStats values(
    1,
    1,
    2023, --2022/2023 season
    3.6,
    2,
    'Nicholas Abruzzese',
    'Toronto Maple Leafs');

insert into playersStats values(
    0,
    1,
    2023, --2022/2023 season
    1.2,
    1,
    'Jett Alexander',
    'Toronto Maple Leafs');

insert into playersStats values(
    10,
    4,
    2023, --2022/2023 season
    4.2,
    14,
    'Joey Anderson',
    'Toronto Maple Leafs');

insert into playersStats values(
    7,
    5,
    2023, --2022/2023 season
    6.2,
    12,
    'Jordie Benn',
    'Toronto Maple Leafs');

    insert into playersStats values(
    40,
    42,
    2023, --2022/2023 season
    6.1,
    82,
    'Michael Bunting',
    'Toronto Maple Leafs');

    insert into playersStats values(
    49,
    31,
    2023, --2022/2023 season
    7.5,
    80,
    'Mitch Marner',
    'Toronto Maple Leafs');


    --Edmonton Oilers Leafs NHL  2022/2023 playerStat

insert into playersStats values(
    1,
    1,
    2023, --2022/2023 season
    3.6,
    2,
    'Evan Bouchard',
    'Edmonton Oilers');

insert into playersStats values(
    0,
    1,
    2023, --2022/2023 season
    1.2,
    1,
    'Matthew Berlin',
    'Edmonton Oilers');

insert into playersStats values(
    10,
    4,
    2023, --2022/2023 season
    4.2,
    14,
    'Nick Bjugstad',
    'Edmonton Oilers');

insert into playersStats values(
    7,
    5,
    2023, --2022/2023 season
    6.2,
    12,
    'Brett Kulak',
    'Edmonton Oilers');

    insert into playersStats values(
    40,
    42,
    2023, --2022/2023 season
    6.1,
    82,
    'Evander Kane',
    'Edmonton Oilers');

    insert into playersStats values(
    49,
    31,
    2023, --2022/2023 season
    7.5,
    80,
    'Kailer Yamamoto',
    'Edmonton Oilers');

--------------------------------------------------------------------------
-- sponsors for NHL
-- Sponsors (1 for each team) (Check Date variable format)
-- Vancouver canucks
insert into Sponsors values('Rogers Communications', TO_DATE('01-07-2001', 'DD-MM-YYYY'), TO_DATE('01-07-2025', 'DD-MM-YYYY'));
insert into sponsoredBy values('Vancouver Canucks', 'Rogers Communications');
-- Anaheim Ducks 
insert into Sponsors values('WNPM',  TO_DATE('01-07-2023', 'DD-MM-YYYY'), TO_DATE('01-07-2028', 'DD-MM-YYYY'));
insert into sponsoredBy values('Anaheim Ducks', 'WNPM');
-- Toronto Maple Leafs
insert into Sponsors values('Pizza Pizza',  TO_DATE('01-07-2023', 'DD-MM-YYYY'),  TO_DATE('01-07-2024', 'DD-MM-YYYY'));
insert into sponsoredBy values('Toronto Maple Leafs', 'Pizza Pizza');
-- Edmonton
insert into Sponsors values('ATCO',  TO_DATE('01-07-2016', 'DD-MM-YYYY'),  TO_DATE('01-07-2027', 'DD-MM-YYYY'));
insert into sponsoredBy values('Edmonton Oilers', 'ATCO');


--------------------------------------------------------------------------
--NHL 2023
-- Matches + play for NHL

--Vancouver canucks - Rogers Arena
--Anaheim Ducks - Honda Center
--Toronto Maple Leafs - Scotiabank Arena
--Edmonton Oilers - Rogers Place

--Match 1 Van vs Tor
insert into matches_1 values('Rogers Arena', '14/10/23', 'NHL');
insert into matches_2 values('Rogers Arena', '14/10/23', 'NHL', 'Vancouver Canucks Win', '6-5');
insert into play values('Rogers Arena', '14/10/23', 'Toronto Maple Leafs', 'Vancouver Canucks');
--Match 2 Van vs Ana
insert into matches_1 values('Rogers Arena', '24/10/23', 'NHL');
insert into matches_2 values('Rogers Arena', '24/10/23', 'NHL', 'Match Draw', '4-4');
insert into play values('Rogers Arena', '24/10/23', 'Anaheim Ducks', 'Vancouver Canucks');
--Match 3 Edm vs Tor
insert into matches_1 values('Rogers Place', '25/11/23', 'NHL');
insert into matches_2 values('Rogers Place', '25/11/23', 'NHL', 'Edmonton Oilers Win', '3-1');
insert into play values('Rogers Place', '25/11/23', 'Toronto Maple Leafs', 'Edmonton Oilers');
--Match 4 Ana vs Edm
insert into matches_1 values('Honda Center', '10/12/23', 'NHL');
insert into matches_2 values('Honda Center', '10/12/23', 'NHL', 'Anaheim Ducks Win', '7-2');
insert into play values('Honda Center', '10/12/23', 'Edmonton Oilers', 'Anaheim Ducks');

--NHL 2022
-- Matches + play for NHL
--Match 1 Tor vs Ana
insert into matches_1 values('Scotiabank Arena', '27/10/22', 'NHL');
insert into matches_2 values('Scotiabank Arena', '27/10/22', 'NHL', 'Toronto Maple Leafs Win', '2-1');
insert into play values('Scotiabank Arena', '27/10/22', 'Anaheim Ducks', 'Toronto Maple Leafs');
--Match 2 Tor vs Van
insert into matches_1 values('Scotiabank Arena', '02/11/22', 'NHL');
insert into matches_2 values('Scotiabank Arena', '02/11/22', 'NHL', 'Toronto Maple Leafs Win', '5-4');
insert into play values('Scotiabank Arena', '02/11/22', 'Vancouver Canucks', 'Toronto Maple Leafs');
--Match 3 van vs Edm
insert into matches_1 values('Rogers Arena', '08/11/22', 'NHL');
insert into matches_2 values('Rogers Arena', '08/11/22', 'NHL', 'Match Draw', '1-1');
insert into play values('Rogers Arena', '08/11/22', 'Edmonton Oilers', 'Vancouver Canucks');
--/Match 4 Ana vs Van
insert into matches_1 values('Honda Center', '17/12/22', 'NHL');
insert into matches_2 values('Honda Center', '17/12/22', 'NHL', 'Vancouver Canucks Win', '3-2');
insert into play values('Honda Center', '17/12/22', 'Vancouver Canucks', 'Anaheim Ducks');

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- SHARIQ --- SOCCER
--------------------------------------------------------------------------
-- soccer_teams_insert.sql
--------------------------------------------------------------------------

-- Sports
insert into Sports values('Football (Soccer)', 3500000000, 'https://www.soccerbible.com/media/115095/ucl-1-min.jpg');

-- -- leagues from the 22/23 soccer seasons'
insert into Leagues values('Premier League', 'England', '06/08/22', '28/05/23', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png', 'soccer');
insert into Leagues values('La Liga', 'Spain', '12/08/22', '04/06/23', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/LaLiga.svg/2560px-LaLiga.svg.png', 'soccer');


-- -- teams from the 22/23 Premier League season (Might keep 3 in total)
insert into Teams values('Arsenal', 'London, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg');
insert into Teams values('Liverpool', 'Liverpool, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg');
insert into Teams values('Manchester United', 'Manchester, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg');
insert into Teams values('Chelsea', 'London, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/c/cc/Chelsea_FC.svg');
insert into Teams values('Manchester City', 'Manchester, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg');

-- -- teams from the 22/23 LaLiga season (Might keep 3 in total)
insert into Teams values('Atletico Madrid', 'Madrid, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/f/f4/Atletico_Madrid_2017_logo.svg');
insert into Teams values('Barcelona', 'Barcelona, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg');
insert into Teams values('Real Madrid', 'Madrid, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg');
insert into Teams values('Sevilla', 'Seville, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/Sevilla_FC_logo.svg/462px-Sevilla_FC_logo.svg.png?20200116144714');


-- ALTER TABLE Teams ADD picture char(200);

-- Sponsors (1 for each team) (Check Date variable format)
--Arsenal
insert into Sponsors values('Emirates', TO_DATE('01-07-2006', 'DD-MM-YYYY'), TO_DATE('01-07-2028', 'DD-MM-YYYY'));
insert into sponsoredBy values('Arsenal', 'Emirates');
--Liverpool
insert into Sponsors values('Standard Chartered Bank',  TO_DATE('01-07-2006', 'DD-MM-YYYY'), TO_DATE('01-07-2027', 'DD-MM-YYYY'));
insert into sponsoredBy values('Liverpool', 'Standard Chartered Bank');
--Manchester United
insert into Sponsors values('Team Viewer',  TO_DATE('01-07-2021', 'DD-MM-YYYY'),  TO_DATE('01-07-2026', 'DD-MM-YYYY'));
insert into sponsoredBy values('Manchester United', 'Team Viewer');
--Real Madrid
insert into Sponsors values('Adidas',  TO_DATE('01-07-1998', 'DD-MM-YYYY'),  TO_DATE('01-07-2028', 'DD-MM-YYYY'));
insert into sponsoredBy values('Real Madrid', 'Adidas');
--Barcelona
insert into Sponsors values('Nike',  TO_DATE('01-07-1998', 'DD-MM-YYYY'),  TO_DATE('01-07-2028', 'DD-MM-YYYY'));
insert into sponsoredBy values('Barcelona', 'Nike');


--------------------------------------------------------------------------
-- soccer_team_stats.sql
--------------------------------------------------------------------------

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


--------------------------------------------------------------------------
-- soccer_sportPeople_insert.sql
--------------------------------------------------------------------------

-- Premier League

-- Arsenal 2022/2023 Squad
--Coach
insert into sportPeople values('Spain', 'Mikel Arteta', '26/03/82', 'Arsenal', 'https://img.a.transfermarkt.technology/portrait/header/47620-1681398729.jpg?lm=1');
insert into coaches values(3, 'Mikel Arteta', 'Arsenal', '26/03/82', 'Spain');
--GK
insert into sportPeople values('England', 'Aaron Ramsdale', '14/05/98', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/466fb2c5_2022.jpg');
insert into players values('England', 'Aaron Ramsdale', '14/05/98', 'Arsenal','Goalkeeper', 1);
--LB
insert into sportPeople values('Ukraine', 'Oleksandr Zinchenko', '15/12/96', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/51cf8561_2022.jpg');
insert into players values('Ukraine', 'Oleksandr Zinchenko', '15/12/96', 'Arsenal','Left Back', 35);
--CB
insert into sportPeople values('Brazil', 'Gabriel Magalhaes', '19/12/97', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/67ac5bb8_2022.jpg');
insert into players values('Brazil', 'Gabriel Magalhaes', '19/12/97', 'Arsenal','Centre Back', 6);
--CB
insert into sportPeople values('France', 'William Saliba', '24/03/01', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/972aeb2a_2022.jpg');
insert into players values('France', 'William Saliba', '24/03/01', 'Arsenal','Centre Back', 12);
--RB
insert into sportPeople values('England', 'Ben White', '08/10/97', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/35e413f1_2022.jpg');
insert into players values('England', 'Ben White', '08/10/97', 'Arsenal','Right Back', 4);
--CDM
insert into sportPeople values('Ghana', 'Thomas Partey', '13/06/93', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/529f49ab_2022.jpg');
insert into players values('Ghana', 'Thomas Partey', '13/06/93','Arsenal','Central Defensive Midfielder', 5);
--CM
insert into sportPeople values('Switzerland', 'Granit Xhaka', '27/09/92', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/e61b8aee_2022.jpg');
insert into players values('Switzerland', 'Granit Xhaka', '27/09/92', 'Arsenal','Central Midfielder', 34);
--CAM
insert into sportPeople values('Norway', 'Martin Odegaard', '17/12/98', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/79300479_2022.jpg');
insert into players values('Norway', 'Martin Odegaard', '17/12/98', 'Arsenal','Central Attacking Midfielder', 8);
--LW
insert into sportPeople values('Brazil', 'Gabriel Martinelli', '18/06/01', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/48a5a5d6_2022.jpg');
insert into players values('Brazil', 'Gabriel Martinelli', '18/06/01', 'Arsenal','Left Winger', 11);
--CF
insert into sportPeople values('Brazil', 'Gabriel Jesus', '03/04/97', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/b66315ae_2022.jpg');
insert into players values('Brazil', 'Gabriel Jesus', '03/04/97', 'Arsenal','Centre Forward', 9);
--RW
insert into sportPeople values('England', 'Bukayo Saka', '05/09/01', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/bc7dc64d_2022.jpg');
insert into players values('England', 'Bukayo Saka', '05/09/01', 'Arsenal','Right Winger', 7);

-- Liverpool 2022/2023 Squad
--Coach
insert into sportPeople values('Germany', 'Jurgen Klopp', '16/06/67', 'Liverpool', 'https://img.a.transfermarkt.technology/portrait/header/118-1682605652.jpg?lm=1');
insert into coaches values(22, 'Jurgen Klopp', 'Liverpool', '16/06/67', 'Germany');
--GK
insert into sportPeople values('Brazil', 'Alisson Becker', '02/10/92', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/7a2e46a8_2022.jpg');
insert into players values('Brazil', 'Alisson Becker', '02/10/92', 'Liverpool','Goalkeeper', 1);
--LB
insert into sportPeople values('Scotland', 'Andrew Robertson', '11/03/94', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/2e4f5f03_2022.jpg');
insert into players values('Scotland', 'Andrew Robertson', '11/03/94', 'Liverpool','Left Back', 26);
--CB
insert into sportPeople values('Netherlands', 'Virgil van Dijk', '08/07/91', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/e06683ca_2022.jpg');
insert into players values('Netherlands', 'Virgil van Dijk', '08/07/91', 'Liverpool', 'Centre Back', 4);
--CB
insert into sportPeople values('France', 'Ibrahima Konate', '25/05/99', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/5ed9b537_2022.jpg');
insert into players values('France', 'Ibrahima Konate', '25/05/99', 'Liverpool','Centre Back', 5);
--RB
insert into sportPeople values('England', 'Trent Alexander-Arnold', '07/10/98', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/cd1acf9d_2022.jpg');
insert into players values('England', 'Trent Alexander-Arnold', '07/10/98', 'Liverpool','Right Back', 66);
--CDM (Check Brackets)
insert into sportPeople values('Brazil', 'Fabinho', '23/10/93', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/7f3b388c_2022.jpg');
insert into players values('Brazil', 'Fabinho', '23/10/93', 'Liverpool','Central Defensive Midfielder', 3);
--CM
insert into sportPeople values('Guinea', 'Naby Keita', '10/02/95', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/f25c8e3a_2022.jpg');
insert into players values('Guinea', 'Naby Keita', '10/02/95', 'Liverpool','Central Midfielder', 8);
--CM
insert into sportPeople values('Spain', 'Thiago Alcantara', '11/04/91', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/77e84962_2022.jpg');
insert into players values('Spain', 'Thiago Alcantara', '11/04/91', 'Liverpool','Central Midfielder', 6);
--LW
insert into sportPeople values('Portugal', 'Diogo Jota', '4/12/96', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/178ae8f8_2022.jpg');
insert into players values('Portugal', 'Diogo Jota', '4/12/96', 'Liverpool','Left Winger', 20);
--ST
insert into sportPeople values('Uruguay', 'Darwin Nunez', '24/06/99', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/4d77b365_2022.jpg');
insert into players values('Uruguay', 'Darwin Nunez', '24/06/99', 'Liverpool','Striker', 27);
--RW
insert into sportPeople values('Egypt', 'Mohamed Salah', '15/06/92', 'Liverpool', 'https://fbref.com/req/202302030/images/headshots/e342ad68_2022.jpg');
insert into players values('Egypt', 'Mohamed Salah', '15/06/92', 'Liverpool','Right Winger', 11);

-- Manchester United 2022/2023 Squad
--Coach
insert into sportPeople values('Netherlands', 'Erik ten Hag', '02/02/70', 'Manchester United', 'https://img.a.transfermarkt.technology/portrait/header/3816-1535533360.jpg?lm=1');
insert into coaches values(11, 'Erik ten Hag', 'Manchester United', '02/02/70', 'Netherlands');
--GK
insert into sportPeople values('Spain', 'David de Gea', '07/11/90', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/7ba6d84e_2022.jpg');
insert into players values('Spain', 'David de Gea', '07/11/90', 'Manchester United','Goalkeeper', 1);
--LB
insert into sportPeople values('England', 'Luke Shaw', '12/07/95', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/9c94165b_2022.jpg');
insert into players values('England', 'Luke Shaw', '12/07/95', 'Manchester United','Left Back', 23);
--CB
insert into sportPeople values('Argentina', 'Lisandro Martinez', '18/01/98', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/bac46a10_2022.jpg');
insert into players values('Argentina', 'Lisandro Martinez', '18/01/98', 'Manchester United', 'Centre Back', 6);
--CB
insert into sportPeople values('France', 'Raphael Varane', '25/04/93', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/9f8e9423_2022.jpg');
insert into players values('France', 'Raphael Varane', '25/04/93', 'Manchester United','Centre Back', 19);
--RB
insert into sportPeople values('England', 'Aaron Wan-Bissaka', '26/11/97', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/9e525177_2022.jpg');
insert into players values('England', 'Aaron Wan-Bissaka', '26/11/97', 'Manchester United','Right Back', 29);
--CDM (Check Brackets)
insert into sportPeople values('Brazil', 'Casemiro', '23/02/92', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/4d224fe8_2022.jpg');
insert into players values('Brazil', 'Casemiro', '23/02/92', 'Manchester United','Central Defensive Midfielder', 18);
--CM
insert into sportPeople values('Denmark', 'Christian Eriksen', '14/02/92', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/980522ec_2022.jpg');
insert into players values('Denmark', 'Christian Eriksen', '14/02/92', 'Manchester United','Central Midfielder', 14);
--CAM
insert into sportPeople values('Portugal', 'Bruno Fernandes', '08/09/94', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/507c7bdf_2022.jpg');
insert into players values('Portugal', 'Bruno Fernandes', '08/09/94', 'Manchester United','Central Attacking Midfielder', 8);
--LW
insert into sportPeople values('England', 'Marcus Rashford', '31/10/97', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/a1d5bd30_2022.jpg');
insert into players values('England', 'Marcus Rashford', '31/10/97', 'Manchester United','Left Winger', 10);
--ST
insert into sportPeople values('Portugal', 'Cristiano Ronaldo', '05/02/85', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/dea698d9_2022.jpg');
insert into players values('Portugal', 'Cristiano Ronaldo', '05/02/85', 'Manchester United','Striker', 7);
--RW
insert into sportPeople values('Brazil', 'Antony dos Santos', '24/02/00', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/99127249_2022.jpg');
insert into players values('Brazil', 'Antony dos Santos', '24/02/00', 'Manchester United','Right Winger', 21);

-- LaLiga

-- Barcelona 2022/2023 Squad
--Coach
insert into sportPeople values('Spain', 'Xavi', '25/01/80', 'Barcelona', 'https://img.a.transfermarkt.technology/portrait/header/59876-1662586515.jpg?lm=1');
insert into coaches values(5, 'Xavi', 'Barcelona', '25/01/80', 'Spain');
--GK
insert into sportPeople values('Germany', 'Marc-Andre ter Stegen', '30/04/92', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/6f51e382_2022.jpg');
insert into players values('Germany', 'Marc-Andre ter Stegen', '30/04/92', 'Barcelona','Goalkeeper', 1);
--LB
insert into sportPeople values('Spain', 'Jordi Alba', '21/03/89', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/4601e194_2022.jpg');
insert into players values('Spain', 'Jordi Alba', '21/03/89', 'Barcelona','Left Back', 18);
--CB
insert into sportPeople values('Uruguay', 'Ronald Araujo', '03/05/93', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/2bef2bca_2022.jpg');
insert into players values('Uruguay', 'Ronald Araujo', '03/05/93', 'Barcelona','Centre Back', 4);
--CB
insert into sportPeople values('Denmark', 'Andreas Christensen', '10/04/96', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/1cb49278_2022.jpg');
insert into players values('Denmark', 'Andreas Christensen', '10/04/96', 'Barcelona','Centre Back', 15);
--RB
insert into sportPeople values('France', 'Jules Kounde', '12/11/98', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/4d1666ff_2022.jpg');
insert into players values('France', 'Jules Kounde', '12/11/98', 'Barcelona','Right Back', 23);
--CDM
insert into sportPeople values('Spain', 'Sergio Busquets', '16/07/88', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/5ab0ea87_2022.jpg');
insert into players values('Spain', 'Sergio Busquets', '16/07/88', 'Barcelona','Central Defensive Midfielder', 5);
--CM
insert into sportPeople values('Spain', 'Gavi', '05/08/04', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/19cae58d_2022.jpg');
insert into players values('Spain', 'Gavi', '05/08/04', 'Barcelona','Central Midfielder', 30);
--CM
insert into sportPeople values('Spain', 'Pedri', '25/11/02', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/0d9b2d31_2022.jpg');
insert into players values('Spain', 'Pedri', '25/11/02', 'Barcelona','Central Midfielder', 8);
--LW
insert into sportPeople values('Spain', 'Ferran Torres', '29/02/00', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/9e1035f8_2022.jpg');
insert into players values('Spain', 'Ferran Torres', '29/02/00', 'Barcelona','Left Winger', 11);
--ST
insert into sportPeople values('Poland', 'Robert Lewandowski', '21/08/88', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/8d78e732_2022.jpg');
insert into players values('Poland', 'Robert Lewandowski', '21/08/88', 'Barcelona','Striker', 9);
--RW
insert into sportPeople values('France', 'Ousmane Dembele', '15/05/97', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/b19db005_2022.jpg');
insert into players values('France', 'Ousmane Dembele', '15/05/97', 'Barcelona','Right Winger', 7);

-- Real Madrid 2022/2023 Squad
--Coach
insert into sportPeople values('Italy', 'Carlo Ancelotti', '10/06/59', 'Real Madrid', 'https://img.a.transfermarkt.technology/portrait/header/523-1502276656.jpg?lm=1');
insert into coaches values(27, 'Carlo Ancelotti', 'Real Madrid', '10/06/59', 'Italy');
--GK
insert into sportPeople values('Belgium', 'Thibaut Courtois', '11/05/92', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/1840e36d_2022.jpg');
insert into players values('Belgium', 'Thibaut Courtois', '11/05/92', 'Real Madrid','Goalkeeper', 1);
--LB
insert into sportPeople values('France', 'Ferland Mendy', '08/06/95', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/3cefcaef_2022.jpg');
insert into players values('France', 'Ferland Mendy', '08/06/95', 'Real Madrid','Left Back', 23);
--CB
insert into sportPeople values('Germany', 'Antonio Rudiger', '03/05/93', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/18b896d6_2022.jpg');
insert into players values('Germany', 'Antonio Rudiger', '03/05/93', 'Real Madrid','Centre Back', 22);
--CB
insert into sportPeople values('Austria', 'David Alaba', '24/06/92', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/05439de2_2022.jpg');
insert into players values('Austria', 'David Alaba', '24/06/92', 'Real Madrid','Centre Back', 4);
--RB
insert into sportPeople values('Spain', 'Dani Carvajal', '11/01/92', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/4958bfb2_2022.jpg');
insert into players values('Spain', 'Dani Carvajal', '11/01/92', 'Real Madrid','Right Back', 2);
--CDM
insert into sportPeople values('France', 'Eduardo Camavinga', '10/11/02', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/7b9c2d84_2022.jpg');
insert into players values('France', 'Eduardo Camavinga', '10/11/02', 'Real Madrid','Central Defensive Midfielder', 12);
--CM
insert into sportPeople values('Germany', 'Toni Kroos', '04/01/90', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/6ce1f46f_2022.jpg');
insert into players values('Germany', 'Toni Kroos', '04/01/90', 'Real Madrid','Central Midfielder', 8);
--CM
insert into sportPeople values('Croatia', 'Luka Modric', '09/09/85', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/6025fab1_2022.jpg');
insert into players values('Croatia', 'Luka Modric', '09/09/85', 'Real Madrid','Central Midfielder', 10);
--LW
insert into sportPeople values('Brazil', 'Vinicius Junior', '12/07/00', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/7111d552_2022.jpg');
insert into players values('Brazil', 'Vinicius Junior', '12/07/00', 'Real Madrid','Left Winger', 20);
--CF
insert into sportPeople values('France', 'Karim Benzema', '19/12/87', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/70d74ece_2022.jpg');
insert into players values('France', 'Karim Benzema', '19/12/87', 'Real Madrid','Centre Forward', 9);
--RW
insert into sportPeople values('Brazil', 'Rodrygo', '09/01/01', 'Real Madrid', 'https://fbref.com/req/202302030/images/headshots/8f5e92a6_2022.jpg');
insert into players values('Brazil', 'Rodrygo', '09/01/01', 'Real Madrid','Right Winger', 21);


--------------------------------------------------------------------------
-- soccer_player_stats.sql
--------------------------------------------------------------------------

--Premier League
--Arsenal Squad 2022/2023 playerStat
--GK
insert into playersStats values(
    26,
    6,
    2023, --2022/2023 season
    6.3,
    38,
    'Aaron Ramsdale',
    'Arsenal');
--LB
insert into playersStats values(
    18,
    5,
    2023, --2022/2023 season
    7.3,
    27,
    'Oleksandr Zinchenko',
    'Arsenal');
--CB
insert into playersStats values(
    26,
    6,
    2023, --2022/2023 season
    7.7,
    38,
    'Gabriel Magalhaes',
    'Arsenal');
--CB
insert into playersStats values(
    18,
    4,
    2023, --2022/2023 season
    7.4,
    27,
    'William Saliba',
    'Arsenal');
--RB
insert into playersStats values(
    26,
    6,
    2023, --2022/2023 season
    7.4,
    38,
    'Ben White',
    'Arsenal');
--CDM
insert into playersStats values(
    23,
    3,
    2023, --2022/2023 season
    8,
    33,
    'Thomas Partey',
    'Arsenal');
--CM
insert into playersStats values(
    25,
    6,
    2023, --2022/2023 season
    7,
    37,
    'Granit Xhaka',
    'Arsenal');
--CAM
insert into playersStats values(
    26,
    6,
    2023, --2022/2023 season
    8.4,
    37,
    'Martin Odegaard',
    'Arsenal');
--LW
insert into playersStats values(
    25,
    5,
    2023, --2022/2023 season
    8,
    36,
    'Gabriel Martinelli',
    'Arsenal');
--CF
insert into playersStats values(
    18,
    5,
    2023, --2022/2023 season
    6.9,
    26,
    'Gabriel Jesus',
    'Arsenal');
--RW
insert into playersStats values(
    26,
    5,
    2023, --2022/2023 season
    8.2,
    38,
    'Bukayo Saka',
    'Arsenal');

-- Liverpool Squad 2022/2023 playerStat
--GK
insert into playersStats values(
    19,
    8,
    2023, --2022/2023 season
    7.3,
    37,
    'Alisson Becker',
    'Liverpool');
--LB
insert into playersStats values(
    19,
    7,
    2023, --2022/2023 season
    7.6,
    34,
    'Andrew Robertson',
    'Liverpool');
--CB
insert into playersStats values(
    17,
    6,
    2023, --2022/2023 season
    8.1,
    32,
    'Virgil van Dijk',
    'Liverpool');
--CB
insert into playersStats values(
    12,
    4,
    2023, --2022/2023 season
    7.7,
    18,
    'Ibrahima Konate',
    'Liverpool');
--RB
insert into playersStats values(
    19,
    9,
    2023, --2022/2023 season
    7.9,
    37,
    'Trent Alexander-Arnold',
    'Liverpool');
--CDM
insert into playersStats values(
    18,
    8,
    2023, --2022/2023 season
    6.9,
    36,
    'Fabinho',
    'Liverpool');
--CM
insert into playersStats values(
    5,
    2,
    2023, --2022/2023 season
    6,
    8,
    'Naby Keita',
    'Liverpool');
--CAM
insert into playersStats values(
    15,
    3,
    2023, --2022/2023 season
    8.2,
    18,
    'Thiago Alcantara',
    'Liverpool');
--LW
insert into playersStats values(
    15,
    5,
    2023, --2022/2023 season
    7.3,
    22,
    'Diogo Jota',
    'Liverpool');
--ST
insert into playersStats values(
    14,
    6,
    2023, --2022/2023 season
    7.1,
    29,
    'Darwin Nunez',
    'Liverpool');
--RW
insert into playersStats values(
    19,
    10,
    2023, --2022/2023 season
    8.5,
    38,
    'Mohamed Salah',
    'Liverpool');

-- Manchester United Squad 2022/2023 playerStats
--GK
insert into playersStats values(
    23,
    9,
    2023, --2022/2023 season
    8.5,
    38,
    'David de Gea',
    'Manchester United');
--LB
insert into playersStats values(
    16,
    10,
    2023, --2022/2023 season
    6.9,
    31,
    'Luke Shaw',
    'Manchester United');
--CB
insert into playersStats values(
    16,
    5,
    2023, --2022/2023 season
    7,
    27,
    'Lisandro Martinez',
    'Manchester United');
--CB
insert into playersStats values(
    18,
    4,
    2023, --2022/2023 season
    8.4,
    24,
    'Raphael Varane',
    'Manchester United');
--RB
insert into playersStats values(
    12,
    5,
    2023, --2022/2023 season
    6.8,
    19,
    'Aaron Wan-Bissaka',
    'Manchester United');
--CDM
insert into playersStats values(
    21,
    5,
    2023, --2022/2023 season
    8.1,
    28,
    'Casemiro',
    'Manchester United');
--CM
insert into playersStats values(
    21,
    5,
    2023, --2022/2023 season
    7.1,
    28,
    'Christian Eriksen',
    'Manchester United');
--CAM
insert into playersStats values(
    24,
    6,
    2023, --2022/2023 season
    8.1,
    37,
    'Bruno Fernandes',
    'Manchester United');
--LW
insert into playersStats values(
    23,
    6,
    2023, --2022/2023 season
    7.8,
    35,
    'Marcus Rashford',
    'Manchester United');
--ST
insert into playersStats values(
    20,
    4,
    2023, --2022/2023 season
    9.2,
    24,
    'Cristiano Ronaldo',
    'Manchester United');
--RW
insert into playersStats values(
    17,
    4,
    2023, --2022/2023 season
    7.3,
    25,
    'Antony dos Santos',
    'Manchester United');


--LaLiga
--Barcelona Squad 2022/2023 playerStat
--GK
insert into playersStats values(
    28,
    6,
    2023, --2022/2023 season
    9,
    38,
    'Marc-Andre ter Stegen',
    'Barcelona');
--LB
insert into playersStats values(
    20,
    2,
    2023, --2022/2023 season
    7.9,
    24,
    'Jordi Alba',
    'Barcelona');
--CB
insert into playersStats values(
    18,
    3,
    2023, --2022/2023 season
    7.4,
    22,
    'Ronald Araujo',
    'Barcelona');
--CB
insert into playersStats values(
    18,
    5,
    2023, --2022/2023 season
    7.5,
    23,
    'Andreas Christensen',
    'Barcelona');
--RB
insert into playersStats values(
    24,
    4,
    2023, --2022/2023 season
    7.8,
    29,
    'Jules Kounde',
    'Barcelona');
--CDM
insert into playersStats values(
    26,
    4,
    2023, --2022/2023 season
    8.1,
    30,
    'Sergio Busquets',
    'Barcelona');
--CM
insert into playersStats values(
    28,
    5,
    2023, --2022/2023 season
    7.9,
    36,
    'Gavi',
    'Barcelona');
--CM
insert into playersStats values(
    20,
    5,
    2023, --2022/2023 season
    7.9,
    26,
    'Pedri',
    'Barcelona');
--LW
insert into playersStats values(
    24,
    6,
    2023, --2022/2023 season
    6.9,
    33,
    'Ferran Torres',
    'Barcelona');
--ST
insert into playersStats values(
    27,
    3,
    2023, --2022/2023 season
    9.2,
    34,
    'Robert Lewandowski',
    'Barcelona');
--RW
insert into playersStats values(
    20,
    4,
    2023, --2022/2023 season
    7.9,
    25,
    'Ousmane Dembele',
    'Barcelona');

--Real Madrid Squad 2022/2023 playerStat
--GK
insert into playersStats values(
    23,
    5,
    2023, --2022/2023 season
    9.2,
    31,
    'Thibaut Courtois',
    'Real Madrid');
--LB
insert into playersStats values(
    12,
    3,
    2023, --2022/2023 season
    7.3,
    18,
    'Ferland Mendy',
    'Real Madrid');
--CB
insert into playersStats values(
    22,
    4,
    2023, --2022/2023 season
    7.8,
    33,
    'Antonio Rudiger',
    'Real Madrid');
--CB
insert into playersStats values(
    16,
    5,
    2023, --2022/2023 season
    7.5,
    23,
    'David Alaba',
    'Real Madrid');
--RB
insert into playersStats values(
    22,
    4,
    2023, --2022/2023 season
    7.7,
    27,
    'Dani Carvajal',
    'Real Madrid');
--CDM
insert into playersStats values(
    24,
    7,
    2023, --2022/2023 season
    8,
    37,
    'Eduardo Camavinga',
    'Real Madrid');
--CM
insert into playersStats values(
    20,
    5,
    2023, --2022/2023 season
    7.9,
    30,
    'Toni Kroos',
    'Real Madrid');
--CM
insert into playersStats values(
    22,
    6,
    2023, --2022/2023 season
    7.9,
    33,
    'Luka Modric',
    'Real Madrid');
--LW
--24-6-8
insert into playersStats values(
    20,
    6,
    2023, --2022/2023 season
    8.4,
    33,
    'Vinicius Junior',
    'Real Madrid');
--CF
insert into playersStats values(
    20,
    3,
    2023, --2022/2023 season
    9,
    24,
    'Karim Benzema',
    'Real Madrid');
--RW
insert into playersStats values(
    20,
    5,
    2023, --2022/2023 season
    8.1,
    34,
    'Rodrygo',
    'Real Madrid');


--------------------------------------------------------------------------
-- soccer_matches.sql
--------------------------------------------------------------------------

-- Premier League 2023/2024
-- Add Manchester City, Chelsea in Teams

--2023-08-13: Chelsea // 1–1 // Liverpool
--2023-09-03: Arsenal // 3–1 // Manchester Utd
--2023-10-29: Manchester Utd // 0–3 // Manchester City
--2023-11-25: Manchester City // 1–1 // Liverpool

--Match 1
insert into matches_1 values('Stamford Bridge', '13/08/23', 'Premier League');
insert into matches_2 values('Stamford Bridge', '13/08/23', 'Premier League', 'Match Draw', '1-1');
insert into play values('Stamford Bridge', '13/08/23', 'Liverpool', 'Chelsea');
--Match 2
insert into matches_1 values('Emirates Stadium', '03/09/23', 'Premier League');
insert into matches_2 values('Emirates Stadium', '03/09/23', 'Premier League', 'Arsenal Win', '3-1');
insert into play values('Emirates Stadium', '03/09/23', 'Manchester United', 'Arsenal');
--Match 3
insert into matches_1 values('Old Trafford', '29/10/23', 'Premier League');
insert into matches_2 values('Old Trafford', '29/10/23', 'Premier League', 'Manchester City Win', '0-3');
insert into play values('Old Trafford', '29/10/23', 'Manchester United', 'Manchester City');
--Match 4
insert into matches_1 values('Etihad Stadium', '25/11/23', 'Premier League');
insert into matches_2 values('Etihad Stadium', '25/11/23', 'Premier League', 'Match Draw', '1-1');
insert into play values('Etihad Stadium', '25/11/23', 'Manchester City', 'Liverpool');

-- Premier League 2022/2023
-- Add Manchester City in Teams

--22-08-2022: Manchester Utd // 2–1 // Liverpool - Old Trafford
--04-09-2022: Manchester Utd // 3–1	// Arsenal - Old Trafford
--09-10-2022: Arsenal // 3–2 // Liverpool - Emirates Stadium
--16-10-2022: Liverpool // 1–0 // Manchester City - Anfield 

--Match 1
insert into matches_1 values('Old Trafford', '22/08/22', 'Premier League');
insert into matches_2 values('Old Trafford', '22/08/22', 'Premier League', 'Manchester United Win', '2-1');
insert into play values('Old Trafford', '22/08/22', 'Liverpool', 'Manchester United');
--Match 2
insert into matches_1 values('Old Trafford', '04/09/22', 'Premier League');
insert into matches_2 values('Old Trafford', '04/09/22', 'Premier League', 'Manchester United Win', '3-1');
insert into play values('Old Trafford', '04/09/22', 'Arsenal', 'Manchester United');
--Match 3
insert into matches_1 values('Emirates Stadium', '09/10/22', 'Premier League');
insert into matches_2 values('Emirates Stadium', '09/10/22', 'Premier League', 'Arsenal Win', '3-2');
insert into play values('Emirates Stadium', '09/10/22', 'Liverpool', 'Arsenal');
--Match 4
insert into matches_1 values('Anfield ', '16/10/22', 'Premier League');
insert into matches_2 values('Anfield ', '16/10/22', 'Premier League', 'Liverpool Win', '1-0');
insert into play values('Anfield ', '16/10/22', 'Manchester City', 'Liverpool');

-- Premier League 2021/2022
-- Add Chelsea in Teams

--22-08-2021: Arsenal // 0–2 // Chelsea - Emirates Stadium
--24-10-2021: Manchester Utd // 0–5 // Liverpool - Old Trafford
--20-11-2021: Liverpool // 4–0 // Arsenal - Anfield
--02-12-2021: Manchester Utd // 3–2 // Arsenal - Old Trafford

--Match 1
insert into matches_1 values('Emirates Stadium', '22/08/21', 'Premier League');
insert into matches_2 values('Emirates Stadium', '22/08/21', 'Premier League', 'Chelsea Win', '0-2');
insert into play values('Emirates Stadium', '22/08/21', 'Chelsea', 'Arsenal');
--Match 2
insert into matches_1 values('Old Trafford', '24/10/21', 'Premier League');
insert into matches_2 values('Old Trafford', '24/10/21', 'Premier League', 'Liverpool Win', '0-5');
insert into play values('Old Trafford', '24/10/21', 'Liverpool', 'Manchester United');
--Match 3
insert into matches_1 values('Anfield', '20/11/21', 'Premier League');
insert into matches_2 values('Anfield', '20/11/21', 'Premier League', 'Liverpool Win', '4-0');
insert into play values('Anfield', '20/11/21', 'Arsenal', 'Liverpool');
--Match 4
insert into matches_1 values('Old Trafford', '02/12/21', 'Premier League');
insert into matches_2 values('Old Trafford', '02/12/21', 'Premier League', 'Manchester United Win', '3-2');
insert into play values('Old Trafford', '02/12/21', 'Arsenal', 'Manchester United');

-- La Liga:

-- La Liga 2023/2024
-- Add Atletico Madrid, Sevilla in Teams

--24-09-2023: Atletico Madrid // 3–1 // Real Madrid - Estadio Civitas Metropolitano
--29-09-2023: Barcelona // 1–0 // Sevilla - Estadi Olimpic Lluis Companys
--21-10-2023: Sevilla // 1–1 // Real Madrid	- Estadio Ramon Sanchez Pizjuan
--28-10-2023: Barcelona // 1–2 // Real Madrid - Estadi Olimpic Lluis Companys

--Match 1
insert into matches_1 values('Estadio Civitas Metropolitano', '24/09/23', 'La Liga');
insert into matches_2 values('Estadio Civitas Metropolitano', '24/09/23', 'La Liga', 'Atletico Madrid Win', '3-1');
insert into play values('Estadio Civitas Metropolitano', '24/09/23', 'Real Madrid', 'Atletico Madrid');
--Match 2
insert into matches_1 values('Estadio Civitas Metropolitano', '29/09/23', 'La Liga');
insert into matches_2 values('Estadio Civitas Metropolitano', '29/09/23', 'La Liga', 'Barcelona Win', '1-0');
insert into play values('Estadio Civitas Metropolitano', '29/09/23', 'Sevilla', 'Barcelona');
--Match 3
insert into matches_1 values('Estadio Ramon Sanchez Pizjuan', '21/10/23', 'La Liga');
insert into matches_2 values('Estadio Ramon Sanchez Pizjuan', '21/10/23', 'La Liga', 'Match Draw', '1-1');
insert into play values('Estadio Ramon Sanchez Pizjuan', '21/10/23', 'Real Madrid', 'Sevilla');
--Match 4
insert into matches_1 values('Estadi Olimpic Lluis Companys', '28/10/23', 'La Liga');
insert into matches_2 values('Estadi Olimpic Lluis Companys', '28/10/23', 'La Liga', 'Real Madrid Win', '1-2');
insert into play values('Estadi Olimpic Lluis Companys', '28/10/23', 'Barcelona', 'Real Madrid');

-- La Liga 2022/2023
-- Add Atletico Madrid, Sevilla in Teams

--03-09-2022: Sevilla // 0–3 // Barcelona - Estadio Ramon Sanchez Pizjuan
--18-09-2022: Atletico Madrid // 1–2 // Real Madrid - Estadio Civitas Metropolitano
--16-10-2022: Real Madrid // 3–1 // Barcelona - Estadio Santiago Bernabeu
--22-10-2022: Real Madrid // 3–1 // Sevilla	- Estadio Santiago Bernabeu

--Match 1
insert into matches_1 values('Estadio Ramon Sanchez Pizjuan', '03/09/22', 'La Liga');
insert into matches_2 values('Estadio Ramon Sanchez Pizjuan', '03/09/22', 'La Liga', 'Barcelona Win', '0-1');
insert into play values('Estadio Ramon Sanchez Pizjuan', '03/09/22', 'Barcelona', 'Sevilla');
--Match 2
insert into matches_1 values('Estadio Civitas Metropolitano', '18/09/22', 'La Liga');
insert into matches_2 values('Estadio Civitas Metropolitano', '18/09/22', 'La Liga', 'Real Madrid Win', '1-2');
insert into play values('Estadio Civitas Metropolitano', '18/09/22', 'Real Madrid', 'Atletico Madrid');
--Match 3
insert into matches_1 values('Estadio Santiago Bernabeu', '16/10/22', 'La Liga');
insert into matches_2 values('Estadio Santiago Bernabeu', '16/10/22', 'La Liga', 'Real Madrid Win', '3-1');
insert into play values('Estadio Santiago Bernabeu', '16/10/22', 'Barcelona', 'Real Madrid');
--Match 4
insert into matches_1 values('Estadio Santiago Bernabeu', '22/10/22', 'La Liga');
insert into matches_2 values('Estadio Santiago Bernabeu', '22/10/22', 'La Liga', 'Real Madrid Win', '3-1');
insert into play values('Estadio Santiago Bernabeu', '22/10/22', 'Sevilla', 'Real Madrid');

-- La Liga 2021/2022
-- Add Atletico Madrid, Sevilla in Teams

--02-10-2021: Atletico Madrid // 2–0 // Barcelona - Estadio Wanda Metropolitano
--24-10-2021: Barcelona // 1–2 // Real Madrid - Camp Nou
--28-11-2021: Real Madrid // 2–1 // Sevilla - Estadio Santiago Bernabeu
--12-12-2021: Real Madrid // 2–0 // Atletico Madrid - Estadio Santiago Bernabeu

--Match 1
insert into matches_1 values('Estadio Wanda Metropolitano', '02/10/21', 'La Liga');
insert into matches_2 values('Estadio Wanda Metropolitano', '02/10/21', 'La Liga', 'Atletico Madrid Win', '2-0');
insert into play values('Estadio Wanda Metropolitano', '02/10/21', 'Barcelona', 'Atletico Madrid');
--Match 2
insert into matches_1 values('Camp Nou', '24/10/21', 'La Liga');
insert into matches_2 values('Camp Nou', '24/10/21', 'La Liga', 'Real Madrid Win', '1-2');
insert into play values('Camp Nou', '24/10/21', 'Real Madrid', 'Barcelona');
--Match 3
insert into matches_1 values('Estadio Santiago Bernabeu', '28/11/21', 'La Liga');
insert into matches_2 values('Estadio Santiago Bernabeu', '28/11/21', 'La Liga', 'Real Madrid Win', '2-1');
insert into play values('Estadio Santiago Bernabeu', '28/11/21', 'Sevilla', 'Real Madrid');
--Match 4
insert into matches_1 values('Estadio Santiago Bernabeu', '12/12/21', 'La Liga');
insert into matches_2 values('Estadio Santiago Bernabeu', '12/12/21', 'La Liga', 'Real Madrid Win', '2-0');
insert into play values('Estadio Santiago Bernabeu', '12/12/21', 'Atletico Madrid', 'Real Madrid');


--------------------------------------------------------------------------
-- soccer_news.sql
--------------------------------------------------------------------------

-- Premier League News
--News 1
insert into news_1 values(
    'The 10 Most Overpaid Players in the Premier League Ranked', 
    'GiveMeSport(GMS)', 
    TO_DATE('30-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/the-10-most-overpaid-players-in-the-premier-league-ranked-38649582');
insert into news_2 values(
    'The 10 Most Overpaid Players in the Premier League Ranked', 
    'GiveMeSport(GMS)',
    'OneFootball');
insert into covers values(
    'Premier League',
    'The 10 Most Overpaid Players in the Premier League Ranked', 
    'GiveMeSport(GMS)');
--News 2
insert into news_1 values(
    'Can the Premier League Strip Manchester City of Silverware Following FFP Charges?', 
    'caughtoffside', 
    TO_DATE('26-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/can-the-premier-league-strip-manchester-city-of-silverware-following-ffp-charges-38648055');
insert into news_2 values(
    'Can the Premier League Strip Manchester City of Silverware Following FFP Charges?', 
    'caughtoffside',
    'OneFootball');
insert into covers values(
    'Premier League',
    'Can the Premier League Strip Manchester City of Silverware Following FFP Charges?', 
    'caughtoffside');
--News 3
insert into news_1 values(
    'The Last 9 Times Arsenal Were Top of the Premier League in December and What Happened Next', 
    'Planet Football', 
    TO_DATE('20-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/the-last-9-times-arsenal-were-top-of-the-premier-league-in-december-what-happened-next-38647638');
insert into news_2 values(
    'The Last 9 Times Arsenal Were Top of the Premier League in December and What Happened Next', 
    'Planet Football',
    'OneFootball');
insert into covers values(
    'Premier League',
    'The Last 9 Times Arsenal Were Top of the Premier League in December and What Happened Next', 
    'Planet Football');

-- La Liga News
-- News 1
insert into news_1 values(
    'Jude Bellingham Scores Again to Make Real Madrid History', 
    'Peter Fitzpatrick', 
    TO_DATE('26-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/jude-bellingham-scores-again-to-make-real-madrid-history-38625670');
insert into news_2 values(
    'Jude Bellingham Scores Again to Make Real Madrid History', 
    'Peter Fitzpatrick',
    'OneFootball');
insert into covers values(
    'La Liga',
    'Jude Bellingham Scores Again to Make Real Madrid History', 
    'Peter Fitzpatrick');
-- News 2
insert into news_1 values(
    'Report Claims Barcelona Have Lost 7 Points This Season From Referee Mistakes, Would Be Top of La Liga', 
    'Football Espana', 
    TO_DATE('20-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/jude-bellingham-scores-again-to-make-real-madrid-history-38625670');
insert into news_2 values(
    'Report Claims Barcelona Have Lost 7 Points This Season From Referee Mistakes, Would Be Top of La Liga', 
    'Football Espana',
    'OneFootball');
insert into covers values(
    'La Liga',
    'Report Claims Barcelona Have Lost 7 Points This Season From Referee Mistakes, Would Be Top of La Liga', 
    'Football Espana');
-- News 3
insert into news_1 values(
    'Griezmann on Target Again as Atleti Win to Close in on La Liga Summit', 
    'Adam Booker', 
    TO_DATE('18-11-2023', 'DD-MM-YYYY'),
    'https://onefootball.com/en/news/jude-bellingham-scores-again-to-make-real-madrid-history-38625670');
insert into news_2 values(
    'Griezmann on Target Again as Atleti Win to Close in on La Liga Summit', 
    'Adam Booker',
    'OneFootball');
insert into covers values(
    'La Liga',
    'Griezmann on Target Again as Atleti Win to Close in on La Liga Summit', 
    'Adam Booker');



    -------------------------------------------
    -------------------------------------------






    insert into matches_1 values('Ball Arena', '24/10/23','NBA');
    insert into matches_1 values('Chase Center', '24/10/23','NBA');
    insert into matches_1 values('Barclays Center', '25/10/23','NBA');
    insert into matches_1 values('United Center', '25/10/23','NBA');



    insert into matches_2 values('Ball Arena','24/10/23','NBA', 'Denver Nuggets', '119-107');
    insert into matches_2 values('Chase Center', '24/10/23','NBA','Phoenix Suns', '108-104');
    insert into matches_2 values('Barclays Center','25/10/23','NBA','Cleveland Cavaliers', '114-113');
    insert into matches_2 values('United Center', '25/10/23','NBA', 'Oklahoma City Thunder', '124-104');


    insert into play values('Ball Arena','24/10/23', 'Los Angeles Lakers', 'Denver Nuggets');
    insert into play values('Chase Center','24/10/23','Phoenix Suns','Golden State Warriors');
    insert into play values('Barclays Center','25/10/23','Cleveland Cavaliers','Brooklyn Nets');
    --insert into play values('Oklahoma City Thunder','25/10/23','United Center', 'Chicago Bulls');