import React, { useEffect, useState } from 'react';

function App() {
  const [mensaje, setMensaje] = useState('Cargando...');

  useEffect(() => {
    fetch('https://findoutmole-backend.onrender.com/')
      .then(response => response.json())
      .then(data => setMensaje(data.message))

      .catch(error => {
        console.error('Error al conectar con el backend:', error);
        setMensaje('Error al conectar con el backend.');
      });
  }, []);

  return (
    <div style={{ textAlign: 'center', marginTop: '50px' }}>
      <h1>Conexión con el backend</h1>
      <p>{mensaje}</p>
    </div>
  );
}

export default App;
