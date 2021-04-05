select m.name, m.artist, u.id,
(CASE WHEN u.id is null THEN 0 ELSE 1 END)
from music m left join users_music um on um.music_id = m.id left join users u on u.id = um.users_id;
