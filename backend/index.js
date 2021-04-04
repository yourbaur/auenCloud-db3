const express = require('express')
const bodyParser = require('body-parser');
const oracledb = require('oracledb');
const dbConfig = require('./dbconfig.js');
const fs = require('fs')
const router = express.Router();
const queries = require('./queries.js')
var app = express();

app.use(bodyParser.json())

const songs = [
	{id: 1, singer:'Lady Gaga',song:'pocker face'},
	{id: 2, singer:'Lady Gaga',song:'guy'},
	{id: 3, singer:'Ирина Кайратовна',song:'Молодежь'},
	{id: 4, singer:'Скриптонит',song:'Это любовь'}
];


async function r() 
{	let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		const result = await connection.execute('select * from dual');
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





app.get('/',(req,res)=>{
	res.send();
});

app.get('/api/songs', async(req,res)=>{
	const re =  await queries.all_musics();

	res.send(re);
});

app.get('/api/test', async(req,res)=>{
	const re =  await queries.test();

	res.send(re);
});


app.get('/api/songs/:id',async(req,res)=>{
	const ree = await queries.all_music(req.params['id']);
	console.log(ree);
	res.send(ree);
	/*
	music = [];
	for (var i = 0; i < re.rows.length; i++) {
		if (':'+re.rows[i]['TOKEN']===req.params.token)
			music.push(re.rows[i])
	}
	if(!music) res.status(404).send('singer with this ID not found'); //404
	else
		res.send(music)
	*/
});

app.get('/api/artists/:name',async(req,res)=>{
	console.log('artist: '+req.params['name']);
	const ree = await queries.artists_music(req.params['name']);
	console.log(ree);
	res.send(ree);
});


app.get('/api/years/:first/:second',async(req,res)=>{
	let first = req.params['first'];
	let second = req.params['second'];
	console.log('artist: '+first + ' '+ second);
	const ree = await queries.years_music(first,second);
	res.send(ree);
});


app.get('/api/users/:id',async(req,res)=>{
	console.log('artist: '+req.params['id']);
	const ree = await queries.user_music(req.params['id']);
	console.log(ree);
	res.send(ree);
});

app.get('/api/registration/:name/:surname/:password', async(req,res)=>{
	console.log(req.params['name'], req.params['surname'], req.params['password']);
	const ree = await queries.registration(req.params['name'], req.params['surname'], req.params['password']);
	res.send(ree);
});


app.get('/api/albums/:music/:artist', async(req,res)=>{
	console.log('artist: '+req.params['music']);
	const ree = await queries.albums_songs(req.params['music'],req.params['artist']);
	console.log(ree);
	res.send(ree);
})


app.get('/api/users/labeled/:id',async(req,res)=>{
	console.log('artist: '+req.params['id']);
	const ree = await queries.user_musics(req.params['id']);
	console.log(ree);
	res.send(ree);
});

/*
app.get('/play/:name', function(req,res) {
  if(!req.params.name){
    return res.status(400).json({error: "requires a audio id"})
  }

  let connection;
	try{
		connection = await oracledb.getConnection({
			user:dbConfig.user,
			password:dbConfig.password,
			connectString: dbConfig.connectString
		});

		const result = await connection.execute('select * from musics');
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


  var audioIndex = audioList.findIndex(item => item.id === req.params.id)

  if(audioIndex < 0 || undefined){
    return res.status(400).json({error: "id didn't match any records"})
  }

  let file = audioList[audioIndex].path

  fs.stat(file, function(err,stats){

    var start, end;
    var total = stats.size;
    
    var range = req.headers.range;
    if(range) {
      var positions = range.replace(/bytes=/, "").split("-");
      start = parseInt(positions[0], 10);
      end = positions[1] ? parseInt(positions[1], 10) : total - 1;
    } else {
      start = 0;
      end = total - 1;
    }
    var chunksize = (end - start) + 1;

    res.writeHead(200, {
      "Content-Range": "bytes " + start + "-" + end + "/" + total,
      "Accept-Ranges": "bytes",
      "Content-Length": chunksize,
      "Content-Type": "audio/mpeg"
    });

    var stream = fs.createReadStream(file, { start: start, end: end })
      .on("open", function() {
        stream.pipe(res);
      }).on("error", function(err) {
        res.end(err);
      });
  })
})
*/

/*var ejs = require('ejs')
app.set('view engine', 'ejs')
var storage = multer.diskStorage({
    destination: function(req, file, callback) {
        callback(null, './songs')
    },
    filename: function(req, file, callback) {
        //callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
                //callback(null, file.originalname)
        rand=Date.now() + path.extname(file.originalname);

        callback(null, file.fieldname + '-' + rand);

    }

})*/
/*var upload = multer({
        storage: storage});
app.get('/api/file',function(req,res){
res.sendfile('/songs/Zhigitter_Aiqarakoz.mp3');
});
app.post('/api/file',upload.single('userFile'), function(req, res) {
    console.log(req.file);
    console.log(req.file.path);
    res.send(rand);

})*//*
app.listen(3000,function(){
console.log("working on port 3000");
});
*/





	
const port = process.env.PORT || 3000;
app.listen(3000,()=>console.log(`server start on port ${port}`))