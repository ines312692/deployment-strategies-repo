const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  if (Math.random() < 0.1) { // 10% error for demo
    res.status(500).send('Simulated error in v2');
  } else {
    res.send('Hello from Deployment Strategies - v2');
  }
});

app.listen(port, () => {
  console.log(`v2 app listening on port ${port}`);
});