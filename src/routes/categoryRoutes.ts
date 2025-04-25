import { Router, RequestHandler } from 'express';
import { db } from '../db'; // Import db connection

const router = Router();

// GET all categories
router.get('/', async (req, res) => {
    const [rows] = await db.query('SELECT * FROM category');
    res.json(rows);
});

// GET products that belong to a category
router.get('/:id/products', async (req, res) => {
    const [rows] = await db.query(
        'SELECT * FROM product WHERE category_id = ?',
        [req.params.id]
    );
    res.json(rows);
});

// Create a new category
router.post('/', (async (req, res) => {
    const { id, title } = req.body;

    // Validate
    if (!title) {
        return res.status(400).json({ message: 'Missing title' });
    }
    
    await db.query('INSERT INTO category (id, title) VALUES (?, ?)', [id, title]);
    res.status(201).json({ message: 'Category created' });
}) as RequestHandler);

// Update a category
router.patch('/:id', (async (req, res) => {
    const { title } = req.body;

    // Validate
    if (!title) {
        return res.status(400).json({ message: 'Missing title' });
    }

    await db.query('UPDATE category SET title = ? WHERE id = ?', [title, req.params.id]);
    res.json({ message: 'Category updated' });
}) as RequestHandler);

// Delete a category
router.delete('/:id', async (req, res) => {
    await db.query('DELETE FROM category WHERE id = ?', [req.params.id]);
    res.json({ message: 'Category deleted' });
});

export default router;