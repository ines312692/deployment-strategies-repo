const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Hello from Deployment Strategies - v1');
});

app.listen(port, () => {
  console.log(`v1 app listening on port ${port}`);
});