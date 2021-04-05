Link to YouTube for a projects last version: https://www.youtube.com/watch?v=e92l-lVd_bE&t=2s

**Abstract**

Nowadays we have a different numbers of music streaming platforms, they become more user-friendly, they recommendation system become more accurate, but what is in our industry, we don’t have analogs and we think it can become a problem when we don’t service anything so in this part of industry we want to create a platform with good service, design and good recommendation system. The idea of the project is to create a good platform to listen music. The main aim is to popularize kazakh culture. I guess it is very relevant, just because we have many good artists in our country, the quality of the music is growing very high. Early, listening to kazakh music was not cool for our people, especially in the young generation. But nowadays, many things have changed, we have a large number of excellent artists on the territory of Kazakhstan, and we must support them. Mobile app can change many things, with recommendation systems, good databases and wonderful design, popularization of the kazakh music will grow, I guess 

**Aim and objectives of research**
		Aim:  To develop a database with kazakh music and prepare recommendation system algorithms for users.
		Objectives: 
  		Collect music data from different sites
		Cleaning data and fit some null data
		Upload audio to server
		Prepare database
		Develop a mobile app

**Background review**
We notice that our country doesn’t have a good mobile application that contains our kazakh music with a recommendation system. We want to solve this problem and provide for our country a wonderful platform to use. Our culture growing up, and as a software developer we must to help him realize their talents. 

**Data and results**
We found a large dataset of music form Kaggle so for testing our platform we will use it
Link to database: https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks?select=data.csv

in our project we use 5 tables: **users**, **music**, **manage_users**, **top_music**, **users_music**
**manage_users** table will store data about actions of our users: log in, log out, adding songs in playlist and etc.
**music** table contain all our music library and some features to recommendation algorithm
**users** table contain all registered users with unique id
**users_music** - table to store music that have special user, this table is combiantion of user id and music id
**top_music** table - this table is have 2 features, id of music and count how many times this music is listened. This table contains top 50 musics from music table, in music table it will given by popularity. 
![ER diagram](https://user-images.githubusercontent.com/55532407/113528797-88ca3480-95e3-11eb-9161-a05da0172eb1.png)




**Phase 4**
So here create a ER diagram that contains our decision with design of our database.
here we have at least 1 user to have musics of this user (users_music table with users table relation one to many).
and in users_music table we can have diffirent combinations of id's, many user can have many music so relation between users_music and music is many to many).
relation between users and manage users is many to many, because to manage many user you should have many actions.
top_music contains information from music so it can be 0 or more, but ot relation many to many, because we give from all music some number of them

ABOUT LOAD DATA!!!
we use loading data only in music database and we use SQLdeveloper for this so we didn't use scripts, just sqldevelopers given functionality
