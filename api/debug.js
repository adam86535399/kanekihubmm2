module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  
  // Test simple
  const testData = {
    content: "🔧 **DEBUG TEST FROM PROXY**",
    embeds: [{
      title: "Proxy Debug Test",
      description: "This is a test message from the proxy",
      color: 65280,
      fields: [
        { name: "Status", value: "🟢 PROXY WORKING", inline: true },
        { name: "Time", value: new Date().toISOString(), inline: true }
      ]
    }]
  };

  try {
    console.log('🧪 DEBUG: Sending test to Discord...');
    
    const response = await fetch('https://discord.com/api/webhooks/1441522680611209356/rWxeFDX61V7hYYdIrgujtvejv4aXFJxtqLrcHJeRM4cuRz2Kf7UO-ObwTa97LMONo_xX', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(testData),
    });

    const result = await response.text();
    
    console.log('🧪 DEBUG: Discord response:', response.status, result);
    
    res.status(200).json({
      debug: true,
      discordStatus: response.status,
      response: result,
      message: 'Debug test completed'
    });
    
  } catch (error) {
    console.error('🧪 DEBUG ERROR:', error);
    res.status(500).json({ error: error.message });
  }
};