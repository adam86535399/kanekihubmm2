module.exports = async (req, res) => {
  console.log('🔧 SIMPLE PROXY CALLED');
  
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json');

  if (req.method === 'POST') {
    try {
      const { target, data } = req.body;
      
      console.log('🎯 Target:', target);
      
      // Simuler un envoi réussi
      res.status(200).json({
        success: true,
        message: "Proxy received data",
        received: {
          target: target,
          data: data
        },
        simulated: true
      });
      
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } else {
    res.status(405).json({ error: 'Method not allowed' });
  }
};