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


-- insert into sportPeople values('American', 'Harrison Barnes', '30/05/92', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/barneha02.jpg');
-- insert into players values('American', 'Harrison Barnes', '30/05/92','Sacramento Kings',' Power Forward and Small Forward', 40);

-- insert into sportPeople values('American', 'Deonte Burton', '31/01/94', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/burtode02.jpg');
-- insert into players values('American', 'Deonte Burton', '31/01/94','Sacramento Kings',' Power/Small Forward, Shooting Guard', 23);

-- insert into sportPeople values('American', 'Terence B. Davis II', '16/05/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/daviste02.jpg');
-- insert into players values('American', 'Terence B. Davis II', '16/05/97','Sacramento Kings',  'Shooting Guard', 3);

-- insert into sportPeople values('Australian', ' Matthew Dellavedova ', '08/09/90', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/dellama01.jpg');
-- insert into players values('Australian', ' Matthew Dellavedova ', '08/09/90','Sacramento Kings',' Point Guard and Shooting Guard', 8);

-- insert into sportPeople values('American', 'Perry Dozier Jr.', '25/10/96', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/doziepj01.jpg');
-- insert into players values('American', 'Perry Dozier Jr.', '25/10/96','Sacramento Kings','  Shooting/Point Guard, Small Forward', 35);

-- insert into sportPeople values('American', 'Kessler Donovan Edwards', '09/08/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/edwarke02.jpg');
-- insert into players values('American', 'Kessler Donovan Edwards', '09/08/00','Sacramento Kings','  Small Forward', 14);

-- insert into sportPeople values('American', 'Keon Tyrese Ellis', '08/01/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/elliske01.jpg');
-- insert into players values('American', 'Keon Tyrese Ellis', '08/01/00','Sacramento Kings','Shooting Guard ', 23);

-- insert into sportPeople values('American', 'DeAaron Martez Fox', '20/12/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/foxde01.jpg');
-- insert into players values('American', 'DeAaron Martez Fox', '20/12/97','Sacramento Kings','Point Guard', 5);

-- insert into sportPeople values('American', 'Richaun Diante Holmes', '15/10/93', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/holmeri01.jpg');
-- insert into players values('American', 'Richaun Diante Holmes', '15/10/93','Sacramento Kings','Center and Power Forward', 22);

-- insert into sportPeople values('American', 'Kevin Huerter', '27/08/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/huertke01.jpg');
-- insert into players values('American', 'Kevin Huerter', '27/08/98','Sacramento Kings','Shooting Guard and Small Forward', 9);


-- insert into sportPeople values('Ukrainian', 'Oleksiy (Alex) Len', '16/06/93', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/lenal01.jpg');
-- insert into players values('Ukrainian', 'Oleksiy (Alex) Len', '16/06/93','Sacramento Kings','Center', 27);

-- insert into sportPeople values('Canadian', 'Trey Anthony Lyles', '11/05/95', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/lylestr01.jpg');
-- insert into players values('Canadian', 'Trey Anthony Lyles', '11/05/95','Sacramento Kings','Power Forward', 41);

-- insert into sportPeople values('American', 'Chimezie Chukwudum Metu', '22/03/97', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/metuch01.jpg');
-- insert into players values('American', 'Chimezie Chukwudum Metu', '22/03/97','Sacramento Kings','Shooting Guard and Small Forward', 7);

-- insert into sportPeople values('American', 'Davion DeMonte Earl Mitchell', '05/09/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/mitchda01.jpg');
-- insert into players values('American', 'Davion DeMonte Earl Mitchell', '05/09/98','Sacramento Kings','Shooting Guard and Small Forward', 15);

-- insert into sportPeople values('Nigerian', 'Chima Moneke', '24/12/95', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/monekch01.jpg');
-- insert into players values('Nigerian', 'Chima Moneke', '24/12/95','Sacramento Kings','Small Forward', 19);

-- insert into sportPeople values('American', 'Malik Ahmad Monk', '04/02/98', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/monkma01.jpg');
-- insert into players values('American', 'Malik Ahmad Monk', '04/02/98','Sacramento Kings','Shooting Guard', 0);

-- insert into sportPeople values('American', 'Keegan Mitchell Murray', '19/08/00', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/murrake02.jpg');
-- insert into players values('American', 'Keegan Mitchell Murray', '19/08/00','Sacramento Kings','Small Forward', 13);

-- insert into sportPeople values('American', 'Chikezie Okpala', '28/04/99', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/okpalkz01.jpg');
-- insert into players values('American', 'Chikezie Okpala', '28/04/99','Sacramento Kings','Power Forward', 30);

-- insert into sportPeople values('Portuguese', 'Neemias Esdras Barbosa Queta', '13/07/99', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/mitchda01.jpg');
-- insert into players values('Portuguese', 'Neemias Esdras Barbosa Queta', '13/07/99','Sacramento Kings','Center', 88);

-- insert into sportPeople values('American', 'Domantas Sabonis', '03/05/96', 'Sacramento Kings', 'https://www.basketball-reference.com/req/202106291/images/headshots/sabondo01.jpg');
-- insert into players values('American', 'Domantas Sabonis', '03/05/96','Sacramento Kings','Power Forward and Center', 10);
