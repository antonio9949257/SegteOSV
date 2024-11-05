import db from '../config/db.js'

const saveImagePath = (rutaImagen, callback)=>{
    const query = 'INSERT INTO imagenes (ruta) VALUES (?)';
    db.query(query, [rutaImagen], callback);
};
const getAllImages = (callback) => {
    const query = 'SELECT * FROM imagenes';
    db.query(query, callback);
};

export default {saveImagePath, getAllImages}