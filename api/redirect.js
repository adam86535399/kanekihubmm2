export default async function handler(req, res) {
  const { id } = req.query;
  
  if (!id) {
    // Page d'accueil si pas d'ID
    res.setHeader('Content-Type', 'text/html');
    return res.send(`
      <!DOCTYPE html>
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
          .container {
            background: #2d2d2d;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid red;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Zyrnox_1 Redirect Service</h1>
          <p>No server ID provided</p>
        </div>
      </body>
      </html>
    `);
  }

  // REDIRECTION VERS ROBLOX
  const robloxUrl = 'https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=' + id;
  
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting to Roblox...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
        <style>
            body {
                background: #1a1a1a;
                color: white;
                font-family: Arial;
                text-align: center;
                padding: 50px;
            }
            .container {
                background: #2d2d2d;
                padding: 30px;
                border-radius: 10px;
                border: 2px solid #00ff00;
            }
            a {
                color: #5865F2;
                text-decoration: none;
                font-weight: bold;
                background: #36393f;
                padding: 10px 20px;
                border-radius: 5px;
                display: inline-block;
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🎮 Redirecting to Roblox...</h1>
            <p>Server ID: <strong>${id}</strong></p>
            <p>You will be redirected to the MM2 server automatically.</p>
            <a href="${robloxUrl}">Click here if not redirected</a>
            <script>
                setTimeout(function() {
                    window.location.href = "${robloxUrl}";
                }, 2000);
            </script>
        </div>
    </body>
    </html>
  `);
}