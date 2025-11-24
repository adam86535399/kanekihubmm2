import requests
from flask import Flask, request, jsonify, redirect
import json
import time

app = Flask(__name__)

# Cache pour stocker les JobIds temporairement
server_cache = {}

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Zyrnox_1 Delta Bypass</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <h1>Zyrnox_1 Delta Bypass</h1>
            <p>Use /join?jobid=SERVER_JOB_ID</p>
        </div>
    </body>
    </html>
    '''

@app.route('/join')
def join_server():
    job_id = request.args.get('jobid')
    
    if not job_id:
        return jsonify({"error": "No jobid provided"}), 400
    
    # Stocker le JobId pour reuse
    server_cache[job_id] = time.time()
    
    # URLs de bypass Delta
    bypass_urls = [
        f"https://www.roblox.com/games/start?placeId=142823291&gameInstanceId={job_id}&accessCode=delta_bypass",
        f"https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId={job_id}&launchData=zyrnox",
        f"roblox://experiences/start?placeId=142823291&gameInstanceId={job_id}&accessKey=bypass_delta",
        f"https://www.roblox.com/games/start?placeId=142823291&gameInstanceId={job_id}&joinAttemptId=zyrnox_{int(time.time())}"
    ]
    
    html_content = f'''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Delta Bypass - Zyrnox_1</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {{
                background: #1a1a1a;
                color: white;
                font-family: Arial;
                text-align: center;
                padding: 20px;
            }}
            .btn {{
                display: block;
                background: #ff4444;
                color: white;
                padding: 15px;
                margin: 10px;
                text-decoration: none;
                border-radius: 10px;
                font-weight: bold;
            }}
            .info {{
                background: #2d2d2d;
                padding: 15px;
                border-radius: 10px;
                margin: 15px 0;
            }}
        </style>
    </head>
    <body>
        <h1>🚀 Delta Bypass Active</h1>
        
        <div class="info">
            <p><strong>JobId:</strong> {job_id}</p>
            <p><strong>Status:</strong> BYPASSING DELTA PROTECTION</p>
        </div>

        <a href="{bypass_urls[0]}" class="btn">🎮 JOIN SERVER (METHOD 1)</a>
        <a href="{bypass_urls[1]}" class="btn">🔗 JOIN SERVER (METHOD 2)</a>
        
        <script>
            // Essayer toutes les méthodes
            setTimeout(() => window.location.href = "{bypass_urls[0]}", 1000);
            setTimeout(() => window.location.href = "{bypass_urls[1]}", 3000);
            setTimeout(() => window.location.href = "{bypass_urls[2]}", 5000);
        </script>
    </body>
    </html>
    '''
    
    return html_content

@app.route('/api/proxy', methods=['POST'])
def proxy_to_discord():
    try:
        data = request.get_json()
        
        if 'target' in data and 'data' in data:
            # Bypass Delta en modifiant les headers
            headers = {
                'Content-Type': 'application/json',
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'X-Forwarded-For': '1.1.1.1',
                'X-Real-IP': '1.1.1.1'
            }
            
            response = requests.post(
                url=data['target'],
                json=data['data'],
                headers=headers,
                timeout=10
            )
            
            return response.text, response.status_code
        else:
            return jsonify({"error": "Invalid data"}), 400
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.before_request
def before_request():
    # Bypass pour les routes spécifiques
    if request.path in ['/', '/join', '/api/proxy']:
        return
    
    # Redirection vers le serveur principal pour les autres routes
    try:
        response = requests.request(
            method=request.method,
            url="http://216.9.225.189:9999" + request.path,
            data=request.get_data(),
            headers=dict(request.headers),
            allow_redirects=False
        )
        return response.content, response.status_code, dict(response.headers)
    except Exception as e:
        return jsonify({"error": f"Proxy error: {str(e)}"}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)