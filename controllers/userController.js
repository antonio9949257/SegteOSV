import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
// import { obtenerUsuarioPorUsername, crearUsuario } from '../models/userModel.js';
import {createUser, getUserById, updateUser, getUserActivities} from '../models/userModel.js'


const createUsuario = async(req, res)=>{
    const {name, email, password, date_of_birth, phone_number, address, city, country} = req.body;

    if (!name || !email || !password || !date_of_birth){
        return res.status(400).json({
            error: 'Todos los campos son requeridos'
        })
    }
    try {
        const hashedPassword  = await bcrypt.hash(password, 10);
        const newUser = await createUser(name, email, hashedPassword, date_of_birth, phone_number, address, city, country);

        const token = jwt.sign({id: newUser.insertId, email}, process.env.JWT_SECRET, { expiresIn: '1h' })

        res.status(201).json({ id: newUser.insertId, name, token })
    }catch(error){
        res.status(500).json({ error: error.message })
    }
}
const getUsuario = async (req, res )=>{
    const userId = req.params.id;
    try {
        const user = await getUserById(userId)
        if(user){
            res.status(200).json(user);
        }else{
            res.status(400).json({message: 'Usuario no encotrado'})
        }
    }catch(error){
        res.status(500).json({ error: error.message })
    }
}

const updateUsuario = async (req, res)=> {
    const userId = req.params.id;
    const {name, email, password, phone_number,address, city, country}=req.body;

    if(!name || !email){
        return res.status(400).json({ error: 'El nombre y correo son requeridos.'})
    }
    try{
        const hashedPassword = password ? await bcrypt.hash(password, 10): undefined;
        await updateUser(userId, { name, email, password: hashedPassword, phone_number, address, city, country})
        res.status(200).json({message: 'Usuario actualizado exitosamente.'})
    }catch(error){
        res.status(500).json({ error: error.message})
    }
}

const getUsuarioActivities = async (req, res)=>{
    const userId = req.params.id;
    try{
        const activities = await getUserActivities(userId);
        res.status(200).json(activities);
    } catch (error){
        res.status(500).json({
            error: error.message 
        })
    }
}

export default {
    getUsuario,
    createUsuario,
    updateUsuario,
    getUsuarioActivities
}