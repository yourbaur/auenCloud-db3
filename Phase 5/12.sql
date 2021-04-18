insert into top_music(id, listen_count)
select id, popularity from music fetch first 50 rows only;
