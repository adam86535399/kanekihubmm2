export default async function handler(req, res) {
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
      
      console.log('📨 Received request for target:', target);
      
      if (!target || !target.includes('discord.com')) {
        return res.status(400).json({ error: 'Invalid target URL' });
      }

      // Send to Discord
      const discordResponse = await fetch(target, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

      const responseData = await discordResponse.text();
      
      console.log('✅ Discord response status:', discordResponse.status);
      
      return res.status(discordResponse.status).json({
        success: discordResponse.ok,
        discordStatus: discordResponse.status,
        response: responseData
      });

    } catch (error) {
      console.error('❌ Proxy error:', error);
      return res.status(500).json({ 
        success: false, 
        error: error.message 
      });
    }
  }

  return res.status(405).json({ error: 'Method not allowed' });
}