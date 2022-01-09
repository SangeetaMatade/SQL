--  To wirte a query for songs
      
      -- Songs_Details         DATA TYPES
          -- Id               ---- int                  -- primary key
          -- Name             ----varchar(30)           --- NOT NULL
	      -- Singer           ----varchar(30)           --- NOTNULL
          -- duration         ----Time
          -- gener            ----varchar(20)
          -- alubm            ----varchar(20)
          -- likes            ----int
          -- platfrom         -----varchar(20)           ---default value
          -- price            -----float                 --- check
          -- lang             -----varchar(10)
          
create database songs;
  
  use songs;
  
create table songs_details(
id int primary key,
name varchar(30) not null,
singer varchar(30) not null,
duration time,
gener varchar(30),
alubm varchar(30) unique,
likes int,
platfrom varchar(30) default'Youtube',
price float check(price>0 and price<1000),
lang varchar(30)
-- primary key (id)
);

desc songs_details;

insert into songs_details value(1,'Binding lights','The weelend','00:05:10','Rock','After Hours',15000,'Apple Music',150,'English');
insert into songs_details value(2,'Closer','Chain Smoker','00:04:50','Melody','Closer',16000,'Apple Music',100,'English');
insert into songs_details value(3,'Kusu Kusu','KD','00:03:50','Rokk','Saithy Meva Jaythe',10000,'Youtube',150,'Hindi');
insert into songs_details value(4,'Alone','Alone Walker','00:05:20','Sad','Walker',12000,'Jio Song',100,'Hindi');
insert into songs_details value(5,'Unforgetable','French Montian','00:04:00','Rap','Jungle Rules',16000,'Ganna',118,'English');
insert into songs_details value(6,'Chutu chutu','Arjun','00:04:10','Rock','Rambo',11500,'Jio Song',955,'Kannada');
insert into songs_details value(7,' Mari kannu','Upendra','00:03:50','Rock','A',16000,'Jio songs',550,'Kannada');

select*from songs_details ;

select*from songs_details where name='Kusu Kusu';

select*from songs_details where platfrom='Jio songs';
select*from songs_details where platfrom='Jio songs'and price<600;
  
select*from songs_details where lang='English'or 'Kannada';

select*from songs_details where lang  != 'Kannada';

select name,singer from songs_details;
select*from songs_details where singer='The Weekend'or singer='Chain Somker' or singer='Alone Walker';

select*from songs_details where singer in('The weelend','Alone Walker','Ayyappa');

select*from songs_details where likes>10000 and likes<15000;


select*from songs_details where likes between 10000 and 30000;


select distinct lang,name,likes from songs_details;

select*from songs_details order by name desc;

insert into songs_details(id,name,singer,likes,price,lang) 
value(8,'Ayyappa Reddy','teju',14000,180,'Kannada');

 select*from songs_details where gener is null;
 
select*from songs_details where alubm is  not null;
  
select*from songs_details where alubm or name is not null;

delete from songs_details where id=4 and name='Alone';


 select*from songs_details where id=3;
 select*from songs_details limit 5;
 
 select*from songs_details order by id desc limit 5;
 
 select*from songs_details where name = 'Belive';
     
     
     -- wild card operation
      -- 1. % - zero or more character.
      -- 2. _ - only one character.
         -- i knows only character that we use the _ this one 
      -- 3. % ending with the words
      -- 4. % midel% with the words
      
 
select*from songs_details where name like'Kusu Kusu%';
select*from songs_details where singer like 'teju%';
select*from songs_details where name like '%chutu';
select*from songs_details where alubm like '%Closer';
select*from songs_details where alubm like '%Meva%';
select*from songs_details where  duration like'00:04:50%';
select*from songs_details where name like 'C_o%';
select*from songs_details where likes like '16_00%';
select*from songs_details where gener like'R_c_%';




  -- Alisa
   -- columns
   -- table 
   
    -- key word called as AS change the columns names
    -- 
select name as songs_names  from songs_details;
select name,singer,alubm from songs_details;

-- aggregate Functions
  -- 1. MAX(COLUMN)- to find the max value from the given column.
  -- 2. min(column) - to find the min value from the given column.
  -- 3. sum(column) to find the sum of all values from the given column.
  -- 4. avg(column) - to find the avg value from the given column
  -- 5. count(column)- to find the count of rows from the given column and it will ignore null values.
  -- 6 count(*)-
  -- 7 count(distinct column)
  
  -- highest likes from the given column
   select max(likes) as Highest_likes_for_song from songs_details;
   
