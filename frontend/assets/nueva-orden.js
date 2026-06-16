// ============================================================
// Nueva orden: elige paciente + exámenes y crea la orden.
// ============================================================
const API_BASE = (location.hostname === "localhost" || location.hostname === "127.0.0.1")
  ? "http://localhost:8081/api"
  : "/api";

const $paciente = document.getElementById("paciente");
const $examenes = document.getElementById("examenes");
const $total = document.getElementById("total");
const $btn = document.getElementById("btn-crear");

const fmt = n => Number(n || 0).toLocaleString("es-VE", {minimumFractionDigits: 2, maximumFractionDigits: 2});

// Cargar pacientes en el desplegable
async function cargarPacientes() {
  const res = await fetch(`${API_BASE}/pacientes`);
  const pacientes = await res.json();
  $paciente.innerHTML = pacientes
    .map(p => `<option value="${p.id}">${p.nombreCompleto} — ${p.cedula}</option>`)
    .join("");
}

// Cargar exámenes agrupados por categoría, con checkbox y costo
async function cargarExamenes() {
  const cats = await (await fetch(`${API_BASE}/categorias`)).json();
  $examenes.innerHTML = "";
  for (const cat of cats) {
    const exs = await (await fetch(`${API_BASE}/examenes/categoria/${cat.id}`)).json();
    if (exs.length === 0) continue;
    const div = document.createElement("div");
    div.className = "grupo-exam";
    div.innerHTML = `<h3>${cat.nombre}</h3>` + exs.map(e => `
      <label class="opcion">
        <input type="checkbox" class="chk-exam" value="${e.id}" data-costo="${e.costo || 0}">
        <span>${e.nombre}</span>
        <small>Bs. ${fmt(e.costo)}</small>
      </label>`).join("");
    $examenes.appendChild(div);
  }
  $examenes.querySelectorAll(".chk-exam").forEach(c => c.addEventListener("change", calcularTotal));
}

function calcularTotal() {
  let total = 0;
  document.querySelectorAll(".chk-exam:checked").forEach(c => total += Number(c.dataset.costo));
  $total.textContent = fmt(total);
}

// Crear la orden
$btn.addEventListener("click", async () => {
  const idPaciente = Number($paciente.value);
  const idExamenes = [...document.querySelectorAll(".chk-exam:checked")].map(c => Number(c.value));
  if (!idPaciente) { alert("Selecciona un paciente."); return; }
  if (idExamenes.length === 0) { alert("Selecciona al menos un examen."); return; }

  const body = {
    idPaciente,
    observaciones: document.getElementById("observaciones").value,
    idExamenes
  };
  $btn.disabled = true;
  try {
    const res = await fetch(`${API_BASE}/registros`, {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(body)
    });
    if (!res.ok) throw new Error();
    const reporte = await res.json();
    // Ir a cargar los resultados de la orden recién creada
    window.location.href = `resultados.html?id=${reporte.idRegistro}`;
  } catch (e) {
    alert("No se pudo crear la orden. ¿Está corriendo el backend?");
    $btn.disabled = false;
  }
});

cargarPacientes();
cargarExamenes();
