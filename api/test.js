module.exports = async (req, res) => {
  console.log('✅ TEST API CALLED');
  
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json');
  
  res.status(200).json({
    status: "OK",
    message: "API is working!",
    timestamp: new Date().toISOString(),
    yourIP: req.headers['x-forwarded-for'] || req.connection.remoteAddress
  });
};