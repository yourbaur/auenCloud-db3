select u.f_name, m.name, m.artist 
from users_music um 
join music m on um.music_id = m.id
join users u on u.id = um.users_id
where um.users_id = 21;
