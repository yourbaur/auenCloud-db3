select m1.name from music m1 where m1.year in (select m2.year from music m2 where m2.name = 'Oli mera paizei zaria'  and m2.artist='Giorgos Katsaros')
