module.exports = async (req, res) => {
  const { id } = req.query;
  
  if (!id) {
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox Ultimate - Redirect</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            background: #0a0a0a;
            color: #ffffff;
            font-family: 'Courier New', monospace;
            text-align: center;
            padding: 50px;
            margin: 0;
          }
          .container {
            background: #1a1a1a;
            border: 2px solid #ff0000;
            border-radius: 10px;
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
          }
          h1 {
            color: #ff0000;
            margin-bottom: 20px;
          }
          .info {
            background: #2a2a2a;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>ZYRNOX ULTIMATE</h1>
          <div class="info">
            <p>Professional MM2 Server Redirect</p>
            <p>Add ?id=JOB_ID to URL</p>
          </div>
          <p>Advanced server hijacking system</p>
        </div>
      </body>
      </html>
    `);
  }

  const robloxUrl = 'https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=' + id;
  
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
    </head>
    <body>
        <script>window.location.href="${robloxUrl}"</script>
    </body>
    </html>
  `);
};