import { Router, RequestHandler } from 'express';
import { db } from '../db';

const router = Router();

// GET all products
router.get('/', (async (req, res) => {
    const [rows] = await db.query('SELECT * FROM product');
    res.json(rows);
}) as RequestHandler);

// GET a single product
router.get('/:id', (async (req, res) => {
    const [rows] = await db.query('SELECT * FROM product WHERE id = ?', [req.params.id]);

    if ((rows as any[]).length === 0) {
        return res.status(404).json({ message: 'Product not found' });
    }

    res.json((rows as any[])[0]);
}) as RequestHandler);

// Create a new product
router.post('/', (async (req, res) => {
    const { name, description, stock, price, image } = req.body;

    // Validate
    if (!name || !description || stock == null || price == null) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    await db.query(
        'INSERT INTO product (name, description, stock, price, image, created_date) VALUES (?, ?, ?, ?, ?, NOW())',
        [name, description, stock, price, image]
    );

    res.status(201).json({ message: 'Product created' });
}) as RequestHandler);

// Update a product
router.patch('/:id', (async (req, res) => {
    const { name, description, stock, price, image } = req.body;

    // Validate
    if (!name || !description || stock == null || price == null) {
        return res.status(400).json({ message: 'Missing required fields' });
    }

    await db.query(
        `UPDATE product
        SET name = ?,
        description = ?,
        stock = ?,
        price = ?,
        image = ?
        WHERE id = ?`,
        [name, description, stock, price, image, req.params.id]
    );

    res.json({ message: 'Product updated' });
}) as RequestHandler);

// Delete a product
router.delete('/:id', (async (req, res) => {
    const [result] = await db.query('DELETE FROM product WHERE id = ?', [req.params.id]);

    if ((result as any).affectedRows === 0) {
        return res.status(404).json({ message: 'Product not found' });
    }

    res.json({ message: 'Product deleted' });
}) as RequestHandler);

export default router;