
drop table Challenges;
drop table Challengeslist;
drop table nicelist;
drop table newlist;
drop table naughtylist;

CREATE TABLE Challenges(
    ChallengeID INT,
    ChallengeName VARCHAR(50),
    Points VARCHAR(50),
    Description VARCHAR(512)
);

INSERT INTO Challenges(ChallengeID,ChallengeName,Points,Description)
values(1,'Cryptography 01','100','Befana'),
(2,'Cryptography 02','100','Belsnickel'),
(3,'Cryptography 03','100','Bob Cratchit'),
(4,'Cryptography 04','100','Hint:One of these christmas characters is used as key'),
(5,'Cryptography 05','100','George Bailey'),
(6,'Cryptography 06','100','Knecht Ruprecht'),
(7,'Cryptography 07','100','Père Fouettard'),
(8,'Cryptography 08','100','Rudolph'),
(9,'Cryptography 09','100','Santa Claus'),
(10,'Cryptography 10','100','Tiny Tim');

create table Challengeslist 
select ChallengeID, ChallengeName, Points, TO_BASE64(Description) as Description from Challenges;

drop table Challenges;
alter table Challengeslist rename to Challenges;



CREATE TABLE nicelist(
    UserID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(512)
);

INSERT INTO nicelist(UserID,FirstName,LastName,Address)
values(1, 'Kevin', 'McCallister', '671 Lincoln Ave, Winnetka, IL'), 
(2, 'Bubby', 'Hobbs', '123 Elf Road, North Pole'), 
(3, 'Kris', 'Kringle', '123 cherry lane'),
(4,'Adam', 'Allan', '2 Brickyard Street'),
(5,'Adrian', 'Alsop', 'Miami Beach, FL 33139'),
(6,'Alan', 'Anderson', '550 Pleasant Rd.'),
(7,'Alexander', 'Arnold', 'Piqua, OH 45356'),
(8,'Rebecca', 'Avery', '7474 Grand Ave.'),
(9,'Rose', 'Bailey', 'Barrington, IL 60010'),
(10,'Ruth', 'Baker', '594 Andover Drive'),
(11,'Sally', 'Ball', 'Natchez, MS 39120'),
(12,'Samantha', 'Bell', 'juegoctf{naughty_or_nice}'),
(13,'Sarah', 'Berry', 'Camden, NJ 08105'),
(14,'Sonia', 'Black', '47 Ridgeview Lane'),
(15,'Sophie', 'Blake', 'Mentor, OH 44060'),
(16,'Stephanie', 'Bond', '3 Kingston Street'),
(17,'Sue', 'Bower', 'Hudson, NH 03051'),
(18,'Theresa', 'Brown', '78 Sussex Ave.');        

create table newlist 
select UserID, FirstName, LastName, aes_encrypt(Address, 'Rudolph') as Address from nicelist;

drop table nicelist;
alter table newlist rename to nicelist;


create table naughtylist(
    UserID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50), 
    Address VARCHAR(512)
);

insert into naughtylist (UserID,FirstName,LastName,Address)
values(1, 'Ebenezer', 'Scrooge', '16 Bayham Street, Camden Town'),
(2, 'Ethan', 'Grinch', 'Mount Crumpit, Whoville'),
(3, 'Charles', 'Burns', '1000 Mammon Street, Springfield, OR'),
(4,'Theresa', 'Brown', '78 Sussex Ave.'),
(5,'Tracey', 'Buckland', 'Wilson, NC 27893'),
(6,'Christopher', 'Burgess', '7127 Golden Star Street'),
(7,'Colin', 'Butler', 'Wenatchee, WA 98801'),
(8,'Connor', 'Cameron', '561 Jockey Hollow Lane'),
(9,'Dan', 'Campbell', 'Racine, WI 53402'),
(10,'David', 'Carr', '9207 Joy Ridge Road'),
(11,'Dominic', 'Chapman', 'Rosemount, MN 55068'),
(12,'Dylan', 'Churchill', '51 Rocky River Street'),
(13,'Edward', 'Clark', 'Hanover Park, IL 60133'),
(14,'Eric', 'Clarkson', '9 Lafayette Dr.'),
(15,'Evan', 'Coleman', 'Southaven, MS 38671'),
(16,'Frank', 'Cornish', '747 Alton Street'),
(17,'Gavin', 'Dyer', 'Lakeland, FL 33801'),
(18,'Gordon', 'Edmunds', '45 Lookout Rd.'),
(19,'Harry', 'Ellison', 'Helotes, TX 78023'),
(20,'Ian', 'Ferguson', '7280 Front Ave.'),
(21,'Isaac', 'Fisher', 'Glendale Heights, IL 60139');

create table newlist 
select UserID, FirstName, LastName, aes_encrypt(Address, 'Rudolph') as Address from naughtylist;

drop table naughtylist;
alter table newlist rename to naughtylist;
