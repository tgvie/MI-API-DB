import express from 'express';
import productRoutes from './routes/productRoutes';
import categoryRoutes from './routes/categoryRoutes';

const app = express();
const PORT = 3000;

app.use(express.json());

// API endpoint base
app.use('/products', productRoutes);
app.use('/categories', categoryRoutes);

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`)
})