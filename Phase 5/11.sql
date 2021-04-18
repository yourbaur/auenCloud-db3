select artist, count(*) as cnt from music group by artist order by cnt;
