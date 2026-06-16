// ============================================================
// Vista de reporte de resultados (solo lectura, imprimible).
// ============================================================
const API_BASE = (location.hostname === "localhost" || location.hostname === "127.0.0.1")
  ? "http://localhost:8081/api"
  : "/api";
const idRegistro = new URLSearchParams(location.search).get("id");
const $hoja = document.getElementById("hoja");

const fmt = n => Number(n || 0).toLocaleString("es-VE", {minimumFractionDigits: 2, maximumFractionDigits: 2});

async function cargar() {
  if (!idRegistro) { $hoja.textContent = "Falta el identificador de la orden."; return; }
  const rep = await (await fetch(`${API_BASE}/registros/${idRegistro}/reporte`)).json();

  const examenesHtml = rep.examenes.map(ex => `
    <h3 class="exam">${ex.nombreExamen}</h3>
    <table>
      <thead><tr><th style="width:40%">Parámetro</th><th>Resultado</th><th>Unidad</th><th>Referencia</th></tr></thead>
      <tbody>
        ${ex.campos.map(c => `
          <tr>
            <td>${c.nombre}</td>
            <td><strong>${c.valor || "—"}</strong></td>
            <td>${c.unidad || ""}</td>
            <td>${c.referencia || ""}</td>
          </tr>`).join("")}
      </tbody>
    </table>`).join("");

  $hoja.innerHTML = `
    <div class="enc">
      <h1>Laboratorio Clínico Danimar</h1>
      <p>Reporte de resultados</p>
    </div>
    <div class="datos">
      <span><b>Paciente:</b> ${rep.paciente}</span>
      <span><b>Cédula:</b> ${rep.cedula}</span>
      <span><b>Fecha:</b> ${rep.fecha}</span>
      <span><b>Orden N°:</b> ${rep.numeroDiario}</span>
    </div>
    ${examenesHtml}
    ${rep.observaciones ? `<p style="margin-top:16px"><b>Observaciones:</b> ${rep.observaciones}</p>` : ""}
    <div class="costo">Costo total: Bs. ${fmt(rep.costoTotal)}</div>
    <div class="firma"><div class="linea"></div>Bioanalista</div>`;
}

cargar();
