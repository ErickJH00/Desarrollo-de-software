// Lógica general del Laboratorio Clínico DANIMAR

document.addEventListener('DOMContentLoaded', () => {
    console.log("Sistema DANIMAR cargado correctamente.");

    // Ejemplo de mejora: Manejo de cierre de sesión con confirmación
    const logoutBtn = document.querySelector('.logout-btn');
    if (logoutBtn) {
        logoutBtn.onclick = (e) => {
            if (confirm("¿Está seguro que desea cerrar la sesión?")) {
                window.location.href = 'login.html';
            }
        };
    }

    //----------------
    // Ejemplo para obtener pacientes
    fetch('http://localhost:8081/api/pacientes')
        .then(response => response.json())
        .then(data => console.log('Pacientes:', data))
        .catch(error => console.error('Error:', error));
    
    // Ejemplo para hacer login
    fetch('http://localhost:8081/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ usuario: 'marisolquintero', password: 'danielita123' })
    })
        .then(response => response.json())
        .then(data => console.log('Login:', data))
        .catch(error => console.error('Error:', error));
    //----------------

    // Efecto de scroll sutil en el main content
    const mainContent = document.querySelector('.main-content');
    if (mainContent) {
        mainContent.addEventListener('scroll', () => {
            const header = document.querySelector('.header');
            if (mainContent.scrollTop > 10) {
                header.style.boxShadow = '0 4px 10px rgba(0,0,0,0.05)';
            } else {
                header.style.boxShadow = 'none';
            }
        });
    }
});
//Para subir los cambios a GitHub
//git add .
//git commit -m "texto de lo que se modifico"
//git push