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
          <h1>⚠️ Server Redirect</h1>
          <p>Add ?id=JOB_ID to URL</p>
          <p><small>Note: Server may have expired</small></p>
        </body>
      </html>
    `);
  }

  // MULTIPLES MÉTHODES DE BYPASS
  const robloxUrls = [
    `https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=${id}&launchData=zyrnox`,
    `https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=${id}&accessCode=bypass`,
    `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${id}`,
    `roblox://experiences/start?placeId=142823291&gameInstanceId=${id}`
  ];

  res.send(`
    <html>
      <head>
        <title>Redirecting to MM2...</title>
        <style>
          body {
            background: #1a1a1a;
            color: white;
            font-family: Arial;
            text-align: center;
            padding: 50px;
          }
          .btn {
            display: block;
            background: #5865F2;
            color: white;
            padding: 15px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
          }
        </style>
      </head>
      <body>
        <h1>🎮 Joining MM2 Server...</h1>
        <p>JobId: <strong>${id}</strong></p>
        <p>If server expired, try different methods:</p>
        
        <a href="${robloxUrls[0]}" class="btn">Method 1 - Standard Join</a>
        <a href="${robloxUrls[1]}" class="btn">Method 2 - Bypass Join</a>
        <a href="${robloxUrls[2]}" class="btn">Method 3 - Alternative Link</a>
        
        <script>
          // Essayer la méthode 1 d'abord
          setTimeout(() => {
            window.location.href = "${robloxUrls[0]}";
          }, 1000);
        </script>
      </body>
    </html>
  `);
};