# Sistema Web Danimar - Laboratorio Clinico

Sistema integral para la gestion, control y registro de analisis de sangre en el Laboratorio Danimar. Este proyecto automatiza el flujo operativo desde el ingreso del paciente hasta la emision de resultados finales.

## Descripcion del Proyecto

El Sistema Web Danimar es una plataforma local desarrollada para el Laboratorio Clinico Danimar en Villa del Rosario. El software digitaliza procesos que anteriormente eran manuales, centralizando la informacion en una base de datos local para eliminar errores de transcripcion y optimizar la gestion de cobros y saldos pendientes.

## Requerimientos Funcionales Principales

* Registro de Pacientes: Captura de datos personales y asignacion de numero consecutivo diario.
* Gestion de Examenes: Catalogo digital con calculo automatico de presupuestos.
* Registro de Pagos: Control de abonos y saldos pendientes integrados al expediente.
* Control de Muestras: Seguimiento de muestras biologicas (sangre, orina, heces).
* Registro de Resultados: Formulario de ingreso de datos con validacion de campos obligatorios.
* Generacion de Reportes: Creacion automatica de reportes de resultados para impresion.
* Consulta de Historial: Busqueda de expedientes por nombre, apellido o consecutivo.
* Autenticacion: Control de acceso mediante usuario y contraseña.

## Especificaciones Tecnicas

El sistema emplea una arquitectura Cliente-Servidor optimizada para funcionamiento offline en red local:

### Frontend
* HTML5 y CSS3: Interfaz diseñada para alta usabilidad en entornos laborales.
* JavaScript (ES6): Logica de interaccion y consumo de servicios mediante Fetch API.

### Backend y Datos
* Java 17 y Spring Boot 3: Framework principal para la logica de negocio.
* Spring Data JPA: Gestion de persistencia y mapeo objeto-relacional.
* SQLite: Base de datos local ligera, almacenada en un archivo para facilitar respaldos y portabilidad.

## Estructura del Directorio

ProyectoAnti/
├── frontend/             # Interfaz de usuario y archivos estaticos
│   ├── assets/           # CSS, JS e imagenes
│   ├── pages/            # Vistas: Login, Dashboard, Nuevo-Examen
│   └── index.html        # Punto de entrada de la aplicacion
├── backend/              # Logica de servidor y controladores API
├── database/             # Scripts de creacion y archivo de base de datos
└── README.md             # Documentacion del sistema

## Instalacion y Ejecucion Local

### 1. Requisitos
* Java JDK 17 o superior.
* Maven.
* Navegador web moderno.

### 2. Despliegue del Backend
Desde la terminal en el directorio del backend, ejecute:
./mvnw spring-boot:run

El servicio estara activo en http://localhost:8080.

### 3. Despliegue del Frontend
Se recomienda abrir el archivo index.html utilizando un servidor local (como Live Server) para evitar restricciones de politicas CORS al consumir la API local.

## Equipo de Trabajo

Proyecto desarrollado para la asignatura Base de Datos II - Ingenieria de Sistemas:

* Michelle Valentina Quintero Marquez
* Nick Andrey Piratoba Veloza
* Johan Camilo Bonett Velasquez

Universidad de Pamplona
Facultad de Ingenierias y Arquitectura
Villa del Rosario, 2026.
