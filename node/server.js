var http = require("http"); 
var fs = require("fs");
var os = require("os");
var ip = require("ip");
var process = require("process");

var server = http.createServer(function(req, res){
    if(req.url === "/") {
        fs.readFile("./public/index.html","UTF-8",function(err, body){
            res.writeHead(200, {"Content-Type":"text/html"}); 
            res.end(body);
        });
    }

    else if(req.url.match("/sysinfo")){

var totalSeconds = (process.uptime());
var totalMinutes = (totalSeconds / 60);
var totalHours = (totalMinutes / 60);
var totalDays = (totalHours / 24);
var seconds = totalSeconds;
var minutes = totalMinutes;
var hours =  totalHours;
var days = totalDays;

if(hours >= 24){
    hours = (parseInt(hours) - (parseInt(totalDays) * 24))

};
if(minutes >= 60){
    minutes = (parseInt(minutes) - (parseInt(totalHours) * 60))

};

if(seconds >= 60){
    seconds = (parseInt(seconds) - (parseInt(totalMinutes) * 60))
};


        myHostName=os.hostname();
        numberCPU=os.cpus().length;
        freeMemory=os.freemem()/1024;
        totalMemory=os.totalmem()/1024;
        upTime= "Days: " + parseInt(days) +", Hours: " + parseInt(hours) +", Minutes: " + parseInt(minutes) +", Seconds: " + parseInt(seconds);
        html=`t
        <!DOCTYPE html>
        <html>
         <head> 
         <title> System Info </title>
         </head>
         <body>
         <p>Hostname: ${myHostName}</p>
         <p>IP: ${ip.address()}</p>
         <p>Server Uptime: ${upTime}</p>
         <p>Total Memory: ${totalMemory} MB</p>
         <p>Free Memory: ${freeMemory} MB</p>
         <p>Number of CPUs: ${numberCPU}</p>
         </body>
         </html>
        `
        res.writeHead(200, {"Content-Type":"text/html"});
        res.end(html);

    }

    else {
        res.writeHead(404, {"Content-Type":"text/plain"});
        res.end(`404 File Not Found at ${req.url}`); 
    }
});

server.listen(3000); 
console.log("Server listening on port 3000"); 