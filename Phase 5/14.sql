select m1.name from music m1 where m1.year = (select m2.album from music m2 where m2.name = '5000'  and m2.artist='IK')
