module.exports = async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.status(200).json({
    status: "OK",
    message: "Proxy is working!",
    timestamp: new Date().toISOString()
  });
};