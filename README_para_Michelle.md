# Danimar 2 — Adaptación para la materia "Desarrollo de Software"

Esta carpeta contiene el contenido de Danimar adaptado al **repositorio de Spring Boot**
de tu equipo (https://github.com/ErickJH00/Desarrollo-de-software), respetando su modelo
y nomenclatura (`tmcategorias`, `tmexamenes`, `tmcampos`, etc.).

## Qué hay aquí

```
Danimar 2/
├── backend/src/main/resources/data.sql                  ← REEMPLAZA  catálogo REAL + costos
├── backend/src/main/java/com/danimar/model/
│   └── Examen.java                                       ← REEMPLAZA  (se le agregó el costo)
├── backend/src/main/java/com/danimar/dto/
│   ├── ExamenDTO.java  CampoDTO.java                     ← NUEVO
│   ├── CrearRegistroRequest.java  RegistroDTO.java       ← NUEVO
│   ├── ReporteDTO.java  ResultadoItem.java               ← NUEVO
├── backend/src/main/java/com/danimar/service/
│   └── ReporteService.java                               ← NUEVO  (costo total + armar reporte)
├── backend/src/main/java/com/danimar/controller/
│   ├── CategoriaController.java                          ← NUEVO  GET /api/categorias
│   ├── ExamenController.java                             ← NUEVO  GET /api/examenes[/categoria/{id}]
│   ├── CampoController.java                              ← NUEVO  GET /api/campos/examen/{id}
│   └── RegistroController.java                           ← NUEVO  órdenes y reportes
└── frontend/
    ├── pages/  catalogo.html  nueva-orden.html
    │           resultados.html  reporte.html            ← NUEVO
    └── assets/ catalogo.css/js  nueva-orden.js
                resultados.js  reporte.js                ← NUEVO
```

Todos los archivos respetan el modelo y la nomenclatura del backend de tu compañero
(paquete `com.danimar`, entidades `Categoria`/`Examen`/`Campo`/`Registro`/`Detalle`/`Resultado`,
repos con `findByCategoriaId`, `findByExamenId`, `findByRegistroId`, `findByDetalleId`).

**Dos archivos se REEMPLAZAN** (`data.sql` y `Examen.java`); el resto se **agrega**.

> ¿Por qué se reemplaza `Examen.java`? El modelo original no tenía precio en el examen, así
> que el "costo total" no se podía calcular. Se le agregó el campo `costo` (columna `costo_exa`),
> que se llena desde el catálogo real en `data.sql`. Es un cambio aditivo: no rompe nada del
> código existente.

## Módulo de órdenes y reportes (nuevo)

- `POST /api/registros` — crea una orden: `{ idPaciente, observaciones, idExamenes: [...] }`.
  Asigna el número consecutivo del día y devuelve el reporte.
- `GET /api/registros` — lista las órdenes con su costo total.
- `GET /api/registros/{id}/reporte` — reporte completo (paciente, exámenes, campos y costo total).
- `POST /api/registros/{id}/resultados` — guarda los valores: `[{ idDetalle, idCampo, valor }]`.
- `DELETE /api/registros/{id}` — elimina la orden con sus detalles y resultados.

Flujo en el frontend: **nueva-orden.html** (elige paciente + exámenes, ve el total) →
**resultados.html** (carga los valores) → **reporte.html** (reporte imprimible con costo total).

El archivo **`data.sql`** trae el catálogo completo del laboratorio:
- 5 categorías (Hematología, Otros Exámenes, Misceláneos, Hormonas y Endocrinología, Serología e Inmunología)
- 69 exámenes (con un código generado por categoría: HEM-001, OTR-001, etc.)
- 205 campos (parámetros) con su unidad y valor de referencia reales

Está escrito con el **mismo esquema** que usa el backend de tu compañero, así que solo hay
que **reemplazar** el archivo de ejemplo.

## Cómo aplicarlo (reemplazar y subir)

1. En el repositorio, reemplaza el archivo:
   `backend/src/main/resources/data.sql`
   por el de esta carpeta (misma ruta).

2. Como la base es H2 en archivo y se inicializa al arrancar, borra la base anterior para
   que cargue el catálogo nuevo desde cero:
   - Elimina la carpeta `backend/database/` (el archivo `bddanimar.*`).

3. Arranca el backend:
   ```
   cd backend
   ./mvnw spring-boot:run
   ```
   El servicio queda en http://localhost:8081

4. Sube los cambios a GitHub:
   ```
   git add backend/src/main/resources/data.sql
   git commit -m "Reemplazar data.sql con el catálogo real de Danimar"
   git push
   ```

## Notas

- **Códigos de examen:** el modelo (`tmexamenes`) exige un `codigo_exa` único; como el
  catálogo real no traía códigos, se generaron automáticamente por categoría (HEM-001…,
  OTR-001…, etc.). Si tu equipo prefiere otros códigos, se pueden cambiar fácilmente.
- **Referencias largas:** la columna `referencia` del modelo es `VARCHAR(150)`. Una sola
  referencia del catálogo (la de Gonadotropina por semanas) es más larga y se recortó a 150
  caracteres. Si quieres conservarla completa, hay que ampliar esa columna en `Campo.java`
  (por ejemplo a `length = 500`); avísame y te paso el cambio.

## Cómo probar el catálogo (backend + página web)

1. Coloca cada archivo nuevo en su ruta dentro del repo (las mismas que arriba) y reemplaza
   el `data.sql`. Borra `backend/database/` para recargar el catálogo.
2. Arranca el backend:
   ```
   cd backend
   ./mvnw spring-boot:run
   ```
   Prueba en el navegador: http://localhost:8081/api/categorias (debe devolver las 5 categorías).
3. Abre `frontend/pages/catalogo.html` con un servidor local (Live Server de VS Code, por
   ejemplo). Verás las categorías; al hacer clic se cargan los exámenes y, al elegir uno, sus
   parámetros con unidad y valor de referencia.

> El frontend apunta a `http://localhost:8081` (constante `API_BASE` en `catalogo.js`). Si
> despliegas el backend en un servidor público, cambia esa constante por su URL.

## Desplegar como sitio web con URL pública

GitHub aloja el código, pero no ejecuta el servidor Java. Para que sea un sitio web con URL
pública se despliega en un host. Aquí va todo configurado para que **un solo servicio** sirva
la API y las páginas (una sola URL).

Archivos de despliegue (en la raíz del repo):

```
Dockerfile        ← compila el backend e incluye el frontend en los estáticos
render.yaml       ← configuración para Render (gratis)
.dockerignore
```

El `Dockerfile` mete la carpeta `frontend/` dentro de `src/main/resources/static/`, así que al
desplegar, la misma URL sirve la página de inicio (`/`), el catálogo (`/pages/catalogo.html`)
y la API (`/api/...`). El frontend detecta solo si está desplegado o en local (no hay que tocar
nada).

### Opción A — Render (recomendada, con el render.yaml)

1. Sube todo el proyecto a GitHub (con el `Dockerfile` y `render.yaml` en la raíz).
2. Entra a https://render.com, crea una cuenta gratis y conéctala a tu GitHub.
3. **New + → Blueprint** → elige el repositorio. Render lee el `render.yaml` y crea el servicio.
4. Espera a que termine el build (unos minutos). Te dará una URL tipo
   `https://danimar.onrender.com` — esa es tu página.

### Opción B — Railway

1. Sube el proyecto a GitHub (con el `Dockerfile` en la raíz).
2. Entra a https://railway.app, crea cuenta y **New Project → Deploy from GitHub repo**.
3. Railway detecta el `Dockerfile` y despliega solo. En **Settings → Networking → Generate
   Domain** obtienes la URL pública.

### Notas

- La base es H2 en archivo; en estos hosts gratuitos el disco se reinicia en cada despliegue,
  así que la base se vuelve a cargar desde `data.sql` (catálogo siempre presente; las órdenes
  de prueba se reinician). Para datos permanentes habría que conectar una base externa
  (por ejemplo PostgreSQL gratis de Render/Railway); si lo necesitas, te lo configuro.
- Si prefieres separar frontend (GitHub Pages) y backend (Render), también se puede, pero la
  opción de una sola URL es más simple y evita problemas de CORS.
