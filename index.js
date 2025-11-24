module.exports = async (req, res) => {
  const { id, jobid, server } = req.query;
  const jobId = id || jobid || server;

  if (!jobId) {
    res.setHeader('Content-Type', 'text/html');
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox_1 Redirect</title>
        <style>body{background:#1a1a1a;color:white;font-family:Arial;text-align:center;padding:50px;}</style>
      </head>
      <body>
        <h1>Zyrnox_1 Redirect Service</h1>
        <p>Add ?id=JOB_ID to the URL</p>
      </body>
      </html>
    `);
  }

  // LIENS ROBLOX DIRECTS QUI MARCHENT
  const robloxUrls = [
    `https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=${jobId}`,
    `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobId}`,
    `roblox://experiences/start?placeId=142823291&gameInstanceId=${jobId}`
  ];

  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting to MM2 Server...</title>
        <style>
            body {
                background: #1a1a1a;
                color: white;
                font-family: Arial;
                text-align: center;
                padding: 50px;
            }
            .link {
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
        <p>JobId: <strong>${jobId}</strong></p>
        
        <a href="${robloxUrls[0]}" class="link">🔗 Join via Roblox Link 1</a>
        <a href="${robloxUrls[1]}" class="link">🔗 Join via Roblox Link 2</a>
        
        <p>Or copy this for direct join:</p>
        <code style="background:#2d2d2d;padding:10px;display:block;margin:10px;">${robloxUrls[2]}</code>
        
        <script>
            // Essayer la redirection automatique
            setTimeout(() => {
                window.location.href = "${robloxUrls[0]}";
            }, 1000);
        </script>
    </body>
    </html>
  `);
};