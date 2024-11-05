import express from 'express';
import { registerCliente, login } from '../controllers/authController.js';

const router = express.Router();

router.post('/register/cliente', registerCliente);

router.post('/login', login);

export default router;
