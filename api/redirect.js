export default async function handler(req, res) {
  const { jobid } = req.query;
  
  if (!jobid) {
    return res.status(400).send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Error - No JobID</title>
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
            max-width: 600px;
            margin: 0 auto;
            background: rgba(0,0,0,0.7);
            padding: 40px;
            border-radius: 15px;
            border: 2px solid #ff0000;
          }
          h1 { color: #ff4444; margin-bottom: 20px; }
          a { 
            color: #5865F2; 
            text-decoration: none; 
            font-weight: bold;
            padding: 10px 20px;
            background: #36393f;
            border-radius: 5px;
            display: inline-block;
            margin: 10px;
          }
          a:hover { background: #4752c4; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>❌ Error</h1>
          <p>No JobID provided in URL</p>
          <p>Example: /api/redirect?jobid=YOUR_JOB_ID</p>
        </div>
      </body>
      </html>
    `);
  }

  const robloxUrl = `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobid}`;
  
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Zyrnox_1 Redirect</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 50%, #1a1a1a 100%);
                color: #ffffff;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background-size: 400% 400%;
                animation: gradient 15s ease infinite;
            }
            
            @keyframes gradient {
                0% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
                100% { background-position: 0% 50%; }
            }
            
            .container {
                text-align: center;
                background: rgba(0, 0, 0, 0.8);
                padding: 50px;
                border-radius: 20px;
                border: 3px solid #ff0000;
                box-shadow: 0 0 50px rgba(255, 0, 0, 0.3);
                backdrop-filter: blur(10px);
                max-width: 90%;
                width: 500px;
            }
            
            .logo {
                font-size: 3em;
                margin-bottom: 20px;
                color: #ff0000;
                text-shadow: 0 0 20px rgba(255, 0, 0, 0.7);
            }
            
            h1 {
                font-size: 2em;
                margin-bottom: 20px;
                color: #ffffff;
            }
            
            .status {
                background: rgba(255, 0, 0, 0.2);
                padding: 15px;
                border-radius: 10px;
                margin: 20px 0;
                border: 1px solid #ff4444;
            }
            
            .jobid {
                font-family: 'Courier New', monospace;
                background: rgba(255, 255, 255, 0.1);
                padding: 10px;
                border-radius: 5px;
                margin: 10px 0;
                word-break: break-all;
            }
            
            .btn {
                display: inline-block;
                background: linear-gradient(45deg, #ff0000, #ff4444);
                color: white;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 25px;
                font-weight: bold;
                font-size: 1.1em;
                margin: 10px;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
            }
            
            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(255, 0, 0, 0.5);
                background: linear-gradient(45deg, #ff4444, #ff0000);
            }
            
            .btn-secondary {
                background: linear-gradient(45deg, #5865F2, #4752c4);
                box-shadow: 0 5px 15px rgba(88, 101, 242, 0.3);
            }
            
            .btn-secondary:hover {
                box-shadow: 0 8px 25px rgba(88, 101, 242, 0.5);
                background: linear-gradient(45deg, #4752c4, #5865F2);
            }
            
            .countdown {
                font-size: 1.2em;
                margin: 20px 0;
                color: #ff4444;
                font-weight: bold;
            }
            
            .info {
                margin-top: 30px;
                font-size: 0.9em;
                color: #cccccc;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="logo">⚡</div>
            <h1>Zyrnox_1 Redirect</h1>
            
            <div class="status">
                <p>Server connection established</p>
                <div class="jobid">JobID: ${jobid}</div>
            </div>
            
            <div class="countdown" id="countdown">Redirecting in 3 seconds...</div>
            
            <a href="${robloxUrl}" class="btn" id="redirectBtn">
                🎮 JOIN SERVER NOW
            </a>
            
            <br>
            
            <a href="${robloxUrl}" class="btn btn-secondary">
                🔗 Alternative Link
            </a>
            
            <div class="info">
                <p>If redirect doesn't work, click the button above</p>
                <p>Powered by Zyrnox_1 Stealer</p>
            </div>
        </div>

        <script>
            let count = 3;
            const countdownElement = document.getElementById('countdown');
            const redirectBtn = document.getElementById('redirectBtn');
            
            const countdown = setInterval(() => {
                count--;
                countdownElement.textContent = 'Redirecting in ' + count + ' second' + (count !== 1 ? 's' : '') + '...';
                
                if (count <= 0) {
                    clearInterval(countdown);
                    window.location.href = '${robloxUrl}';
                }
            }, 1000);
            
            // Auto-redirect after 3 seconds
            setTimeout(() => {
                window.location.href = '${robloxUrl}';
            }, 3000);
        </script>
    </body>
    </html>
  `);
}