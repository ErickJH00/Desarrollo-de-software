// ============================================================
// Cargar resultados de una orden (registro).
// ============================================================
const API_BASE = (location.hostname === "localhost" || location.hostname === "127.0.0.1")
  ? "http://localhost:8081/api"
  : "/api";
const idRegistro = new URLSearchParams(location.search).get("id");

const $ficha = document.getElementById("ficha");
const $examenes = document.getElementById("examenes");

async function cargar() {
  if (!idRegistro) { $ficha.textContent = "Falta el identificador de la orden."; return; }
  const rep = await (await fetch(`${API_BASE}/registros/${idRegistro}/reporte`)).json();

  $ficha.innerHTML = `<b>Paciente:</b> ${rep.paciente} &nbsp; · &nbsp;
     <b>Cédula:</b> ${rep.cedula} &nbsp; · &nbsp;
     <b>Orden N°:</b> ${rep.numeroDiario} del ${rep.fecha}`;

  $examenes.innerHTML = rep.examenes.map(ex => `
    <div class="examen-bloque">
      <h3>${ex.nombreExamen}</h3>
      <table>
        ${ex.campos.map(c => `
          <tr>
            <td>${c.nombre}</td>
            <td><input type="text" data-iddetalle="${ex.idDetalle}" data-idcampo="${c.idCampo}"
                       value="${c.valor || ""}"></td>
            <td class="ref">${c.unidad || ""}</td>
            <td class="ref">${c.referencia || ""}</td>
          </tr>`).join("")}
      </table>
    </div>`).join("");
}

document.getElementById("btn-guardar").addEventListener("click", async () => {
  const items = [...document.querySelectorAll("input[data-idcampo]")].map(inp => ({
    idDetalle: Number(inp.dataset.iddetalle),
    idCampo: Number(inp.dataset.idcampo),
    valor: inp.value
  }));
  const res = await fetch(`${API_BASE}/registros/${idRegistro}/resultados`, {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(items)
  });
  if (res.ok) {
    alert("Resultados guardados.");
  } else {
    alert("No se pudieron guardar los resultados.");
  }
});

document.getElementById("btn-ver").addEventListener("click", () => {
  window.location.href = `reporte.html?id=${idRegistro}`;
});

cargar();
