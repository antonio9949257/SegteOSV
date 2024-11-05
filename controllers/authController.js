// src/controllers/authController.js
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import db from '../config/db.js';
import { getUserByEmail } from '../models/userModel.js';
import dotenv from 'dotenv';

dotenv.config();

export const registerCliente = async (req, res) => {
    const { nombre, apellido, correo, telefono, contraseña } = req.body;

    if (!contraseña) {
        return res.status(400).json({ message: 'La contraseña es obligatoria' });
    }

    try {
        const existingUser = await getUserByEmail(correo);
        if (existingUser) {
            return res.status(400).json({ message: 'El correo ya está en uso' });
        }

        const hashedPassword = await bcrypt.hash(contraseña, 10);
        await db.query('INSERT INTO clientes (nombre, apellido, correo, telefono, contraseña) VALUES (?, ?, ?, ?, ?)', 
        [nombre, apellido, correo, telefono, hashedPassword]);

        res.status(201).json({ message: 'Cliente registrado exitosamente' });
    } catch (error) {
        console.error('Error registrando cliente:', error);
        res.status(500).json({ message: 'Error en el registro del cliente' });
    }
};


export const login = async (req, res) => {
    const { correo, contraseña } = req.body;

    try {
        const user = await getUserByEmail(correo);
        if (!user) {
            return res.status(400).json({ message: 'Credenciales inválidas' });
        }

        const isPasswordValid = await bcrypt.compare(contraseña, user.contraseña);
        if (!isPasswordValid) {
            return res.status(400).json({ message: 'Credenciales inválidas' });
        }

        const token = jwt.sign({ id: user.id, role: 'cliente' }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({ token, nombre: user.nombre });
    } catch (error) {
        console.error('Error en el inicio de sesión:', error);
        res.status(500).json({ message: 'Error en el inicio de sesión' });
    }
};
