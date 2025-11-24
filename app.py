from flask import Flask, request, redirect
import requests

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Zyrnox_1 • Elite Redirect</title>
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
            }
            
            body {
                font-family: 'Rajdhani', sans-serif;
                background: linear-gradient(135deg, var(--darker) 0%, var(--dark) 50%, var(--darker) 100%);
                color: var(--text);
                min-height: 100vh;
                overflow-x: hidden;
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
                text-align: center;
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
                color: var(--text);
                font-size: 1.2em;
                letter-spacing: 3px;
                text-transform: uppercase;
                margin-bottom: 30px;
            }
            
            .info-box {
                background: rgba(255, 0, 0, 0.1);
                border: 1px solid var(--primary);
                border-radius: 10px;
                padding: 20px;
                margin: 20px 0;
            }
            
            .btn {
                display: inline-block;
                background: linear-gradient(45deg, var(--primary), #ff4444);
                color: white;
                border: none;
                padding: 15px 30px;
                font-size: 1.1em;
                font-weight: 700;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                margin: 10px;
                font-family: 'Orbitron', sans-serif;
                letter-spacing: 2px;
                text-transform: uppercase;
            }
            
            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <div class="cyber-grid"></div>
        
        <div class="container">
            <div class="terminal">
                <div class="logo">ZYRNOX_1</div>
                <div class="subtitle">ELITE REDIRECT SYSTEM</div>
                
                <div class="info-box">
                    <h2>🚀 Delta Proxy Active</h2>
                    <p>Professional MM2 Server Redirect</p>
                    <p>Add <strong>?server=JOB_ID</strong> to URL</p>
                </div>
                
                <div style="margin: 30px 0;">
                    <a href="/?server=test123" class="btn">🧪 Test Redirect</a>
                    <a href="https://github.com/lilbrolilbrohaha/proxy" class="btn">🔗 Delta Source</a>
                </div>
                
                <p style="color: #ccc; margin-top: 30px;">
                    Powered by Delta Proxy • Zyrnox_1 Elite
                </p>
            </div>
        </div>
    </body>
    </html>
    '''

@app.route('/redirect')
def redirect_to_roblox():
    server_id = request.args.get('server')
    
    if not server_id:
        return redirect('/')
    
    # URL Roblox avec bypass Delta
    roblox_url = f"https://www.roblox.com/games/start?placeId=142823291&gameInstanceId={server_id}&launchData=delta_bypass"
    
    return f'''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Redirecting to MM2...</title>
        <meta http-equiv="refresh" content="0; url={roblox_url}">
        <style>
            body {{
                background: #1a1a1a;
                color: white;
                font-family: Arial;
                text-align: center;
                padding: 50px;
                margin: 0;
            }}
            .container {{
                background: #2d2d2d;
                padding: 40px;
                border-radius: 15px;
                border: 3px solid #00ff00;
                max-width: 500px;
                margin: 0 auto;
            }}
            .btn {{
                display: inline-block;
                background: #00ff00;
                color: black;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 10px;
                font-weight: bold;
                margin: 20px 0;
            }}
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🎮 Joining MM2 Server...</h1>
            <p><strong>Server ID:</strong> {server_id}</p>
            <p>Delta Bypass: <span style="color: #00ff00;">ACTIVE</span></p>
            
            <a href="{roblox_url}" class="btn">
                🚀 CLICK TO JOIN SERVER
            </a>
            
            <p>Redirecting automatically...</p>
            
            <script>
                setTimeout(function() {{
                    window.location.href = "{roblox_url}";
                }}, 2000);
            </script>
        </div>
    </body>
    </html>
    '''

@app.before_request
def proxy_requests():
    # Proxy Delta - redirige vers le serveur principal
    target_url = "http://216.9.225.189:9999" + request.path
    
    try:
        response = requests.request(
            method=request.method,
            url=target_url,
            data=request.get_data(),
            headers=dict(request.headers),
            params=request.args,
            allow_redirects=False
        )
        
        return response.content, response.status_code, dict(response.headers)
    except Exception as e:
        return f"Proxy Error: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)