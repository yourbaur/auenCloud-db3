insert into top_music 
select id, popularity 
from music 
order by popularity
limit 10;