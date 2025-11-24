module.exports = async (req, res) => {
  const { server } = req.query;
  
  if (!server) {
    return res.send(`
      <html>
        <head>
          <title>Zyrnox_1 • Proxy Gateway</title>
          <style>
            body {
              background: #1a1a1a;
              color: white;
              font-family: Arial;
              text-align: center;
              padding: 50px;
            }
          </style>
        </head>
        <body>
          <h1>🛡️ Zyrnox_1 Proxy Gateway</h1>
          <p>This redirects to the Delta Proxy</p>
          <p>Add <strong>?server=JOB_ID</strong> to URL</p>
        </body>
      </html>
    `);
  }

  // REDIRECTION VERS LE VRAI PROXY DELTA
  const proxyUrl = "https://proxy-nu-fawn.vercel.app/?server=" + server;
  
  res.send(`
    <html>
      <head>
        <title>Redirecting to Delta Proxy...</title>
        <meta http-equiv="refresh" content="0; url=${proxyUrl}">
      </head>
      <body>
        <script>
          window.location.href = "${proxyUrl}";
        </script>
      </body>
    </html>
  `);
};