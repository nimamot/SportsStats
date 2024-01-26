create table news_1(
    title varchar(300) not null,
    author  varchar(30) not null,
    publishingDate date,
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