import express, { Request, Response, NextFunction } from 'express';
import productRoutes from './routes/productRoutes';
import categoryRoutes from './routes/categoryRoutes';

const app = express();
const PORT = 3000;

app.use(express.json());

// API endpoint base
app.use('/products', productRoutes);
app.use('/categories', categoryRoutes);

// Global error handler
app.use((error: any, req: Request, res: Response, next: NextFunction) => {
    console.error('Global error handler:', error);

    res.status(error.status || 500).json({
        message: error.message || 'Internal server error'
    });
});

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`)
})