module.exports = async (req, res) => {
  console.log('=== PROXY REQUEST START ===');
  console.log('Method:', req.method);
  console.log('Headers:', JSON.stringify(req.headers));
  
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    console.log('=== PROXY OPTIONS REQUEST ===');
    return res.status(200).end();
  }

  if (req.method === 'POST') {
    try {
      const body = req.body;
      console.log('📦 Raw body:', JSON.stringify(body));
      
      const { target, data } = body;
      
      console.log('🎯 Target:', target);
      console.log('📤 Data to send:', JSON.stringify(data));
      
      if (!target || !target.includes('discord.com')) {
        console.log('❌ Invalid target');
        return res.status(400).json({ 
          success: false, 
          error: 'Invalid target URL',
          receivedTarget: target 
        });
      }

      console.log('🔄 Sending to Discord...');
      
      // Send to Discord
      const response = await fetch(target, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        },
        body: JSON.stringify(data),
      });

      const responseText = await response.text();
      
      console.log('📨 Discord response status:', response.status);
      console.log('📨 Discord response body:', responseText);
      
      return res.status(200).json({
        success: response.ok,
        status: response.status,
        discordResponse: responseText,
        proxyStatus: 'COMPLETED'
      });

    } catch (error) {
      console.error('💥 PROXY ERROR:', error.message);
      console.error('💥 Stack:', error.stack);
      
      return res.status(500).json({ 
        success: false, 
        error: error.message,
        stack: error.stack
      });
    }
  }

  console.log('❌ Method not allowed:', req.method);
  return res.status(405).json({ error: 'Method not allowed' });
};