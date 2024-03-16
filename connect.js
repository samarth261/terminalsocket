
// open a websocket given the port on localhost
var ws = new WebSocket("ws://localhost:8080");

// Generate the http response that is expected by websocket for successful connection
ws.onopen = function() {
  ws.send("Hello, world");
};


