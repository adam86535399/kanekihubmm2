module.exports = async (req, res) => {
  const { jobid } = req.query;
  
  if (!jobid) {
    return res.status(400).send('No jobid provided');
  }

  const robloxUrl = `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobid}`;
  
  res.setHeader('Content-Type', 'text/html');
  res.send(`
    <html>
    <head>
      <title>Redirecting...</title>
      <meta http-equiv="refresh" content="0; url=${robloxUrl}">
    </head>
    <body>
      <p>Redirecting to Roblox... <a href="${robloxUrl}">Click here</a></p>
      <script>window.location.href = "${robloxUrl}";</script>
    </body>
    </html>
  `);
};