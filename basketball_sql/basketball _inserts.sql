drop table sports;
drop table play;
drop table playersStats;
drop table teamStats;
drop table coaches;
drop table players;
drop table sportPeople;
drop table teams;
drop table matches_2;
drop table matches_1;
drop table leagues;


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



    create table teams (
    teamName varchar(30) not null,
    city varchar(40),
    leagueName varchar(40),
    picture char(200),
    primary key (teamName),
    foreign key (leagueName) references leagues
    ON DELETE CASCADE);

    grant select on teams to public;


    CREATE TABLE sportPeople (
        nationality     char(20) not null,
        name_           varchar(30) not null,
        birthDate       char(10) null,
        TeamName        char(30),
        picture char(200),
        primary key(nationality, name_, birthDate),
        foreign key (TeamName) references Teams ON DELETE CASCADE);
 
        grant select on sportPeople to public;



    CREATE TABLE players (
        nationality     char(20) not null,
        name_           varchar(30) not null,
        birthDate       char(10) null,
        TeamName        char(30),
        position        char(40),
        kitNum          int,
        primary key(name_, TeamName),
        foreign key(nationality, name_, birthDate) references sportPeople(nationality, name_, birthDate) ON DELETE CASCADE);

    grant select on players to public;


    create table coaches (
        NumOfSeasons    int,
        name_           varchar(30) not null,
        TeamName        char(30),
        birthDate       char(10) null,
        nationality     char(20) not null,
        primary key(nationality, name_,  birthDate),
        foreign key(nationality, name_,  birthDate) references sportPeople ON DELETE CASCADE);

        grant select on coaches to public;


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



create table playersStats(
        wins    int,
        losses  int,
        year_   int not null,
        averageRating float,
        appearances   float,
        name_         varchar(30) not null,
        TeamName        char(30),
        primary key (year_),
        foreign key (name_, TeamName) references players(name_,TeamName) ON DELETE CASCADE);

    grant select on playersStats to public;


