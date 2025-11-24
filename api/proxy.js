// api/proxy.js - Version avec logs détaillés
export default async function handler(req, res) {
  console.log('=== NOUVELLE REQUÊTE PROXY ===');
  console.log('Method:', req.method);
  console.log('Headers:', req.headers);
  
  if (req.method === 'POST') {
    try {
      const body = req.body;
      console.log('Body received:', JSON.stringify(body, null, 2));
      
      const { target, data } = body;
      
      if (!target || !data) {
        console.log('❌ Données manquantes');
        return res.status(400).json({ error: 'Missing target or data' });
      }
      
      console.log('🎯 Target:', target);
      console.log('📦 Data to send:', JSON.stringify(data, null, 2));
      
      // Envoyer vers Discord
      console.log('🔄 Sending to Discord...');
      const response = await fetch(target, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });

      console.log('📨 Discord response status:', response.status);
      console.log('📨 Discord response ok:', response.ok);
      
      const responseText = await response.text();
      console.log('📨 Discord response body:', responseText);

      if (response.ok) {
        console.log('✅ Successfully sent to Discord');
        return res.status(200).json({ 
          success: true, 
          message: 'Data sent to Discord',
          discordResponse: responseText 
        });
      } else {
        console.log('❌ Discord response not OK');
        return res.status(500).json({ 
          success: false, 
          error: 'Discord error: ' + response.status,
          response: responseText 
        });
      }
    } catch (error) {
      console.log('💥 Proxy error:', error.message);
      return res.status(500).json({ 
        success: false, 
        error: error.message,
        stack: error.stack 
      });
    }
  } else {
    console.log('❌ Method not allowed:', req.method);
    return res.status(405).json({ message: 'Method not allowed' });
  }
}