select max(price) as Highest_price_for_song from songs_details;
select min(price) as lowest_price_for_song  from songs_details ;
 select min(likes) as lowerst_likes_for_song from songs_details;
    
    -- how to find both column in at time 
select max(price) as Highest_price_for_song , max(likes) as Highest_likes_for_song from songs_details;
    
    -- sum of price songs
    select sum(price) as Total_Songs_price from songs_details;
    
     select sum(likes) as Total_Songs_likes from songs_details;
     -- find the avage price and likes
    select avg(price) as Total_Songs_price,avg(likes) as Total_Songs_likes from songs_details;
    
 -- number of songs in song details tables by alubm
 select count(alubm)as Total_Of_Alubm from songs_details;
   
 select count(*)as Total_Of_Alubm from songs_details;
-- select*from songs_details ;

     -- No_Of_Songs_In_English
select count(*) as No_Of_Songs_In_English from songs_details where lang='English';

-- No_of_lang_in_songs
select distinct lang from songs_details;
select count(distinct lang) from songs_details;


-- Date and time function
-- CURDATE() - it will return the Present date
-- curtime() - it will return the Present time 
-- now() -it will return the Present time  and date Present
-- DATE() - it will extract the only date from given datetime.
-- Time() - it will extract the only time from given datetime
-- Year(datetime) - it will extract the only year from given datetime
-- month(datetime)- it will extract the only month from given datetime.
-- monthName(datetime) -  it will extract the only monthName from given datetime.
-- dayName(datetime)   - it will extract the only dayName from given datetime.
-- minute (datetime)  --it will extract the only Minutes from given datetime.


            -- get current date
select curdate() as Present_Date;
      -- get current time
select curtime() as Present_Time;
   -- get both date and time
select now() as Present_Date_time;
alter table songs_details add column released_date_time datetime;
select*from songs_details;
update songs_details set released_date_time='2019-11-12 20:10:01' where id=7;
-- update songs_details set released_date_time=now() where id>1;


  -- released date from songs
  select name,date(released_date_time) as Released_Date from songs_details;
    -- released time from songs
select name,time(released_date_time) as Released_time from songs_details;

-- release year
select name,year(released_date_time) as Released_year from songs_details;

   -- release month
   
        select name,month(released_date_time) as Released_month from songs_details;
        
        -- release monthName
        select name,monthname(released_date_time) as Released_monthname from songs_details;  
          
     -- dayName
select name,dayname(released_date_time) as Released_dayname from songs_details; 
            
            -- minute
select name,minute(duration) as Released_minute from songs_details;
-- get the no of songs in year 2021 / select count(name)as no_of_songs from songs_details,year(released_dateTime)from songs_details where year(released_dateTime)=2021;
select count(name)as no_of_songs,year(released_dateTime)from songs_details where year(released_dateTime)=2021;
select count(name)as no_of_songs,YEAR(released_dateTime)from songs_details group by year(released_dateTime);
                   select*from songs_details ;
  select count(name)as no_of_songs,lang from songs_details group by lang;     
   select count(name)as no_of_songs,lang from songs_details where lang ='english';
   select count(name)as no_of_songs,platfrom from songs_details group by platfrom;
   select max(likes)as highest_likes,lang from songs_details group by lang;
   select max(likes)as highest_likes,singer from songs_details group by singer;
    select min(likes)as lowest_likes,singer from songs_details group by singer;
    select min(likes)as lowest_likes,lang from songs_details group by lang;
     select count(name)as no_of_songs,singer, year(released_datetime)as year from songs_details group by singer, year;
   select sum(likes)as total_likes,singer from songs_details group by singer;
   select sum(price)as total_likes,platfrom from songs_details group by platfrom;
    select avg(likes)as average_likes,singer from songs_details group by singer;
     select avg(price)as average_price,platfrom from songs_details group by platfrom;
     select avg(price)as average_price,platfrom from songs_details group by platfrom;
     select avg(likes)as average_likes,singer from songs_details where singer in('The weelend','KD')group by singer;
     select avg(likes)as average_likes,genre from songs_details where genre in('The weelend','KD')group by singer;
    select count(name)as no_of_songs from songs_details group by gener having no_of_songs>3;
     select count(name)as no_of_songs from songs_details group by gener having no_of_songs>1;
    
   
   
  
                   