import imageModel from "../models/imageModel.js";
const { saveImagePath, getAllImages } = imageModel;

const uploadImage = (req, res) => {
    if (!req.file) {
        return res.status(400).json({ message: 'No se subió ninguna imagen.' });
    }

    const rutaImagen = `/uploads/${req.file.filename}`;
    // Corregir el paréntesis en la función de callback
    saveImagePath(rutaImagen, (err, result) => {  // Cierre de la función de callback
        if (err) {
            return res.status(500).json({ error: 'Error al guardar en la base de datos' }); // Cambié el estado a 500 para indicar un error del servidor
        }
        return res.status(200).json({ success: 'Imagen subida y ruta almacenada correctamente' }); // Añadido código de estado 200
    });
};

const getImages = (req, res) => {
    getAllImages((err, results) => {
        if (err) {
            return res.status(500).json({ error: 'Error al obtener imágenes de la base de datos' });
        }
        res.status(200).json(results); // Añadido código de estado 200
    });
};

export default { uploadImage, getImages };
