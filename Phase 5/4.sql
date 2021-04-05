select to_char(m.id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity, 
(CASE WHEN tp.id is null THEN 0 ELSE 1 END) as added 
from music m 
left join top_music tp 
on m.id=tp.id 
order by m.id desc
