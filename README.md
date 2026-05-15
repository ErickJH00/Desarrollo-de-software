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
