module.exports = async (req, res) => {
  const { id } = req.query;
  
  if (!id) {
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox Ultimate - Professional Redirect</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          @import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600;700&display=swap');
          
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: 'JetBrains Mono', monospace;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 50%, #0a0a0a 100%);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
          }
          
          .terminal {
            background: rgba(0, 0, 0, 0.9);
            border: 3px solid #ff0000;
            border-radius: 15px;
            padding: 40px;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 0 50px rgba(255, 0, 0, 0.3);
            backdrop-filter: blur(10px);
          }
          
          .header {
            text-align: center;
            margin-bottom: 30px;
          }
          
          .title {
            font-size: 2.5em;
            font-weight: 700;
            background: linear-gradient(45deg, #ff0000, #ff4444);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
          }
          
          .subtitle {
            color: #cccccc;
            font-size: 1.1em;
          }
          
          .info-box {
            background: rgba(255, 0, 0, 0.1);
            border: 1px solid #ff4444;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
          }
          
          .method-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 15px;
            margin: 25px 0;
          }
          
          .method {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid #333;
            border-radius: 8px;
            padding: 15px;
            transition: all 0.3s ease;
          }
          
          .method:hover {
            border-color: #ff4444;
            background: rgba(255, 0, 0, 0.1);
          }
          
          .method-title {
            font-weight: 600;
            color: #ff4444;
            margin-bottom: 5px;
          }
          
          .method-desc {
            color: #cccccc;
            font-size: 0.9em;
            margin-bottom: 10px;
          }
          
          .btn {
            display: inline-block;
            background: linear-gradient(45deg, #ff0000, #cc0000);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            margin: 5px;
          }
          
          .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
          }
          
          .btn-secondary {
            background: linear-gradient(45deg, #333, #555);
          }
          
          .footer {
            text-align: center;
            margin-top: 30px;
            color: #666;
            font-size: 0.9em;
          }
        </style>
      </head>
      <body>
        <div class="terminal">
          <div class="header">
            <div class="title">ZYRNOX ULTIMATE</div>
            <div class="subtitle">PROFESSIONAL SERVER REDIRECT</div>
          </div>
          
          <div class="info-box">
            <p>Add <strong>?id=JOB_ID</strong> to URL for server redirect</p>
            <p>Advanced MM2 server hijacking system</p>
          </div>
          
          <div style="text-align: center; margin: 20px 0;">
            <a href="/?id=test123" class="btn">TEST SYSTEM</a>
          </div>
          
          <div class="footer">
            Zyrnox Ultimate V7 • Professional Redirect System
          </div>
        </div>
      </body>
      </html>
    `);
  }

  // ULTIMATE REDIRECT SYSTEM - MULTIPLE METHODS
  const redirectMethods = {
    appDirect: 'roblox://experiences/start?placeId=142823291&gameInstanceId=' + id,
    appDeepLink: 'https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=' + id + '&launchData=join',
    webJoin: 'https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=' + id,
    mobileJoin: 'https://roblox.com/games/start?placeId=142823291&gameInstanceId=' + id
  };

  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Zyrnox Ultimate - Joining Server...</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          @import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600;700&display=swap');
          
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: 'JetBrains Mono', monospace;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 50%, #0a0a0a 100%);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
          }
          
          .terminal {
            background: rgba(0, 0, 0, 0.9);
            border: 3px solid #00ff00;
            border-radius: 15px;
            padding: 40px;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 0 50px rgba(0, 255, 0, 0.3);
            backdrop-filter: blur(10px);
            text-align: center;
          }
          
          .title {
            font-size: 2em;
            font-weight: 700;
            color: #00ff00;
            margin-bottom: 20px;
          }
          
          .server-info {
            background: rgba(0, 255, 0, 0.1);
            border: 1px solid #00cc00;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
          }
          
          .method-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 15px;
            margin: 25px 0;
          }
          
          .method {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid #333;
            border-radius: 8px;
            padding: 15px;
            transition: all 0.3s ease;
          }
          
          .method:hover {
            border-color: #00ff00;
            background: rgba(0, 255, 0, 0.1);
          }
          
          .method-title {
            font-weight: 600;
            color: #00ff00;
            margin-bottom: 10px;
          }
          
          .btn {
            display: inline-block;
            background: linear-gradient(45deg, #00ff00, #00cc00);
            color: black;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 5px;
          }
          
          .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 255, 0, 0.4);
          }
          
          .auto-redirect {
            margin: 20px 0;
            color: #00ff00;
            font-weight: 600;
          }
        </style>
    </head>
    <body>
        <div class="terminal">
            <div class="title">JOINING MM2 SERVER</div>
            
            <div class="server-info">
                <p><strong>Server JobId:</strong> ${id}</p>
                <p>Select your preferred join method below</p>
            </div>
            
            <div class="method-grid">
                <div class="method">
                    <div class="method-title">METHOD 1 - ROBLOX APP (RECOMMENDED)</div>
                    <p>Opens directly in Roblox application</p>
                    <a href="${redirectMethods.appDirect}" class="btn">OPEN IN ROBLOX APP</a>
                </div>
                
                <div class="method">
                    <div class="method-title">METHOD 2 - DEEP LINK</div>
                    <p>Advanced app opening with parameters</p>
                    <a href="${redirectMethods.appDeepLink}" class="btn">USE DEEP LINK</a>
                </div>
                
                <div class="method">
                    <div class="method-title">METHOD 3 - WEB BROWSER</div>
                    <p>Opens in web browser then app</p>
                    <a href="${redirectMethods.webJoin}" class="btn">OPEN IN BROWSER</a>
                </div>
            </div>
            
            <div class="auto-redirect" id="countdown">
                Auto-redirecting in 3 seconds...
            </div>
        </div>

        <script>
            // Auto-redirect system
            let countdown = 3;
            const countdownElement = document.getElementById('countdown');
            
            function updateCountdown() {
                countdownElement.textContent = 'Auto-redirecting in ' + countdown + ' seconds...';
                if (countdown <= 0) {
                    // Try app direct first, then fallback to deep link
                    window.location.href = '${redirectMethods.appDirect}';
                    setTimeout(() => {
                        window.location.href = '${redirectMethods.appDeepLink}';
                    }, 1000);
                } else {
                    countdown--;
                    setTimeout(updateCountdown, 1000);
                }
            }
            
            // Start countdown
            updateCountdown();
            
            // Additional redirect attempt after 5 seconds
            setTimeout(() => {
                window.location.href = '${redirectMethods.webJoin}';
            }, 5000);
        </script>
    </body>
    </html>
  `);
};