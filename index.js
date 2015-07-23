var express = require("express");
var app = express();

app.get("/", function (req, res) {
    res.end("Hello, World!");
});

var server = app.listen(Number(process.env.PORT) || 8080, function () {
    console.log("Server listening to http://localhost:%d", server.address().port);
});
