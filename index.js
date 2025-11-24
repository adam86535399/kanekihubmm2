module.exports = async (req, res) => {
  const { server } = req.query;
  
  if (!server) {
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox_1 • Delta Bypass</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            background: #1a1a1a;
            color: white;
            font-family: Arial;
            text-align: center;
            padding: 50px;
            margin: 0;
          }
          .container {
            background: #2d2d2d;
            padding: 40px;
            border-radius: 15px;
            border: 3px solid #ff0000;
            max-width: 500px;
            margin: 0 auto;
          }
          h1 {
            color: #ff4444;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>⚡ Zyrnox_1 Delta Bypass</h1>
          <p>Professional MM2 Server Redirect</p>
          <p>Add <strong>?server=JOB_ID</strong> to URL</p>
          <p><small>Powered by Delta Proxy System</small></p>
        </div>
      </body>
      </html>
    `);
  }

  // Utiliser le proxy Delta pour la redirection finale
  const deltaRedirectUrl = `https://proxy-nu-fawn.vercel.app/?server=${server}`;
  
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting via Delta Proxy...</title>
        <meta http-equiv="refresh" content="0; url=${deltaRedirectUrl}">
        <style>
            body {
                background: #1a1a1a;
                color: white;
                font-family: Arial;
                text-align: center;
                padding: 50px;
                margin: 0;
            }
            .container {
                background: #2d2d2d;
                padding: 40px;
                border-radius: 15px;
                border: 3px solid #00ff00;
                max-width: 500px;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🎮 Delta Bypass in Progress...</h1>
            <p><strong>Server ID:</strong> ${server}</p>
            <p>Redirecting through Delta Proxy...</p>
            <p>This may bypass server expiration</p>
        </div>
        
        <script>
            setTimeout(function() {
                window.location.href = "${deltaRedirectUrl}";
            }, 100);
        </script>
    </body>
    </html>
  `);
};