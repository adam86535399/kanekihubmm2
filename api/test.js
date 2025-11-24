// api/test.js - Fichier de test
export default async function handler(req, res) {
  res.status(200).json({ 
    message: "Proxy is working!",
    timestamp: new Date().toISOString(),
    status: "OK"
  });
}