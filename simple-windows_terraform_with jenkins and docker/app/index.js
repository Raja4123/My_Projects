const http = require('http');
const port = 3000;

const server = http.createServer((req, res) => {
  res.end('🚀 Hello from your Dockerized Node.js App!');
});

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
