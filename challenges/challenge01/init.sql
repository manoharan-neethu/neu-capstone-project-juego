CREATE TABLE nicelist(
    UserID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(512)
);

INSERT INTO nicelist(UserID,FirstName,LastName,Address)
VALUES(1, 'Kevin', 'McCallister', '671 Lincoln Ave, Winnetka, IL'), (2, 'Bubby', 'Hobbs', '123 Elf Road, North Pole'), (3, 'Kris', 'Kringle', '19 East 61st Street, New York, NY');        

create table newlist 
select UserID, FirstName, LastName, aes_encrypt(Address, 'Rudolph') as Address from nicelist;

drop table nicelist;

alter table newlist 
rename to nicelist;

create table naughtylist(UserID INT,FirstName VARCHAR(50),LastName VARCHAR(50), Address VARCHAR(512));

insert into naughtylist values(1, 'Ebenezer', 'Scrooge', '16 Bayham Street, Camden Town'),(2, 'Ethan', 'Grinch', 'Mount Crumpit, Whoville'),(3, 'Charles', 'Burns', 'juegoctf{eggnog}');

create table newlist select UserID, FirstName, LastName, aes_encrypt(Address, 'Rudolph') as Address from naughtylist;
drop table naughtylist;
alter table newlist rename to naughtylist;
