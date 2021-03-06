create table users(
id number(10), 
f_name varchar2(50),
l_name varchar2(50),
r_date DATE,
pass varchar2(50)
); 

create table manage_users(
id number(10),
o_username varchar2(50),
n_username varchar2(50),
l_in_playlist date 
);

create table music(
id number(10),
danceability number(10),
energy number(10),
valence number(10),
popularity number(10), 
loudness number(10),
year number(10),
release_date date,
name varchar2(50),
artist varchar2(50)
);

create table top_music (
id number(10),
listen_count number(10)
);

create table users_music(
users_id number(10),
music_id number(10)
);

load data 
infile ‘/data.csv’
replace 
into table music
fields terminated by ‘,’  optionally enclosed by “”
(
id,
danceability,
energy,
valence,
popularity,
loudness,
year,
release_date,
name,
artist
);


