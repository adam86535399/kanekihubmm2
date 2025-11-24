module.exports = async (req, res) => {
  const { id } = req.query;
  
  if (!id) {
    return res.send(`
      <html>
        <head>
          <title>Zyrnox_1 Redirect</title>
          <style>
            body {
              background: #1a1a1a;
              color: white;
              font-family: Arial;
              text-align: center;
              padding: 50px;
            }
          </style>
        </head>
        <body>
          <h1>Zyrnox_1 Redirect</h1>
          <p>Add ?id=JOB_ID to URL</p>
        </body>
      </html>
    `);
  }

  const robloxUrl = 'https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=' + id;
  
  res.send(`
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