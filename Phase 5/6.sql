select u.name, m.name, m.album, m.artist 
from users_music um 
join music m on um.music_id = m.id
join users u on u.id = um.user_id
where um.user_id = 3;