create table matches_1(
    matchDate char(10),
    leagueName char(30),
    stadium     varchar(40),
    primary key(matchDate, stadium),
    foreign key(leagueName)
    references leagues(leagueName)
    ON DELETE CASCADE);

    grant select on matches_1 to public;

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



    insert into Leagues values('NBA', 'USA', '18/10/22', '12/06/23', 'Basketball', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/NBA-2024.png');
    insert into Leagues values('WNBA', 'USA', '19/05/23', '10/09/23', 'Basketball', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/WNBA-2022.png');

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

    insert into Teams values('Las Vegas Aces', 'Las Vegas, NV', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/LVA-2023.png');
    insert into Teams values('New York Liberty', 'New York City, NY', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/NYL-2023.png');
    insert into Teams values('Connecticut Sun', 'Uncasville, CT', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/CON-2023.png');
    insert into Teams values('Dallas Wings', 'Dallas, TX', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/DAL-2023.png');
    insert into Teams values('Atlanta Dream', 'College Park, GR', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/ATL-2023.png');
    insert into Teams values('Minnesota Lynx', 'Minneapolis, MB', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/MIN-2023.png');
    insert into Teams values('Washington Mystics', 'Washington, D.C.', 'WNBA', 'https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/WAS-2023.png');


    insert into matches_1 values('24/10/23','NBA','Ball Arena');
    insert into matches_1 values('24/10/23','NBA','Chase Center');
    insert into matches_1 values('25/10/23','NBA','Barclays Center');
    insert into matches_1 values('25/10/23','NBA','United Center');

    insert into matches_2 values('24/10/23','NBA','Ball Arena', 'Denver Nuggets', '119-107');
    insert into matches_2 values('24/10/23','NBA','Chase Center','Phoenix Suns', '108-104');
    insert into matches_2 values('25/10/23','NBA','Barclays Center','Cleveland Cavaliers', '114-113');
    insert into matches_2 values('25/10/23','NBA','United Center', 'Oklahoma City Thunder', '124-104');

    insert into play values('24/10/23','Ball Arena', 'Los Angeles Lakers', 'Denver Nuggets');
    insert into play values('24/10/23','Chase Center','Phoenix Suns','Golden State Warriors');
    insert into play values('25/10/23','Barclays Center','Cleveland Cavaliers','Brooklyn Nets');
    insert into play values('25/10/23','United Center','Oklahoma City Thunder', 'Chicago Bulls');

    insert into matches_1 values('20/05/23','WNBA','College Park Center');
    insert into matches_2 values('20/05/23','WNBA','College Park Center', 'Dallas Wings', '85-78');
    insert into play values('20/05/23','College Park Center', 'Atlanta Dream', 'Dallas Wings');

    insert into matches_1 values('23/05/23','WNBA','Target Center');
    insert into matches_2 values('23/05/23','WNBA','Target Center', 'Atlanta Dream', '83-77');
    insert into play values('23/05/23','Target Center', 'Atlanta Dream', 'Minnesota Lynx');

    insert into matches_1 values('27/05/23','WNBA','Barclays Center');
    insert into matches_2 values('27/05/23','WNBA','Barclays Center', 'New York Liberty', '81-65');
    insert into play values('27/05/23','Barclays Center', 'Connecticut Sun', 'New York Liberty');

    insert into matches_1 values('06/06/23','WNBA','Mohegan Sun Arena');
    insert into matches_2 values('06/06/23','WNBA','Mohegan Sun Arena', 'Las Vegas Aces', '90-84');
    insert into play values('06/06/23','Mohegan Sun Arena', 'Las Vegas Aces', 'Connecticut Sun');

    insert into sportPeople values('American', 'Harrison Barnes', '30/05/92', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/barneha02.jpg');
    insert into players values('American', 'Harrison Barnes', '30/05/92','Sacramento Kings','Power Forward and Small Forward', 40);

    insert into sportPeople values('American', 'Deonte Burton', '31/01/94', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/burtode02.jpg');
    insert into players values('American', 'Deonte Burton', '31/01/94','Sacramento Kings','Power/Small Forward, Shooting Guard', 23);

    insert into sportPeople values('American', 'Terence B. Davis II', '16/05/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/daviste02.jpg');
    insert into players values('American', 'Terence B. Davis II', '16/05/97','Sacramento Kings',  'Shooting Guard', 3);

    insert into sportPeople values('Australian', 'Matthew Dellavedova', '08/09/90', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/dellama01.jpg');
    insert into players values('Australian', 'Matthew Dellavedova', '08/09/90','Sacramento Kings','Point Guard and Shooting Guard', 8);

    insert into sportPeople values('American', 'Perry Dozier Jr.', '25/10/96', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/doziepj01.jpg');
    insert into players values('American', 'Perry Dozier Jr.', '25/10/96','Sacramento Kings','Shooting/Point Guard, Small Forward', 35);

    insert into sportPeople values('American', 'Kessler Donovan Edwards', '09/08/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/edwarke02.jpg');
    insert into players values('American', 'Kessler Donovan Edwards', '09/08/00','Sacramento Kings','Small Forward', 14);

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

    -----------------------------------------------
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

    ---------------------------------------
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


    --------------

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


    --------------

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


    insert into sportPeople values('American', 'Ariel Atkins', '30/07/96', 'Washington Mystics', 'https://www.basketball-reference.com/req/202106291/images/headshots/atkinar01w.jpg');
    insert into players values('American', 'Ariel Atkins', '30/07/96','Washington Mystics','Guard',7 );

    insert into sportPeople values('American', 'Shakira Austin', '25/07/00', 'Washington Mystics', 'https://www.basketball-reference.com/req/202106291/images/headshots/austish01w.jpg');
    insert into players values('American', 'Shakira Austin', '25/07/00','Washington Mystics','Center-Forward', 0);

    insert into sportPeople values('American', 'Natasha Cloud', '22/02/92', 'Washington Mystics', 'https://www.basketball-reference.com/req/202106291/images/headshots/cloudna01w.jpg');
    insert into players values('American', 'Natasha Cloud', '22/02/92','Washington Mystics','Guard', 9);

    insert into sportPeople values('American', 'Elena Delle Donne', '05/09/89', 'Washington Mystics', 'https://www.basketball-reference.com/req/202106291/images/headshots/delleel01w.jpg');
    insert into players values('American', 'Elena Delle Donne', '05/09/89','Washington Mystics','Forward-Guard', 11);

    insert into sportPeople values('American', 'Queen Egbo', '29/06/00', 'Washington Mystics', 'https://www.basketball-reference.com/req/202106291/images/headshots/egboqu01w.jpg');
    insert into players values('American', 'Queen Egbo', '29/06/00','Washington Mystics','Forward-Center', 4);

    -------------------------------

    insert into sportPeople values('American', 'Becky Hammon', '11/03/77', 'Las Vegas Aces', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThGM1J3Y6VBWaoI8hDRpr5zB5cIP8Tywc4jw');
    insert into coaches values(2, 'Becky Hammon','Las Vegas Aces', '11/03/77','American');

    insert into sportPeople values('Australian', 'Sandy Brondello', '20/08/68', 'New York Liberty', 'https://duckduckgo.com/i/384e4cab.jpg');
    insert into coaches values(19, 'Sandy Brondello','New York Liberty', '20/08/68','Australian');

    insert into sportPeople values('American', 'Stephanie White', '20/06/77', 'Connecticut Sun', 'https://duckduckgo.com/i/f44e194f.jpg');
    insert into coaches values(11, 'Stephanie White','Connecticut Sun', '20/06/77','American');

    insert into sportPeople values('American', 'Latricia Trammell', '20/02/68', 'Dallas Wings', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwaaVXcO2sRqFVdB8jfOuqAbwR_HWlMWrYUw');
    insert into coaches values(6, 'Latricia Trammell','Dallas Wings', '20/02/68','American');

    insert into sportPeople values('American', 'Tanisha Wright', '29/11/83', 'Atlanta Dream', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjKWX5q0DxlOYhbRgmCPPKR_8V3-vCoRTpng');
    insert into coaches values(4, 'Tanisha Wright','Atlanta Dream', '29/11/83','American');

    insert into sportPeople values('American', 'Cheryl Reeve', '20/09/66', 'Minnesota Lynx', 'https://duckduckgo.com/i/7d03b9a8.jpg');
    insert into coaches values(22, 'Cheryl Reeve','Minnesota Lynx', '20/09/66','American');

    insert into sportPeople values('American', 'Eric Thibault', '22/08/87', 'Washington Mystics', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXKJ3M_2XvmQ8hP8QGw68rc7wEG0h5IZWX7g');
    insert into coaches values(11, 'Eric Thibault','Washington Mystics', '22/08/87','American');


insert into playersStats values(34,6,2023, 3.2,23, 'Kierstan Bell', 'Las Vegas Aces');
insert into playersStats values(34,6,2023, 4.6, 30, 'Alysha Clark', 'Las Vegas Aces');
insert into playersStats values(34,6,2023, 3.9, 27, 'Alaina Coates', 'Las Vegas Aces');
insert into playersStats values(34,6,2023, 2.7, 15, 'Sydney Colson', 'Las Vegas Aces');
insert into playersStats values(34,6,2023, 4.1, 31, 'Cayla George', 'Las Vegas Aces');

insert into playersStats values(26,10,2022, 2.7, 19, 'Kierstan Bell', 'Las Vegas Aces');
insert into playersStats values(26,10,2022, 3.8, 28, 'Alysha Clark', 'Las Vegas Aces');
insert into playersStats values(26,10,2022, 4.1, 30, 'Alaina Coates', 'Las Vegas Aces');
insert into playersStats values(26,10,2022, 3.0, 25, 'Sydney Colson', 'Las Vegas Aces');
insert into playersStats values(26,10,2022, 3.5, 24, 'Cayla George', 'Las Vegas Aces');

insert into playersStats values(24,8,2021, 2.4, 20, 'Kierstan Bell', 'Las Vegas Aces');
insert into playersStats values(24,8,2021, 3.4, 24, 'Alysha Clark', 'Las Vegas Aces');
insert into playersStats values(24,8,2021, 4.3, 18, 'Alaina Coates', 'Las Vegas Aces');
insert into playersStats values(24,8,2021, 3.0, 15, 'Sydney Colson', 'Las Vegas Aces');
insert into playersStats values(24,8,2021, 3.9, 13, 'Cayla George', 'Las Vegas Aces');
--------------------------------------------------

insert into playersStats values(32,8,2023, 2.7, 20, 'Stefanie Dolson', 'New York Liberty');
insert into playersStats values(32,8,2023, 3.3, 22, 'Sabrina Ionescu', 'New York Liberty');
insert into playersStats values(32,8,2023, 4.0, 30, 'Jonquel Jones', 'New York Liberty');
insert into playersStats values(32,8,2023, 3.7, 18, 'Betnijah Laney', 'New York Liberty');
insert into playersStats values(32,8,2023, 1.8, 15, 'Nyara Sabally', 'New York Liberty');

insert into playersStats values(16,20,2022, 3.0, 22, 'Stefanie Dolson', 'New York Liberty');
insert into playersStats values(16,20,2022, 3.0, 24, 'Sabrina Ionescu', 'New York Liberty');
insert into playersStats values(16,20,2022, 3.5, 18, 'Jonquel Jones', 'New York Liberty');
insert into playersStats values(16,20,2022, 2.8, 19, 'Betnijah Laney', 'New York Liberty');
insert into playersStats values(16,20,2022, 2.2, 16, 'Nyara Sabally', 'New York Liberty');

insert into playersStats values(12,20,2021, 3.1,25, 'Stefanie Dolson', 'New York Liberty');
insert into playersStats values(12,20,2021, 2.9,20, 'Sabrina Ionescu', 'New York Liberty');
insert into playersStats values(12,20,2021, 4.0,26, 'Jonquel Jones', 'New York Liberty');
insert into playersStats values(12,20,2021, 2.8,15, 'Betnijah Laney', 'New York Liberty');
insert into playersStats values(12,20,2021, 2.4,17, 'Nyara Sabally', 'New York Liberty');
--------------------------------------------------

insert into playersStats values(27,13,2023, 2.5, 27, 'Rebecca Allen', 'Connecticut Sun');
insert into playersStats values(27,13,2023, 2.7, 25, 'DeWanna Bonner', 'Connecticut Sun');
insert into playersStats values(27,13,2023, 3.6, 23, 'Leigha Brown', 'Connecticut Sun');
insert into playersStats values(27,13,2023, 1.3, 15, 'DiJonai Carrington', 'Connecticut Sun');
insert into playersStats values(27,13,2023, 2.2, 16, 'Tyasha Harris', 'Connecticut Sun');

insert into playersStats values(25,11,2022, 2.5, 20, 'Rebecca Allen', 'Connecticut Sun');
insert into playersStats values(25,11,2022, 2.0, 23, 'DeWanna Bonner', 'Connecticut Sun');
insert into playersStats values(25,11,2022, 4.0, 31, 'Leigha Brown', 'Connecticut Sun');
insert into playersStats values(25,11,2022, 1.7, 19, 'DiJonai Carrington', 'Connecticut Sun');
insert into playersStats values(25,11,2022, 2.3, 14, 'Tyasha Harris', 'Connecticut Sun');

insert into playersStats values(26,6,2021, 2.5, 24, 'Rebecca Allen', 'Connecticut Sun');
insert into playersStats values(26,6,2021, 1.9, 16, 'DeWanna Bonner', 'Connecticut Sun');
insert into playersStats values(26,6,2021, 3.6, 20, 'Leigha Brown', 'Connecticut Sun');
insert into playersStats values(26,6,2021, 2.3, 17, 'DiJonai Carrington', 'Connecticut Sun');
insert into playersStats values(26,6,2021, 2.5, 21, 'Tyasha Harris', 'Connecticut Sun');
--------------------------------------------------



insert into playersStats values(22,18,2023, 1.9, 20, 'Kalani Brown', 'Dallas Wings');
insert into playersStats values(22,18,2023, 1.2, 23, 'Veronica Grace Burton', 'Dallas Wings');
insert into playersStats values(22,18,2023, 3.9, 29, 'Crystal Dangerfield', 'Dallas Wings');
insert into playersStats values(22,18,2023, 4.0, 33, 'Diamond DeShields', 'Dallas Wings');
insert into playersStats values(22,18,2023, 3.7, 31, 'Natasha Howard', 'Dallas Wings');

insert into playersStats values(18,18,2022, 1.7, 14, 'Kalani Brown', 'Dallas Wings');
insert into playersStats values(18,18,2022, 1.3, 19, 'Veronica Grace Burton', 'Dallas Wings');
insert into playersStats values(18,18,2022, 3.7, 20, 'Crystal Dangerfield', 'Dallas Wings');
insert into playersStats values(18,18,2022, 4.1, 27, 'Diamond DeShields', 'Dallas Wings');
insert into playersStats values(18,18,2022, 4.0, 29, 'Natasha Howard', 'Dallas Wings');

insert into playersStats values(14,18,2021, 1.3, 12, 'Kalani Brown', 'Dallas Wings');
insert into playersStats values(14,18,2021, 3.9, 27, 'Veronica Grace Burton', 'Dallas Wings');
insert into playersStats values(14,18,2021, 2.1, 22, 'Crystal Dangerfield', 'Dallas Wings');
insert into playersStats values(14,18,2021, 2.3, 18, 'Diamond DeShields', 'Dallas Wings');
insert into playersStats values(14,18,2021, 1.4, 15, 'Natasha Howard', 'Dallas Wings');
--------------------------------------------------

insert into playersStats values(19,21,2023, 2.3, 24, 'Monique Billings', 'Atlanta Dream');
insert into playersStats values(19,21,2023, 2.1, 26, 'Nia Coffey', 'Atlanta Dream');
insert into playersStats values(19,21,2023, 3.0, 30, 'Asia Durr', 'Atlanta Dream');
insert into playersStats values(19,21,2023, 1.2, 15, 'Allisha Gray', 'Atlanta Dream');
insert into playersStats values(19,21,2023, 1.4, 17, 'Laeticia Amihere', 'Atlanta Dream');

insert into playersStats values(14,22,2022, 2.3, 20, 'Monique Billings', 'Atlanta Dream');
insert into playersStats values(14,22,2022, 2.4, 26, 'Nia Coffey', 'Atlanta Dream');
insert into playersStats values(14,22,2022, 2.9, 28, 'Asia Durr', 'Atlanta Dream');
insert into playersStats values(14,22,2022, 1.7, 17, 'Allisha Gray', 'Atlanta Dream');
insert into playersStats values(14,22,2022, 1.3, 14, 'Laeticia Amihere', 'Atlanta Dream');

insert into playersStats values(8,24,2021, 1.9, 18, 'Monique Billings', 'Atlanta Dream');
insert into playersStats values(8,24,2021, 2.2, 21, 'Nia Coffey', 'Atlanta Dream');
insert into playersStats values(8,24,2021, 2.5, 25, 'Asia Durr', 'Atlanta Dream');
insert into playersStats values(8,24,2021, 1.2, 13, 'Allisha Gray', 'Atlanta Dream');
insert into playersStats values(8,24,2021, 1.0, 12, 'Laeticia Amihere', 'Atlanta Dream');

--------------------------------------------------

insert into playersStats values(19,21,2023, 2.3, 14, 'Lindsay Allen', 'Minnesota Lynx');
insert into playersStats values(19,21,2023, 2.9, 31, 'Rachel Banham', 'Minnesota Lynx');
insert into playersStats values(19,21,2023, 1.6, 12, 'Natalie Achonwa', 'Minnesota Lynx');
insert into playersStats values(19,21,2023, 1.3, 13, 'Bridget Carleton', 'Minnesota Lynx');
insert into playersStats values(19,21,2023, 1.8, 17, 'Napheesa Collier', 'Minnesota Lynx');

insert into playersStats values(14,22,2022, 2.5, 23, 'Lindsay Allen', 'Minnesota Lynx');
insert into playersStats values(14,22,2022, 2.4, 29, 'Rachel Banham', 'Minnesota Lynx');
insert into playersStats values(14,22,2022, 1.2, 19, 'Natalie Achonwa', 'Minnesota Lynx');
insert into playersStats values(14,22,2022, 1.0, 19, 'Bridget Carleton', 'Minnesota Lynx');
insert into playersStats values(14,22,2022, 1.3, 12, 'Napheesa Collier', 'Minnesota Lynx');

insert into playersStats values(22,10,2021, 2.6, 29, 'Lindsay Allen', 'Minnesota Lynx');
insert into playersStats values(22,10,2021, 3.1, 25, 'Rachel Banham', 'Minnesota Lynx');
insert into playersStats values(22,10,2021, 2.3, 22, 'Natalie Achonwa', 'Minnesota Lynx');
insert into playersStats values(22,10,2021, 2.2, 23, 'Bridget Carleton', 'Minnesota Lynx');
insert into playersStats values(22,10,2021, 2.2, 17, 'Napheesa Collier', 'Minnesota Lynx');

--------------------------------------------------

insert into playersStats values(19,21,2023, 2.3, 21, 'Ariel Atkins', 'Washington Mystics');
insert into playersStats values(19,21,2023, 2.7, 19, 'Elena Delle Donne', 'Washington Mystics');
insert into playersStats values(19,21,2023, 2.1, 27, 'Natasha Cloud', 'Washington Mystics');
insert into playersStats values(19,21,2023, 2.6, 30, 'Queen Egbo', 'Washington Mystics');
insert into playersStats values(19,21,2023, 2.0, 17, 'Shakira Austin', 'Washington Mystics');

insert into playersStats values(14,22,2022, 2.4, 19, 'Ariel Atkins', 'Washington Mystics');
insert into playersStats values(14,22,2022, 2.5, 17, 'Elena Delle Donne', 'Washington Mystics');
insert into playersStats values(14,22,2022, 2.3, 21, 'Natasha Cloud', 'Washington Mystics');
insert into playersStats values(14,22,2022, 2.9, 28, 'Queen Egbo', 'Washington Mystics');
insert into playersStats values(14,22,2022, 2.5, 19, 'Shakira Austin', 'Washington Mystics');

insert into playersStats values(12,20,2021, 2.3, 14, 'Ariel Atkins', 'Washington Mystics');
insert into playersStats values(12,20,2021, 2.1, 20, 'Elena Delle Donne', 'Washington Mystics');
insert into playersStats values(12,20,2021, 1.9, 12, 'Natasha Cloud', 'Washington Mystics');
insert into playersStats values(12,20,2021, 2.5, 26, 'Queen Egbo', 'Washington Mystics');
insert into playersStats values(12,20,2021, 2.4, 21, 'Shakira Austin', 'Washington Mystics');

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


insert into teamStats values(
    0,
    34,
    6,
    92.8,
    80.3,
    1,
    2023,
    'Las Vegas Aces');

insert into teamStats values(
    0,
    26,
    10,
    90.4,
    84.1,
    1,
    2022,
    'Las Vegas Aces');

insert into teamStats values(
    0,
    24,
    8,
    89.3,
    80.2,
    3,
    2021,
    'Las Vegas Aces');



insert into teamStats values(
    0,
    32,
    8,
    89.2,
    80.6,
    2,
    2023,
    'New York Liberty');

insert into teamStats values(
    0,
    16,
    20,
    79.6,
    82,
    7,
    2022,
    'New York Liberty');

insert into teamStats values(
    0,
    12,
    20,
    78.5,
    85.5,
    8,
    2021,
    'New York Liberty');



insert into teamStats values(
    0,
    27,
    13,
    82.7,
    79.0,
    3,
    2023,
    'Connecticut Sun');

insert into teamStats values(
    0,
    25,
    11,
    85.8,
    77.8,
    3,
    2022,
    'Connecticut Sun');

insert into teamStats values(
    0,
    26,
    6,
    79.7,
    69.9,
    1,
    2021,
    'Connecticut Sun');


insert into teamStats values(
    0,
    22,
    18,
    87.9,
    84.9,
    4,
    2023,
    'Dallas Wings');

insert into teamStats values(
    0,
    18,
    18,
    82.9,
    82.8,
    6,
    2022,
    'Dallas Wings');

insert into teamStats values(
    0,
    14,
    18,
    81.1,
    81.7,
    7,
    2021,
    'Dallas Wings');


insert into teamStats values(
    0,
    19,
    21,
    82.5,
    84.0,
    5,
    2023,
    'Atlanta Dream');

insert into teamStats values(
    0,
    14,
    22,
    78.5,
    81.5,
    10,
    2022,
    'Atlanta Dream');

insert into teamStats values(
    0,
    8,
    24,
    78.7,
    84.3,
    11,
    2021,
    'Atlanta Dream');


insert into teamStats values(
    0,
    19,
    21,
    80.2,
    85.0,
    6,
    2023,
    'Minnesota Lynx');

insert into teamStats values(
    0,
    14,
    22,
    82.4,
    83.9,
    9,
    2022,
    'Minnesota Lynx');

insert into teamStats values(
    0,
    22,
    10,
    82.7,
    78.7,
    3,
    2021,
    'Minnesota Lynx');

-----------------------------------------


insert into teamStats values(
    0,
    19,
    21,
    80.5,
    80.9,
    7,
    2023,
    'Washington Mystics');

insert into teamStats values(
    0,
    22,
    14,
    80.2,
    75.9,
    5,
    2022,
    'Washington Mystics');

insert into teamStats values(
    0,
    12,
    20,
    79.8,
    83.6,
    9,
    2021,
    'Washington Mystics');



    insert into Leagues values('WNBA', 'USA', '06/05/22', '18/09/23', 'Basketball','https://cdn.ssref.net/req/202311071/tlogo/bbr/wnba/WNBA-2022.png');

    insert into matches_1 values('07/05/22','WNBA','Barclays Center');
    insert into matches_2 values('07/05/22','WNBA','Barclays Center', 'New York Liberty', '81-79');
    insert into play values('07/05/22','Barclays Center', 'Connecticut Sun', 'New York Liberty');

    insert into matches_1 values('13/05/22','WNBA','Gateway Center');
    insert into matches_2 values('13/05/22','WNBA','Gateway Center', 'Las Vegas Aces', '96-73');
    insert into play values('13/05/22','Gateway Center', 'Las Vegas Aces', 'Atlanta Dream');

    insert into matches_1 values('19/05/22','WNBA','Michelob ULTRA Arena');
    insert into matches_2 values('19/05/22','WNBA','Michelob ULTRA Arena', 'Las Vegas Aces', '93-87');
    insert into play values('19/05/22','Michelob ULTRA Arena', 'Minnesota Lynx', 'Las Vegas Aces');

    insert into matches_1 values('28/05/22','WNBA','Mohegan Sun Arena');
    insert into matches_2 values('28/05/22','WNBA','Mohegan Sun Arena', 'Connecticut Sun', '71-79');
    insert into play values('28/05/22','Mohegan Sun Arena', 'Washington Mystics', 'Connecticut Sun');