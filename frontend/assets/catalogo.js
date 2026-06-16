// ============================================================
// Catálogo de exámenes - consume la API REST del backend Danimar
// (Spring Boot en http://localhost:8081). Si despliegas el backend
// en otro servidor, cambia API_BASE por su URL pública.
// ============================================================
// Si se sirve desde el mismo servidor (despliegue), usa rutas relativas (/api).
// En desarrollo local con un servidor estático aparte, apunta al backend (puerto 8081).
const API_BASE = (location.hostname === "localhost" || location.hostname === "127.0.0.1")
  ? "http://localhost:8081/api"
  : "/api";

const $categorias = document.getElementById("lista-categorias");
const $examenes   = document.getElementById("lista-examenes");
const $tituloExa  = document.getElementById("titulo-examenes");
const $tablaCampos = document.getElementById("tabla-campos");
const $tituloCampos = document.getElementById("titulo-campos");

// Carga inicial: categorías
async function cargarCategorias() {
  try {
    const res = await fetch(`${API_BASE}/categorias`);
    const categorias = await res.json();
    $categorias.innerHTML = "";
    categorias.forEach(cat => {
      const li = document.createElement("li");
      li.textContent = cat.nombre;
      li.className = "item";
      li.onclick = () => {
        marcarActivo($categorias, li);
        cargarExamenes(cat.id, cat.nombre);
      };
      $categorias.appendChild(li);
    });
  } catch (e) {
    $categorias.innerHTML = `<li class="error">No se pudo conectar con el servidor.<br>¿Está corriendo el backend en ${API_BASE}?</li>`;
  }
}

// Exámenes de una categoría
async function cargarExamenes(idCat, nombreCat) {
  $tituloExa.textContent = `Exámenes · ${nombreCat}`;
  $examenes.innerHTML = `<li class="cargando">Cargando…</li>`;
  limpiarCampos();
  const res = await fetch(`${API_BASE}/examenes/categoria/${idCat}`);
  const examenes = await res.json();
  $examenes.innerHTML = "";
  if (examenes.length === 0) {
    $examenes.innerHTML = `<li class="vacio">Sin exámenes en esta categoría.</li>`;
    return;
  }
  examenes.forEach(ex => {
    const li = document.createElement("li");
    li.className = "item";
    li.innerHTML = `<span>${ex.nombre}</span><small>${ex.codigo || ""}</small>`;
    li.onclick = () => {
      marcarActivo($examenes, li);
      cargarCampos(ex.id, ex.nombre);
    };
    $examenes.appendChild(li);
  });
}

// Campos (parámetros) de un examen
async function cargarCampos(idExa, nombreExa) {
  $tituloCampos.textContent = `Parámetros · ${nombreExa}`;
  $tablaCampos.innerHTML = `<tr><td colspan="3" class="cargando">Cargando…</td></tr>`;
  const res = await fetch(`${API_BASE}/campos/examen/${idExa}`);
  const campos = await res.json();
  if (campos.length === 0) {
    $tablaCampos.innerHTML = `<tr><td colspan="3" class="vacio">Este examen no tiene parámetros registrados.</td></tr>`;
    return;
  }
  $tablaCampos.innerHTML = "";
  campos.forEach(c => {
    const tr = document.createElement("tr");
    tr.innerHTML = `<td>${c.nombre}</td><td>${c.unidad || "—"}</td><td>${c.referencia || "—"}</td>`;
    $tablaCampos.appendChild(tr);
  });
}

function limpiarCampos() {
  $tituloCampos.textContent = "Parámetros";
  $tablaCampos.innerHTML = `<tr><td colspan="3" class="vacio">Selecciona un examen para ver sus parámetros.</td></tr>`;
}

function marcarActivo(contenedor, elemento) {
  contenedor.querySelectorAll(".item").forEach(i => i.classList.remove("activo"));
  elemento.classList.add("activo");
}

cargarCategorias();
