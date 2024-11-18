# SegteOSV
---

- Tener internet en el momento de instalar las dependencias en el paso 5.
    
    ```bash
    npm install
    
    ```
    

---

## Pre-requisitos instalados en la máquina.

1. Tener Node.js
    
    Verificar versión:
    
    ```bash
    node --version
    
    ```
    
2. Tener Git (en el caso de clonación del repositorio).
    
    Verificar versión:
    
    ```bash
    git --version
    
    ```
    

---

## Pasos para la ejecución del servidor.

1. Clonar o descargar el repositorio en un zip y descomprimirlo en tu máquina.
    
    ```bash
    git clone git@github.com:antonio9949257/SegteOSV.git
    ```

2. Ingresar al directorio principal del proyecto:
    
    ```bash
    cd SegteOSV
    
    ```
    
3. Crear el archivo `.env`:
    
    ```bash
    cp .env.example .env
    
    ```
    
4. Configurar las variables de entorno del archivo `.env`:
    
    ```
    DB_HOST=NAMEHOST   // nombre de alojamiento de la base de datos
    DB_USER=USERNAME   // usuario de la base de datos
    DB_PASSWORD=PASSDB // contraseña de la base de datos
    DB_NAME=DBNAME     // nombre de la base de datos
    DB_PORT=PORTDB     // puerto de la base de datos
    
    PORT=PORTSERVER    // Puerto en el que se tendrá escuchando el servidor
    JWT_SECRET=secret  // Generar un JWT_SECRET
    
    ```
    
    Tomar en cuenta que la base de datos está en la nube con el servicio gratuito de Aiven, pero también se puede configurar en local. La consulta para crear la base de datos se encuentra en el archivo `segtegdb.sql`, y para insertar datos de prueba se encuentra en el archivo `dataTest.sql`.
    
    mi configuración del puerto y el `JWT_SECRET` generado sería esta:
    
    ```
    PORT=8080
    JWT_SECRET=h9!t4^Fj8@lK2#Mn7*Bq3$Yz6&Vc1%Rf
    
    ```
    
5. Instalar las dependencias (módulos) del proyecto:
    
    ```bash
    npm install
    
    ```
    
6. Inicializar el servidor. Se sugiere revisar el `package.json`:
    - **Desarrollador**:
        
        ```bash
        npm run dev
        
        ```
        
        (Utiliza `nodemon` para reiniciar el servidor automáticamente cuando haya cambios).
        
    - **Inicializador**:
        
        ```bash
        npm start
        
        ```
        
        (Utiliza `node app.js` para la ejecución del servidor).
        
    
    Alternativamente, también se puede usar directamente:
    
    ```bash
    node app.js
    ```
7. Visita el http://localhost:8080
## Demo

Para visualizar la demo del proyecto, visita:

https://segteosv.onrender.com