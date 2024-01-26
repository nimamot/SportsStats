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
    primary key (leagueName));

    grant select on leagues to public;

create table sponsors(
    sponsorName    varchar(30),
    startDate      date,
    endDate        date,
    primary key(sponsorName));

grant select on sponsors to public;

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

-- Sponsors (1 for each team) (Check Date variable format)
--Arsenal
insert into Sponsors values('Emirates', '01-07-2006', '01-07-2028');
insert into sponsoredBy values('Arsenal', 'Emirates');
--Liverpool
insert into Sponsors values('Standard Chartered Bank', '01-07-2006', '01-07-2027');
insert into sponsoredBy values('Liverpool', 'Standard Chartered Bank');
--Manchester United
insert into Sponsors values('Team Viewer', '01-07-2021', '01-07-2026');
insert into sponsoredBy values('Manchester United', 'Team Viewer');
--Real Madrid
insert into Sponsors values('Adidas', '01-07-1998', '01-07-2028');
insert into sponsoredBy values('Real Madrid', 'Adidas');
--Barcelona
insert into Sponsors values('Nike', '01-07-1998', '01-07-2028');
insert into sponsoredBy values('Barcelona', 'Nike');

-- Sports
insert into Sports values('Football (Soccer)', 3500000000, 'https://www.soccerbible.com/media/115095/ucl-1-min.jpg');

-- -- leagues from the 22/23 soccer seasons'
insert into Leagues values('Premier League', 'England', '06/08/22', '28/05/23', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png');
insert into Leagues values('La Liga', 'Spain', '12/08/22', '04/06/23', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/LaLiga.svg/2560px-LaLiga.svg.png');


-- -- teams from the 22/23 Premier League season (Might keep 3 in total)

insert into Teams values('Arsenal', 'London, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg');
insert into Teams values('Liverpool', 'Liverpool, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg');
insert into Teams values('Manchester United', 'Manchester, England', 'Premier League', 'https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg');
-- -- insert into Teams values('Chelsea', 'London, England', 'Premier League');
-- insert into Teams values('Manchester City', 'Manchester, England', 'Premier League');

-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg' WHERE TeamName='Arsenal';
-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg' WHERE TeamName='Liverpool';
-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg' WHERE TeamName='Manchester United';
-- -- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/c/cc/Chelsea_FC.svg' WHERE TeamName='Chelsea';
-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg' WHERE TeamName='Manchester City';


-- -- teams from the 22/23 LaLiga season (Might keep 3 in total)

insert into Teams values('Atletico Madrid', 'Madrid, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/f/f4/Atletico_Madrid_2017_logo.svg');
insert into Teams values('Barcelona', 'Barcelona, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg');
insert into Teams values('Real Madrid', 'Madrid, Spain', 'La Liga', 'https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg');

-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/f/f4/Atletico_Madrid_2017_logo.svg' WHERE TeamName='Atlético Madrid';
-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg' WHERE TeamName='Barcelona';
-- UPDATE Teams SET picture = 'https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg' WHERE TeamName='Real Madrid';


ALTER TABLE Teams ADD picture char(200);


