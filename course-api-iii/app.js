const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors());

app.get('/', (req, res) => {
  res.json([
    {
      "id":"1",
      "title":"TestTestTest..."
    }
  ]);
})

app.listen(4000, () => {
  console.log('listening for requests on port 4000');
})