const fetch = require('node-fetch');

module.exports = async (req, res) => {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method === 'POST') {
    try {
      const { target, data } = req.body;
      
      console.log('🔧 PROXY: Received request for', target);
      
      if (!target || !target.includes('discord.com')) {
        return res.status(400).json({ 
          success: false, 
          error: 'Invalid target URL' 
        });
      }

      // Send to Discord with proxy headers
      const response = await fetch(target, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        },
        body: JSON.stringify(data),
      });

      const responseText = await response.text();
      
      console.log('📨 PROXY: Discord response status', response.status);
      
      return res.status(200).json({
        success: response.ok,
        status: response.status,
        message: 'Data sent via proxy',
        discordResponse: responseText
      });

    } catch (error) {
      console.error('💥 PROXY ERROR:', error);
      return res.status(500).json({ 
        success: false, 
        error: error.message 
      });
    }
  }

  return res.status(405).json({ error: 'Method not allowed' });
};