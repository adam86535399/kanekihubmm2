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
      
      console.log('📨 Received request for:', target);
      
      if (!target) {
        return res.status(400).json({ error: 'No target provided' });
      }

      // Send to Discord
      const response = await fetch(target, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

      const result = await response.text();
      
      return res.status(200).json({
        success: response.ok,
        status: response.status,
        message: 'Data sent to Discord'
      });

    } catch (error) {
      console.error('❌ Error:', error);
      return res.status(500).json({ 
        success: false, 
        error: error.message 
      });
    }
  }

  return res.status(405).json({ error: 'Method not allowed' });
};