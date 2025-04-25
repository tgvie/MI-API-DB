import { Router, RequestHandler } from 'express';
import { db } from '../db'; // Import db connection

const router = Router();

// GET all categories
router.get('/', async (req, res, next) => {
    try {
        const [rows] = await db.query('SELECT * FROM category');
        res.json(rows);
    } catch (error) {
        next(error);
    }
});

// GET products that belong to a category
router.get('/:id/products', async (req, res, next) => {
    try {
        const [rows] = await db.query(
        `SELECT p.* FROM product p
        JOIN product_categories pc ON p.id = pc.product_id
        WHERE pc.category_id = ?`,
        [req.params.id]
        );
        res.json(rows); 
    } catch (error) {
        next(error);
    }    
});

// Create a new category
router.post('/', (async (req, res, next) => {
    try {
        const { id, title } = req.body;

        // Validate
        if (!title) {
            return res.status(400).json({ message: 'Missing title' });
        }
        
        await db.query('INSERT INTO category (id, title) VALUES (?, ?)', [id, title]);
        res.status(201).json({ message: 'Category created' });
        } catch (error) {
            next(error);
        }
}) as RequestHandler);

// Update a category
router.patch('/:id', (async (req, res, next) => {
    try {
        const { title } = req.body;

        // Validate
        if (!title) {
            return res.status(400).json({ message: 'Missing title' });
        }
    
        await db.query('UPDATE category SET title = ? WHERE id = ?', [title, req.params.id]);
        res.json({ message: 'Category updated' });
    } catch (error) {
        next(error);
    }
}) as RequestHandler);

// Delete a category
router.delete('/:id', async (req, res, next) => {
    try {
        await db.query('DELETE FROM category WHERE id = ?', [req.params.id]);
        res.json({ message: 'Category deleted' });
    } catch (error) {
        next(error);
    }
});

export default router;