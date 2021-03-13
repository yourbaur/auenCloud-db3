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
