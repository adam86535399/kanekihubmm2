export default async function handler(req, res) {
  const { server } = req.query;
  
  if (!server) {
    return res.status(200).send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Zyrnox_1 • Security Portal</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');
            
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            :root {
                --primary: #ff0000;
                --primary-glow: rgba(255, 0, 0, 0.5);
                --secondary: #00ff88;
                --dark: #0a0a0a;
                --darker: #050505;
                --text: #ffffff;
                --text-secondary: #b0b0b0;
            }
            
            body {
                font-family: 'Rajdhani', sans-serif;
                background: linear-gradient(135deg, var(--darker) 0%, var(--dark) 50%, var(--darker) 100%);
                color: var(--text);
                min-height: 100vh;
                overflow-x: hidden;
                background-size: 400% 400%;
                animation: gradientShift 15s ease infinite;
            }
            
            @keyframes gradientShift {
                0%, 100% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
            }
            
            .cyber-grid {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: 
                    linear-gradient(rgba(255, 0, 0, 0.1) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(255, 0, 0, 0.1) 1px, transparent 1px);
                background-size: 50px 50px;
                animation: gridMove 20s linear infinite;
                pointer-events: none;
                z-index: -1;
            }
            
            @keyframes gridMove {
                0% { transform: translate(0, 0); }
                100% { transform: translate(50px, 50px); }
            }
            
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .terminal {
                background: rgba(10, 10, 10, 0.95);
                border: 2px solid var(--primary);
                border-radius: 15px;
                padding: 40px;
                width: 100%;
                box-shadow: 
                    0 0 50px var(--primary-glow),
                    inset 0 0 20px rgba(255, 0, 0, 0.1);
                backdrop-filter: blur(10px);
                position: relative;
                overflow: hidden;
            }
            
            .terminal::before {
                content: '';
                position: absolute;
                top: -2px;
                left: -2px;
                right: -2px;
                bottom: -2px;
                background: linear-gradient(45deg, #ff0000, #ff4444, #ff0000);
                border-radius: 17px;
                z-index: -1;
                animation: borderGlow 2s ease-in-out infinite alternate;
            }
            
            @keyframes borderGlow {
                0% { opacity: 0.5; }
                100% { opacity: 1; }
            }
            
            .header {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .logo {
                font-family: 'Orbitron', monospace;
                font-size: 3.5em;
                font-weight: 900;
                background: linear-gradient(45deg, var(--primary), var(--secondary));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-shadow: 0 0 30px var(--primary-glow);
                margin-bottom: 10px;
            }
            
            .subtitle {
                color: var(--text-secondary);
                font-size: 1.2em;
                letter-spacing: 3px;
                text-transform: uppercase;
            }
            
            .status-panel {
                background: rgba(255, 0, 0, 0.1);
                border: 1px solid var(--primary);
                border-radius: 10px;
                padding: 20px;
                margin: 20px 0;
            }
            
            .status-line {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 10px 0;
                font-family: 'Courier New', monospace;
            }
            
            .status-label {
                color: var(--text-secondary);
            }
            
            .status-value {
                color: var(--secondary);
                font-weight: 600;
            }
            
            .redirect-btn {
                display: block;
                width: 100%;
                background: linear-gradient(45deg, var(--primary), #ff4444);
                color: white;
                border: none;
                padding: 20px;
                font-size: 1.3em;
                font-weight: 700;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                text-align: center;
                margin: 30px 0;
                font-family: 'Orbitron', sans-serif;
                letter-spacing: 2px;
                text-transform: uppercase;
                box-shadow: 0 5px 25px rgba(255, 0, 0, 0.3);
            }
            
            .redirect-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 35px rgba(255, 0, 0, 0.5);
                background: linear-gradient(45deg, #ff4444, var(--primary));
            }
            
            .countdown {
                text-align: center;
                font-size: 1.1em;
                color: var(--text-secondary);
                margin: 20px 0;
            }
            
            .countdown-number {
                color: var(--secondary);
                font-weight: 700;
                font-size: 1.3em;
            }
            
            .security-badge {
                background: rgba(0, 255, 136, 0.1);
                border: 1px solid var(--secondary);
                border-radius: 5px;
                padding: 10px 15px;
                text-align: center;
                margin: 20px 0;
                font-family: 'Courier New', monospace;
            }
            
            .footer {
                text-align: center;
                margin-top: 30px;
                color: var(--text-secondary);
                font-size: 0.9em;
            }
            
            .pulse {
                animation: pulse 2s infinite;
            }
            
            @keyframes pulse {
                0%, 100% { opacity: 1; }
                50% { opacity: 0.7; }
            }
            
            .scan-line {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 2px;
                background: linear-gradient(90deg, transparent, var(--secondary), transparent);
                animation: scan 3s linear infinite;
            }
            
            @keyframes scan {
                0% { top: 0; }
                100% { top: 100%; }
            }
        </style>
    </head>
    <body>
        <div class="cyber-grid"></div>
        <div class="scan-line"></div>
        
        <div class="container">
            <div class="terminal">
                <div class="header">
                    <div class="logo">ZYRNOX_1</div>
                    <div class="subtitle">SECURITY PORTAL</div>
                </div>
                
                <div class="status-panel">
                    <div class="status-line">
                        <span class="status-label">🚨 SECURITY STATUS:</span>
                        <span class="status-value pulse">SERVER CAPTURED</span>
                    </div>
                    <div class="status-line">
                        <span class="status-label">🔗 CONNECTION:</span>
                        <span class="status-value">ENCRYPTED</span>
                    </div>
                    <div class="status-line">
                        <span class="status-label">🌐 PROTOCOL:</span>
                        <span class="status-value">ROBLOX MM2</span>
                    </div>
                </div>
                
                <div class="security-badge">
                    🔒 SECURE REDIRECT • BYPASS ACTIVE
                </div>
                
                <div class="countdown">
                    AUTO-REDIRECT IN <span class="countdown-number" id="countdown">5</span> SECONDS
                </div>
                
                <a href="#" class="redirect-btn" id="redirectBtn">
                    ⚡ INITIATE SERVER CONNECTION
                </a>
                
                <div class="footer">
                    Zyrnox_1 Elite System • v3.0 • ${new Date().toLocaleString()}
                </div>
            </div>
        </div>

        <script>
            const jobId = '${server || 'NO_SERVER'}';
            let countdown = 5;
            
            function updateCountdown() {
                document.getElementById('countdown').textContent = countdown;
                if (countdown <= 0) {
                    redirectToServer();
                } else {
                    countdown--;
                    setTimeout(updateCountdown, 1000);
                }
            }
            
            function redirectToServer() {
                if (jobId && jobId !== 'NO_SERVER') {
                    const robloxUrl = 'https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=' + jobId;
                    window.location.href = robloxUrl;
                } else {
                    alert('No server specified');
                }
            }
            
            document.getElementById('redirectBtn').addEventListener('click', function(e) {
                e.preventDefault();
                redirectToServer();
            });
            
            // Start countdown
            updateCountdown();
            
            // Auto-redirect after 5 seconds
            setTimeout(redirectToServer, 5000);
        </script>
    </body>
    </html>
    `);
  }

  const robloxUrl = 'https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=' + server;
  
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
        <title>Redirecting...</title>
    </head>
    <body>
        <script>window.location.href = "${robloxUrl}";</script>
    </body>
    </html>
  `);
}