var app = require('express')(); 
var http = require('http').Server(app);
var io = require('socket.io')(http);
var mysql = require('mysql');
const importer = require('node-mysql-importer');
const readline = require('readline');
var myParser = require("body-parser");
// db section
var DBconn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '11111111',
    database : 'db'
});
var name;
var pass;
var id;

DBconn.connect(function (err) {});

function GetPasswordOfCertainMail(Email, callback) {
   
    DBconn.query('SELECT password FROM players where email =?', Email, function (err , rows) {
        if (err) { throw err; }
          callback(null,rows);           
        });
};
function LikePost(PlayerID, post_id, callback) {
    
    DBconn.query('UPDATE  broadcast set number_of_likes=number_of_likes+1 where player_id =? and id=?', [PlayerID, post_id], function (err , rows) {
        if (err) { throw err; }

                    
    });
    DBconn.query('select number_of_likes from broadcast where id=? ', post_id, function (erorr, res) {
        if (erorr) throw erorr;
        callback(null,res);

    });
   
};
function DisLikePost(PlayerID, post_id, callback) {
    
    DBconn.query('UPDATE  broadcast set number_of_dislikes=number_of_dislikes+1 where player_id =? and id=?', [PlayerID, post_id], function (err , rows) {
        if (err) { throw err; }
                    
    });
    
    DBconn.query('select number_of_dislikes from broadcast where id=? ', post_id, function (erorr, res) { callback(null, res); });
    
};
//CommentOnPost(1,36,'donnnnne', function (err, rows) { console.log(rows);});
function  CommentOnPost(playerID, post_id, Comment, callback) {
    
    var record = { player_id : playerID, base_broadcast_id: post_id , data: Comment };
    DBconn.query('INSERT INTO  broadcast SET ?', record, function (err, result) {
        if (err) throw err;
        
    });
    
    DBconn.query('select count(base_broadcast_id) from broadcast where id=? ', post_id, function (erorr, res) { callback(null,res); });
    
};
function PostMewBroadcast(playerid , playerName , post_data , callback) {
    var record = { player_id : playerid, user_name: playerName, data: post_data };
    DBconn.query('insert into broadcast SET ? ', record, function (err, res) {
        if (err) console.log("error");
    });
    DBconn.query('select id from broadcast where user_name=?', playerName, function (error, res) {
        callback(null,res);
    });
    
    
};
function Getnotification(playerID, NotificationCount, callback) {
    
    DBconn.query('SELECT notifications FROM players where id=? limit ' + NotificationCount, playerID, function (err , records) {
        if (err) console.log('error');
        
        callback(null,records);
       
    });

};  
function selectBroadcast(playerid , postsCount, callback) {
    
    DBconn.query('SELECT * FROM broadcast where player_id=?  limit '+ postsCount, playerid, function (err , records) {
        if (err) console.log('error');
        
        callback(null,records);
    });
};         
function process_login(playerName , password , callback) {
    
    var check = false;
    DBconn.query('SELECT id  FROM players where user_name=? and password=?' , [playerName , password] , function (err , rows) {
        
        if (err) { throw err; }

           if (rows.length > 0 ) 
		   {  _id = rows[0]['id'] ; callback({'login_result':true , 'id':_id}); 
console.log(_id + 'login_true'); 
}
             else 
			 {callback( {'login_result':false , 'id':-1}); 
console.log('login_false'); 
}
        
    });
  
    
};
function process_register(_playerName , _mail , _password , _nationality , _Birthdate , callback) {
    var check = false;
    DBconn.query('SELECT id  FROM players where user_name=? and password=?' , [_playerName , _password] , function (err , rows) {
        
        if (err) { throw err; }
        
        if (rows.length > 0) {
            _id = rows[0]['id']; callback({ register_result: false , id: _id });
            console.log(_id + 'register_false');
        }
        else {
            var record = { user_name: _playerName, password: _password, nationality : _nationality , birthdate : _Birthdate  ,email : _mail  };
            DBconn.query('INSERT INTO players SET ?' , record , function (err, res) {
                if (err) throw err;
               
                 
                console.log('register_true');
            });//db end 
			_id = '-1';
            get_id_from_name(_playerName , function (id) { _id = id  ; callback({ register_result: true , id: _id  }); }); 
                
        }
        
    });
   
    
};                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             


