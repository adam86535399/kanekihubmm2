module.exports = async (req, res) => {
  const { id } = req.query;
  const jobId = id;

  if (!jobId) {
    res.setHeader('Content-Type', 'text/html');
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox_1 Mobile Redirect</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
          }
          .container {
            background: rgba(0,0,0,0.9);
            padding: 30px;
            border-radius: 20px;
            border: 3px solid #00ff88;
            text-align: center;
            max-width: 400px;
            width: 100%;
            backdrop-filter: blur(10px);
          }
          .logo {
            font-size: 2.5em;
            margin-bottom: 15px;
          }
          .btn {
            display: block;
            background: linear-gradient(45deg, #00ff88, #00cc66);
            color: black;
            padding: 18px;
            text-decoration: none;
            border-radius: 15px;
            font-weight: bold;
            font-size: 1.2em;
            margin: 20px 0;
            transition: transform 0.2s;
          }
          .btn:active {
            transform: scale(0.95);
          }
          .info {
            background: rgba(0,255,136,0.1);
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
            font-size: 0.9em;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="logo">🎮</div>
          <h1>Zyrnox_1 Mobile</h1>
          <p>Redirect Service</p>
          <div class="info">
            <p>Add ?id=JOB_ID to URL</p>
          </div>
        </div>
      </body>
      </html>
    `);
  }

  // LIENS ROBLOX MOBILE COMPATIBLES
  const robloxUrls = {
    mobileApp: `roblox://experiences/start?placeId=142823291&gameInstanceId=${jobId}`,
    mobileBrowser: `https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=${jobId}`,
    universal: `https://roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobId}`
  };

  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Joining MM2 Server...</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
                color: white;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }
            .container {
                background: rgba(0,0,0,0.9);
                padding: 30px;
                border-radius: 20px;
                border: 3px solid #5865F2;
                text-align: center;
                max-width: 400px;
                width: 100%;
                backdrop-filter: blur(10px);
            }
            .logo {
                font-size: 3em;
                margin-bottom: 15px;
            }
            .btn {
                display: block;
                background: linear-gradient(45deg, #5865F2, #4752c4);
                color: white;
                padding: 18px;
                text-decoration: none;
                border-radius: 15px;
                font-weight: bold;
                font-size: 1.2em;
                margin: 15px 0;
                transition: transform 0.2s;
                border: none;
                width: 100%;
                cursor: pointer;
            }
            .btn:active {
                transform: scale(0.95);
            }
            .btn-secondary {
                background: linear-gradient(45deg, #00ff88, #00cc66);
                color: black;
            }
            .info {
                background: rgba(88, 101, 242, 0.1);
                padding: 15px;
                border-radius: 10px;
                margin: 15px 0;
                font-size: 0.9em;
            }
            .countdown {
                font-size: 1.1em;
                margin: 20px 0;
                color: #00ff88;
            }
            .instructions {
                background: rgba(255,255,255,0.1);
                padding: 15px;
                border-radius: 10px;
                margin: 15px 0;
                font-size: 0.8em;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="logo">🚀</div>
            <h1>Join MM2 Server</h1>
            
            <div class="info">
                <p><strong>JobId:</strong> ${jobId}</p>
                <p>Mobile & Desktop Compatible</p>
            </div>

            <div class="countdown" id="countdown">
                Auto-join in 5 seconds...
            </div>

            <button class="btn" onclick="openRoblox('${robloxUrls.mobileApp}')">
                📱 OPEN IN ROBLOX APP
            </button>

            <button class="btn btn-secondary" onclick="openRoblox('${robloxUrls.mobileBrowser}')">
                🌐 OPEN IN BROWSER
            </button>

            <div class="instructions">
                <p><strong>Mobile Instructions:</strong></p>
                <p>1. Tap "OPEN IN ROBLOX APP"</p>
                <p>2. Allow the app to open</p>
                <p>3. You will join the server</p>
            </div>

            <p style="margin-top: 20px; font-size: 0.8em; color: #ccc;">
                Zyrnox_1 Mobile Redirect
            </p>
        </div>

        <script>
            let countdown = 5;
            const countdownElement = document.getElementById('countdown');

            function updateCountdown() {
                countdownElement.textContent = 'Auto-join in ' + countdown + ' seconds...';
                if (countdown <= 0) {
                    openRoblox('${robloxUrls.mobileApp}');
                } else {
                    countdown--;
                    setTimeout(updateCountdown, 1000);
                }
            }

            function openRoblox(url) {
                // Essayer d'ouvrir l'app Roblox d'abord
                window.location.href = '${robloxUrls.mobileApp}';
                
                // Fallback vers le browser après 1 seconde
                setTimeout(function() {
                    window.location.href = '${robloxUrls.mobileBrowser}';
                }, 1000);
            }

            // Démarrer le compte à rebours
            updateCountdown();

            // Redirection automatique après 5 secondes
            setTimeout(function() {
                openRoblox('${robloxUrls.mobileApp}');
            }, 5000);

            // Détection mobile
            function isMobile() {
                return /Android|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
            }

            if (isMobile()) {
                console.log("Mobile device detected");
            }
        </script>
    </body>
    </html>
  `);
};