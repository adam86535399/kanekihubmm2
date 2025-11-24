export default async function handler(req, res) {
  const { jobid } = req.query;
  
  if (jobid) {
    const robloxUrl = `https://www.roblox.com/games/142823291/Murder-Mystery-2?jobId=${jobid}`;
    
    res.setHeader('Content-Type', 'text/html');
    res.send(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>Redirecting to Roblox...</title>
        <meta http-equiv="refresh" content="0; url=${robloxUrl}">
      </head>
      <body>
        <p>Redirecting to Roblox... <a href="${robloxUrl}">Click here if not redirected</a></p>
        <script>window.location.href = "${robloxUrl}";</script>
      </body>
      </html>
    `);
  } else {
    res.status(400).json({ error: 'No jobid provided' });
  }
}