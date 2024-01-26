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
    teamName        char(30),
    position        char(40),
    kitNum          int,
    primary key(name_, TeamName),
    foreign key(nationality, name_, birthDate) references sportPeople(nationality, name_, birthDate) ON DELETE CASCADE);

    grant select on players to public;

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

-- Premier League


insert into Teams values('Arsenal', 'London, England', 'Premier League');
insert into Teams values('Liverpool', 'Liverpool, England', 'Premier League');
insert into Teams values('Manchester United', 'Manchester, England', 'Premier League');
-- -- insert into Teams values('Chelsea', 'London, England', 'Premier League');
-- insert into Teams values('Manchester City', 'Manchester, England', 'Premier League');


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
insert into sportPeople values('Brazil', 'Gabriel Magalhães', '19/12/97', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/67ac5bb8_2022.jpg');
insert into players values('Brazil', 'Gabriel Magalhães', '19/12/97', 'Arsenal','Centre Back', 6);
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
insert into sportPeople values('Norway', 'Martin Ødegaard', '17/12/98', 'Arsenal', 'https://fbref.com/req/202302030/images/headshots/79300479_2022.jpg');
insert into players values('Norway', 'Martin Ødegaard', '17/12/98', 'Arsenal','Central Attacking Midfielder', 8);

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
insert into sportPeople values('Argentina', 'Lisandro Martínez', '18/01/98', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/bac46a10_2022.jpg');
insert into players values('Argentina', 'Lisandro Martínez', '18/01/98', 'Manchester United', 'Centre Back', 6);
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
insert into sportPeople values('Egypt', 'Antony dos Santos', '24/02/00', 'Manchester United', 'https://fbref.com/req/202302030/images/headshots/99127249_2022.jpg');
insert into players values('Egypt', 'Mohamed Salah', '15/06/92', 'Liverpool','Right Winger', 21);


-- LaLiga


-- insert into Teams values('Atlético Madrid', 'Madrid, Spain', 'La Liga');
insert into Teams values('Barcelona', 'Barcelona, Spain', 'La Liga');
insert into Teams values('Real Madrid', 'Madrid, Spain', 'La Liga');


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
insert into sportPeople values('Uruguay', 'Ronald Araújo', '03/05/93', 'Barcelona', 'https://fbref.com/req/202302030/images/headshots/2bef2bca_2022.jpg');
insert into players values('Uruguay', 'Ronald Araújo', '03/05/93', 'Barcelona','Centre Back', 4);
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