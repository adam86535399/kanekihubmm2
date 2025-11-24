module.exports = async (req, res) => {
  const { id } = req.query;
  
  if (!id) {
    return res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Zyrnox Elite • Redirect</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap');
          
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body {
            font-family: 'Orbitron', monospace;
            background: linear-gradient(135deg, #0a0a0a, #1a1a1a);
            color: #00ff88;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
          }
          .cyber-terminal {
            background: rgba(0,0,0,0.9);
            border: 3px solid #00ff88;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 0 50px rgba(0,255,136,0.3);
            backdrop-filter: blur(10px);
            max-width: 600px;
            width: 90%;
          }
          .logo {
            font-size: 3em;
            font-weight: 900;
            margin-bottom: 20px;
            text-shadow: 0 0 20px #00ff88;
          }
          .status {
            background: rgba(0,255,136,0.1);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border: 1px solid #00ff88;
          }
          .btn {
            display: inline-block;
            background: linear-gradient(45deg, #00ff88, #00cc66);
            color: black;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            margin: 10px;
            transition: 0.3s;
          }
          .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,255,136,0.5);
          }
        </style>
      </head>
      <body>
        <div class="cyber-terminal">
          <div class="logo">ZYRNOX ELITE</div>
          <h2>PROFESSIONAL REDIRECT</h2>
          <div class="status">
            <p>Add <strong>?id=JOB_ID</strong> to URL</p>
            <p>Elite MM2 Server Redirect System</p>
          </div>
          <a href="/?id=test123" class="btn">🧪 TEST SYSTEM</a>
        </div>
      </body>
      </html>
    `);
  }

  const robloxUrl = 'https://www.roblox.com/games/start?placeId=142823291&gameInstanceId=' + id;
  
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
        <title>Zyrnox Elite • Joining Server...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
        <style>
          body {
            background: #0a0a0a;
            color: #00ff88;
            font-family: 'Orbitron', monospace;
            text-align: center;
            padding: 50px;
          }
        </style>
    </head>
    <body>
        <h1>🚀 ZYRN0X ELITE REDIRECT</h1>
        <p>Joining MM2 Server...</p>
        <p>JobId: ${id}</p>
        <script>setTimeout(() => window.location.href = "${robloxUrl}", 100);</script>
    </body>
    </html>
  `);
};