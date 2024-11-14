import express from 'express';
import userController from '../controllers/userController.js';
const {createUsuario, getUsuario, updateUsuario, getUsuarioActivities} = userController
const router = express.Router();

router.post('/', createUsuario)
router.get('/:id', getUsuario)
router.put('/:id', updateUsuario)
router.get('/:id/actividades', getUsuarioActivities)
export default router;