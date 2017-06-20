var express =   require("express");
var bodyParser =    require("body-parser");
var multer  =   require('multer');
var app = express();
var path = require('path');
var mime = require('mime');
var fs = require('fs'); 
app.use(bodyParser.json());


var storage =   multer.diskStorage({
  destination: function (req, file, callback) {
        callback(null, __dirname + '/uploads/N30E030/');
        
  },
    filename: function (req, file, callback) {
        var x = req.params.x;
        var y = req.params.y;
        var userid = req.params.userid;
        console.log("uploading file " + x + " " + y); 
        var file = "x" + x + "_y" + y + ".td";
    callback(null, file );
  }
});
var upload = multer({ storage : storage }).single('userPhoto');

app.get('/',function(req,res){
      res.sendFile(__dirname + "/trial.html");
});

app.get('/api/:userid/get/land/:x/:y', function (req, res) {
    var x = req.params.x;
    var y = req.params.y;
    var userid = req.params.userid;
    console.log("downloading file "+x+" " +y); 
    var file = __dirname + "/uploads/N30E030/x" + x + "_y" + y + ".td";
    console.log(file); 
    var filename = path.basename(file);
    var mimetype = mime.lookup(file);
    
    res.setHeader('Content-disposition', 'attachment; filename=' + filename);
    res.setHeader('Content-type', mimetype);
    
    var filestream = fs.createReadStream(file);
    filestream.pipe(res);
});

app.post('/api/:userid/post/land/:x/:y', function (req, res){
    var x = req.params.x;
    var y = req.params.y;
    console.log("1uploading file " + x + " " + y); 
    upload(req,res,function(err) {
        //console.log(req.body);
        //console.log(req.files);
        if (err) {
            console.log(err);
            return res.end("Error uploading file.");
        }
        res.end("File is uploaded");
        console.log("file is uploaded");
    });
});

app.listen(5000,function(){
    console.log("Working on port 8889");
});