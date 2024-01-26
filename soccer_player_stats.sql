create table playersStats(
    wins    int,
    losses  int,
    year_   int not null,
    averageRating float,
    appearances   float,
    name_         varchar(30),
    teamName     char(30),
    primary key (year_),
    foreign key (name_, teamName)
    references players 
    ON DELETE CASCADE);


grant select on playerStats to public;


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
    'Oleksandr Zinchenko'
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
    'Andrew Robertson'
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
    'Luke Shaw'
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
    'Macnhester United');
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
    'Jordi Alba'
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
    'Ferland Mendy'
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
