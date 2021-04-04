const oracledb = require('oracledb');
const dbConfig = require('./dbconfig.js');

async function all_musics() 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		const result = await connection.execute('SELECT to_char(id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity FROM music');
		console.log(`query: SELECT to_char(id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity FROM music`);
		console.log(result)
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function test() 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});
		//const result = await connection.execute('select * from top_music');
		const result = await connection.execute('select to_char(m.id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity, (CASE WHEN tp.id is null THEN 0 ELSE 1 END) as added from music m left join top_music tp on m.id=tp.id order by m.id desc');
		console.log(result)
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function all_music(id) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log(`query: SELECT to_char(id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity FROM music  WHERE id=${id}`);
		const result = await connection.execute(`SELECT to_char(id) as id, to_char(year) as year, name, artist, to_char(popularity) popularity FROM music  WHERE id=${id}`);
		console.log(result)
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function artists_music(name) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log(`SELECT name, album FROM music WHERE artist like \'%${name}%\'`);
		const result = await connection.execute(`SELECT name, artist FROM music WHERE artist like \'%${name}%\'`);
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}


async function years_music(first,second) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log(`SELECT name, album FROM music`);
		const result = await connection.execute(`SELECT name, to_char(year) year FROM music where year between ${first} and ${second}`);
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function user_music(id) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log(`select u.f_name, m.name, to_char(m.id) as id, to_char(m.year) as year, m.artist, to_char(m.popularity) popularity from users_music um join music m on um.music_id = m.id join users u on u.id = um.users_id where um.users_id=${id};`);
		const result = await connection.execute(`select u.f_name, m.name, to_char(m.id) as id, to_char(m.year) as year, m.artist, to_char(m.popularity) popularity from users_music um join music m on um.music_id = m.id join users u on u.id = um.users_id where um.users_id=${id}`);
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function user_musics(id) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log(`select m.name, m.artist, u.id, (CASE WHEN u.id is null THEN 0 ELSE 1 END) from music m join users_music um on um.music_id = m.id join users u on u.id = um.users_id`);
		const result = await connection.execute(`select m.name, m.artist, u.id, (CASE WHEN u.id is null THEN 0 ELSE 1 END) as added from music m left join users_music um on um.music_id = m.id left join users u on u.id = um.users_id`);
		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}



async function registration(name,surname,pass) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		console.log('insert user');
		await connection.execute(`insert into users(f_name, l_name, pass) values(${name},${surname}',${pass})`);
		if(connection){
			try{
				await connection.close();
				return  'inserted';
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}

async function albums_songs(m_name,artist) 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});
		console.log('select m1.name from music m1 where m1.year in (select m2.year from music m2 where m2.name='+m_name + 'and m2.artist=' + artist+')');
		const result = await connection.execute('select m1.name from music m1 where m1.year in (select m2.year from music m2 where m2.name=\''+m_name + '\' and m2.artist=\'' + artist+'\')');

		if(connection){
			try{
				await connection.close();
				return  result;
			}catch(err){
				console.error(err)
			}
		}	
		
	}catch(err){
		if(connection){
			try{
				await connection.close();
			}catch(err){
				console.error(err)
			}
		}
		console.error(err);
	}
}


//9
// SELECT name, album FROM music WHERE artist = 'IK';
//5
// select name, artist, album from music where name like 'query';
//6
// select u.name, m.name, m.album, m.artist  from users_music um join music m on um.music_id = m.id join users u on u.id = um.user_id where um.user_id = 3;
//7
// SELECT name, singer, album from music where year between 2009 and 2015;
//8
// select m1.name from music m1 where m1.year = (select m2.year from music m2 where m2.name = '5000'  and m2.artist='IK');
//
module.exports = {all_music : all_music, 
	artists_music : artists_music, 
	years_music : years_music, 
	all_musics : all_musics, 
	user_music : user_music, 
	registration : registration, 
	albums_songs : albums_songs, 
	user_musics : user_musics,
	test:test}