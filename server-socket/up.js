var mysql  = require('mysql');
var DBconn = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '11111111',
  database : 'db'
});

DBconn.connect(function(err){
  if(err){
    console.log('Database connection error');
  }else{
    console.log('Database connection successful');
  }
});

var record={row_number: 7, column_number:9 ,land_owner_id:2};
DBconn.query('INSERT INTO land SET ?' , record , function(err,res){
  if(err) throw err;

else {
  console.log('last record inserted');
}
});
DBconn.end(function(err) {
  // Function to close database connection
});