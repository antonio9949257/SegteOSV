import express from 'express'
import  multerConfig from '../config/multerConfig.js'
import imageController from "../controllers/imageController.js";

const {uploadImage, getImages} = imageController;
const router = express.Router()

router.post('/upload', multerConfig.single('image'), uploadImage)
router.get('/imagenes', getImages)

export default router;