# Proyecto Laboratorio Clínico DANIMAR 🏥

Este proyecto es una implementación funcional de un sistema de gestión para laboratorios clínicos, basado en el prototipo diseñado en Figma.

## 📂 Estructura del Proyecto (Árbol de Directorios)

Esta estructura sigue el estándar para repositorios profesionales en GitHub:

```text
ProyectoAnti/
│
├── frontend/               # Código que ve el usuario (Interfaz)
│   ├── assets/             # Recursos compartidos por todas las páginas
│   │   ├── css/            # Hojas de estilo (Variables, Componentes, Layout)
│   │   ├── js/             # Lógica de interactividad (JavaScript)
│   │   └── images/         # Iconos, logotipos y fotos
│   ├── pages/              # Las diferentes pantallas del sistema
│   │   ├── login.html      # Acceso al sistema
│   │   ├── dashboard.html  # Gestión de Pacientes (Principal)
│   │   └── nuevo-examen.html # Registro de pruebas médicas
│   └── index.html          # Punto de entrada principal
│
├── backend/                # Carpeta para la lógica del servidor (Node.js/Python/PHP)
│   └── (Aquí irían los controladores y rutas de la API)
│
├── database/               # Diseño y scripts de la base de datos
│   └── schema.sql          # Archivo para crear las tablas en SQL
│
└── README.md               # Este archivo (Instrucciones y explicación)
```

## 🧠 Guía de Aprendizaje: Conceptos Clave

Si te preguntan sobre el proyecto, aquí tienes la explicación de cada parte:

### 1. Frontend (HTML + CSS)
- **HTML (Estructura):** Es el esqueleto. Define qué es un título (`<h1>`), un botón (`<button>`) o un campo de texto (`<input>`).
- **CSS (Estilo):** Es la piel. Usamos **Variables CSS** (`:root`) para que, si queremos cambiar el azul de todo el sistema, solo lo cambiemos en un lugar. Usamos **Flexbox** y **Grid** para que el diseño se vea ordenado y sea responsivo (se adapte a móviles).
- **Aesthetics (Estética Premium):** Hemos aplicado sombras sutiles (`box-shadow`), bordes redondeados y tipografía moderna para que el sistema se sienta profesional y confiable (estilo médico).

### 2. Base de Datos (SQL)
- **Relaciones:** Lo más importante es que un **Paciente** tiene muchos **Exámenes**. Esto se logra mediante una "Llave Foránea" (`FOREIGN KEY`).
- **Tablas:** Separamos los datos. No guardamos el nombre del paciente dentro de la orden del examen, solo guardamos su `ID` para evitar repetir datos (Normalización).

### 3. Backend (Propuesta)
- El backend actúa como el "puente" entre lo que el usuario escribe en el formulario y la base de datos. Recibe la información del HTML, la valida y la guarda en el SQL.

## 🚀 Cómo ejecutarlo
1. Navega a la carpeta `frontend/`.
2. Abre el archivo `index.html` en cualquier navegador (Chrome, Edge, Firefox).
3. Usa las credenciales: **Usuario:** `licenciada` | **Contraseña:** `danimar2026`.

---
*Desarrollado para fines académicos - Reproducción del prototipo Figma DANIMAR.*