function get_id_from_name(playerName , callback){
    DBconn.query('SELECT id from players where user_name=?', playerName , function (erorr, res) {
        if (erorr) throw erorr;
        if (res.length > 0)
            callback(res[0]['id']);
        else
            callback('not found'); 
    });
}
//testing register  // check data formatting in js documentation online https://stackoverflow.com/questions/5129624/convert-js-date-time-to-mysql-datetime
//process_register("mada1", "mohedsh@gmail.com", "0000", 'egyptian', new Date( ).toISOString().slice(0, 19).replace('T', ' ') , function (res) { console.log(res); } ); 

//server and protocols
app.get('/', function(req, res){
  res.sendfile('index.html');
});

io.on('connection', function(socket){
	console.log("a user connected");


  socket.on('getPassword' , function(data){
  	var par = data['parameters'];
  	var mail = par['email'];
 	 	GetPasswordOfCertainMail(mail , function(rows){
 	 	io.sockets.emit('returnPassword' , {password:rows , description:"password retrieved"});
 });
 	 	});
 	 

  socket.on('likePost' , function(data){
  	  	var par = data['parameters'];
	var playerid = par['playerid'];
	var broadcast_id= par['Post_id'];
	LikePost(playerid , broadcast_id , function(res){
		io.sockets.emit('likePostResponse' , {description:'post liked' , no_of_likes:res});
      
	});
});

   socket.on('addNewPost' ,  function(data){
   	  	var par = data['parameters'];
 	var post_data = par['post'];
 	var playerid = par['playerid'] ;
 	var playerName =par ['PlayerName ']; 
 	PostMewBroadcast(playerid , playerName , post_data ,function(res){
 		 	io.sockets.emit('newPostResponse' , {description : 'new post added'  , post:res});
 	});
 });
 

  socket.on('posts' , function(data){
  	  	var par = data['parameters'];
  	var playerid = par['playerid'];
  	var count = par ['postsCount'];
  	selectBroadcast(playerid , count , function(records){
   io.sockets.emit('postsResponse' , {description : 'posts retrieved' , posts:records});
  	});
 });

socket.on('dislikePost' , function(data){
	  	var par = data['parameters'];
	var playerid = par['playerid'];
	var broadcast_id= par['Post_id'];
	DisLikePost(playerid , broadcast_id , function(res){
		io.sockets.emit('dislikePostResponse' , {description:'post disliked' , no_of_dislikes:res});
});
});

 socket.on('notification' , function(data){
 	  	var par = data['parameters'];
 	var count = par['Count'];
 	var playerid = par['playerid'];
 	Getnotification(playerid , count , function(records){
io.sockets.emit('notificationResponse' , {description : 'notifications retrieved ' , notify : records});
 	});
 });


 socket.on('saveUserContact' , function(data){
 	  	var par = data['parameters'];
 	var name = par['Name'];
 	var mail = par['email'];
 	var pass = par['Password'];
 	var nation = par ['Nationality'];
 	var birth = par['Birthdate'];
 	process_register(name , mail , pass , nation , birth , function(res){
 		io.sockets.emit('registerResponse' , res );
 	});

 });

 socket.on('checkDataLogIn' , function(data){
  	  	var par = data['parameters'];
 	var name = par['name'];
 	var password = par['Password'];
        process_login(name , password , function (res){
            res['description'] = 'login info'; 
			console.log(res); 
 	io.sockets.emit('loginResponse' ,res  );
 });
 });

  socket.on('commentPost' , function(data){
  	  	var par = data['parameters'];
	var playerid = par['playerid'];
	var broadcast_id= par['Post_id'];
	var comment = par['Comment_text'];
	CommentOnPost(playerid , broadcast_id , comment , function(res){
		io.sockets.emit('commentPostResponse' , {description:'comment posted' , no_of_comments:res});
	});
});


 socket.on('disconnect', function () {
	         console.log("a user disconnected")
	     });
             });
 /*process_login('lala' , '312' , function (res){
            res['description'] = 'login info'; 
 console.log(res); });*/
 

http.listen(5000 ,'0.0.0.0' , function(){
  console.log('listening on :5000');
});