var http = require('http');

var startTime;

var server = http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Uptime: ' + (Date.now() - startTime) + 'ms');
});

server.listen(3000, function () {
    startTime = Date.now();
});