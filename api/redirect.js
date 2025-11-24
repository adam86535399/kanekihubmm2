export default async function handler(req, res) {
  const { jobid } = req.query;
  
  if (!jobid) {
    // Si pas de jobid, page d'erreur
    res.setHeader('Content-Type', 'text/html');
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Error - No JobID</title>
        <style>
          body { 
            font-family: Arial, sans-serif; 
            background: #1a1a1a; 
            color: white; 
            text-align: center; 
            padding: 50px;
          }
          .container {
            background: #2d2d2d;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid #ff4444;
          }
          a { 
            color: #5865F2; 
            text-decoration: none; 
            font-weight: bold; 
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>❌ Error: No JobID</h1>
          <p>No server JobID provided in the URL</p>
          <p>Example: /api/redirect?jobid=YOUR_SERVER_JOBID</p>
        </div>
      </body>
      </html>
    `);
  }

  // URL Roblox avec le JobId
  const robloxUrl = `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobid}`;
  
  // Page HTML qui redirige automatiquement vers Roblox
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting to Roblox MM2...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
                color: white;
                text-align: center;
                padding: 50px;
                margin: 0;
            }
            .container {
                background: rgba(0,0,0,0.8);
                padding: 40px;
                border-radius: 15px;
                border: 3px solid #ff0000;
                max-width: 600px;
                margin: 0 auto;
            }
            h1 {
                color: #ff4444;
                margin-bottom: 20px;
            }
            .btn {
                display: inline-block;
                background: #ff0000;
                color: white;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 25px;
                font-weight: bold;
                margin: 20px 0;
                transition: 0.3s;
            }
            .btn:hover {
                background: #ff4444;
                transform: scale(1.05);
            }
            .info {
                background: rgba(255,0,0,0.2);
                padding: 15px;
                border-radius: 10px;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🎮 Zyrnox_1 Redirect</h1>
            <div class="info">
                <p><strong>Server JobID:</strong> ${jobid}</p>
                <p>Redirecting to Roblox Murder Mystery 2...</p>
            </div>
            
            <a href="${robloxUrl}" class="btn">
                🚀 CLICK HERE TO JOIN SERVER
            </a>
            
            <p>If you are not redirected automatically, click the button above.</p>
            
            <script>
                // Redirection automatique après 2 secondes
                setTimeout(function() {
                    window.location.href = "${robloxUrl}";
                }, 2000);
                
                // Compte à rebours
                let count = 3;
                const countdown = setInterval(function() {
                    count--;
                    document.getElementById('countdown').textContent = count;
                    if (count <= 0) {
                        clearInterval(countdown);
                    }
                }, 1000);
            </script>
            
            <p>Redirecting in <span id="countdown">3</span> seconds...</p>
        </div>
    </body>
    </html>
  `);
}