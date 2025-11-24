module.exports = async (req, res) => {
  const { id } = req.query;
  
  if (!id) {
    return res.send(`
      <html>
        <body style="background:black;color:white;text-align:center;padding:50px;">
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
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
      </head>
      <body style="background:black;color:white;text-align:center;padding:50px;">
        <h1>Redirecting to Roblox...</h1>
        <p>JobId: ${id}</p>
        <a href="${robloxUrl}" style="color:red;">Click here if not redirected</a>
        <script>setTimeout(() => window.location.href = "${robloxUrl}", 1000);</script>
      </body>
    </html>
  `);
};