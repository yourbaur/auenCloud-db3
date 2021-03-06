Link to database: https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv

in our project we use 5 tables: users, music, manage_users, top_music, users_music
manage_users table will store data about actions of our users: log in, log out, adding songs in playlist and etc. other tables are clear.


This is a continuation of the previous database project. Link to YouTube for an old project: https://www.youtube.com/watch?v=e92l-lVd_bE&t=2s


Phase 4
So here create a ER diagram that contains our decision with design of our database.
here we have at least 1 user to have musics of this user (users_music table with users table relation one to many).
and in the same way user can have musics, 0 or more so relation between users_music and music is also one to many).
relation between users and manage users is one to one, because to manage 1 user you should have 1 manage.
favorite music contains information from music so it can be 0 or more, but ot relation many to many, because we give from all music some number of them

