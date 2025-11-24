module.exports = async (req, res) => {
  const { id, jobid, server } = req.query;
  
  // Prendre n'importe quel paramètre
  const jobId = id || jobid || server;
  
  if (!jobId) {
    // Page d'accueil si pas de JobId
    res.setHeader('Content-Type', 'text/html');
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox_1 Redirect Service</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
            color: white;
            font-family: Arial, sans-serif;
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
          code {
            background: rgba(255,255,255,0.1);
            padding: 10px;
            border-radius: 5px;
            display: block;
            margin: 10px 0;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>🔗 Zyrnox_1 Redirect</h1>
          <p><strong>Service actif - Prêt à rediriger</strong></p>
          <p>Format des liens:</p>
          <code>https://kanekihubmm2-git-main-omzs-projects.vercel.app/?id=VOTRE_JOBID</code>
          <code>https://kanekihubmm2-git-main-omzs-projects.vercel.app/?jobid=VOTRE_JOBID</code>
          <code>https://kanekihubmm2-git-main-omzs-projects.vercel.app/?server=VOTRE_JOBID</code>
          <p style="margin-top: 30px; color: #ccc;">Zyrnox_1 Stealer System</p>
        </div>
      </body>
      </html>
    `);
  }

  // REDIRECTION VERS ROBLOX
  const robloxUrl = 'https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=' + jobId;
  
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Redirecting to Roblox MM2...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
                color: white;
                font-family: Arial, sans-serif;
                text-align: center;
                padding: 50px;
                margin: 0;
            }
            .container {
                background: rgba(0,0,0,0.8);
                padding: 40px;
                border-radius: 15px;
                border: 3px solid #00ff00;
                max-width: 600px;
                margin: 0 auto;
            }
            h1 {
                color: #00ff00;
                margin-bottom: 20px;
            }
            .btn {
                display: inline-block;
                background: #00ff00;
                color: black;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 25px;
                font-weight: bold;
                margin: 20px 0;
                transition: 0.3s;
            }
            .btn:hover {
                background: #44ff44;
                transform: scale(1.05);
            }
            .info {
                background: rgba(0,255,0,0.2);
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
                <p><strong>JobID:</strong> ${jobId}</p>
                <p>Redirection vers Roblox Murder Mystery 2...</p>
            </div>
            
            <a href="${robloxUrl}" class="btn">
                🚀 REJOINDRE LE SERVEUR
            </a>
            
            <p>Redirection automatique dans <span id="countdown">3</span> secondes...</p>
            
            <script>
                let count = 3;
                const countdown = setInterval(function() {
                    count--;
                    document.getElementById('countdown').textContent = count;
                    if (count <= 0) {
                        clearInterval(countdown);
                        window.location.href = "${robloxUrl}";
                    }
                }, 1000);
            </script>
        </div>
    </body>
    </html>
  `);
};