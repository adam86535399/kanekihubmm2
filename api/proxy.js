export default async function handler(req, res) {
  if (req.method === 'POST') {
    try {
      const { target, data } = req.body;
      
      console.log('Sending to Discord:', target);
      
      const response = await fetch(target, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data),
      });

      if (response.ok) {
        console.log('Successfully sent to Discord');
        res.status(200).json({ success: true });
      } else {
        console.log('Discord response not OK:', response.status);
        res.status(500).json({ success: false, error: 'Discord error' });
      }
    } catch (error) {
      console.log('Proxy error:', error);
      res.status(500).json({ success: false, error: error.message });
    }
  } else {
    res.status(405).json({ message: 'Method not allowed' });
  }
}