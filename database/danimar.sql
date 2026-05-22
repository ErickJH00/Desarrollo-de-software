-- ============================================================
-- Proyecto ----------  Laboratorio Clínico Danimar
-- Asignatura --------  Proyecto de Grado
-- Fecha -------------  07/04/2026
-- Autora ------------  Lic. Iraides Marisol Quintero R.
-- Motor -------------  PostgreSQL
-- ============================================================


DROP DATABASE IF EXISTS bddanimar;
CREATE DATABASE bddanimar WITH ENCODING = 'UTF8';
\c bddanimar


-- ============================================================
-- TABLAS MAESTRAS (tm)
-- ============================================================

-- TABLA USUARIOS
-- Solo la licenciada accede al sistema (un único usuario activo)

CREATE TABLE tmusuarios (
    id_usu          SERIAL          PRIMARY KEY,
    usuario         VARCHAR(60)     NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255)    NOT NULL
);

INSERT INTO tmusuarios VALUES (DEFAULT, 'marisolquintero', 'danielita123');

--SELECT * FROM tmusuarios;


-- TABLA PACIENTES

CREATE TABLE tmpacientes (
    id_pac          SERIAL          PRIMARY KEY,
    cedula          VARCHAR(20)     NOT NULL UNIQUE,
    nombre_completo VARCHAR(150)    NOT NULL
);

INSERT INTO tmpacientes VALUES (DEFAULT, '29636040',  'Manuel Torres');
INSERT INTO tmpacientes VALUES (DEFAULT, '15774151',  'Michelle Quintero');
INSERT INTO tmpacientes VALUES (DEFAULT, '27636560',  'Sarah Mora');
INSERT INTO tmpacientes VALUES (DEFAULT, '29636333',  'David Quintero');
INSERT INTO tmpacientes VALUES (DEFAULT, '11074152',  'Kevin Moreno');
INSERT INTO tmpacientes VALUES (DEFAULT, '27634360',  'Camilo Peña');
INSERT INTO tmpacientes VALUES (DEFAULT, '85423971',  'Carlos Perez');
INSERT INTO tmpacientes VALUES (DEFAULT, '98765432',  'Andres Rojas');
INSERT INTO tmpacientes VALUES (DEFAULT, '75683921',  'Jorge Ramirez');
INSERT INTO tmpacientes VALUES (DEFAULT, '66554433',  'Luis Fernandez');
INSERT INTO tmpacientes VALUES (DEFAULT, '90817263',  'Pedro Sanchez');
INSERT INTO tmpacientes VALUES (DEFAULT, '77889966',  'Miguel Castro');

--SELECT * FROM tmpacientes;


-- TABLA CATEGORÍAS DE EXAMEN

CREATE TABLE tmcategorias (
    id_cat      SERIAL          PRIMARY KEY,
    nombre_cat  VARCHAR(100)    NOT NULL UNIQUE
);

INSERT INTO tmcategorias VALUES (1, 'HEMATOLOGÍA');
INSERT INTO tmcategorias VALUES (2, 'QUÍMICA SANGUÍNEA');
INSERT INTO tmcategorias VALUES (3, 'INMUNOLOGÍA / SEROLOGÍA');
INSERT INTO tmcategorias VALUES (4, 'MICROBIOLOGÍA');
INSERT INTO tmcategorias VALUES (5, 'HORMONALES');
INSERT INTO tmcategorias VALUES (6, 'ORINA Y HECES');

--SELECT * FROM tmcategorias;


-- TABLA EXÁMENES

CREATE TABLE tmexamenes (
    id_exa      SERIAL          PRIMARY KEY,
    fkid_cat    INTEGER         NOT NULL,
    nombre_exa  VARCHAR(150)    NOT NULL,
    codigo_exa  VARCHAR(30)     UNIQUE,
    FOREIGN KEY (fkid_cat) REFERENCES tmcategorias(id_cat)
);
-- HEMATOLOGÍA
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'HEMATOLOGÍA COMPLETA CON PLAQUETAS',    'HEM-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'CONTAJE DE LEUCOCITOS',                 'HEM-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'HEMOGLOBINA / HEMATOCRITO',             'HEM-003');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'COOMBS DIRECTO O INDIRECTO',            'HEM-004');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'CONTAJE DE PLAQUETAS',                  'HEM-005');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'CONTAJE DE RETICULOCITOS',              'HEM-006');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'CONTAJE DE EOSINÓFILOS EN SANGRE',      'HEM-007');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'CONTAJE DE EOSINÓFILOS EN MOCO NASAL', 'HEM-008');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'VELOCIDAD DE SEDIMENTACIÓN',            'HEM-009');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'FROTIS DE SANGRE PERIFÉRICA',           'HEM-010');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'HEMOPARÁSITO (GOTA GRUESA)',            'HEM-011');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'HEMOGLOBINA GLICOSILADA A1C',           'HEM-012');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'GRUPO SANGUÍNEO FACTOR RH',             'HEM-013');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'TIEMPO DE PROTROMBINA (TP)',            'HEM-014');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'TIEMPO PARCIAL DE TROMBOPLASTINA',      'HEM-015');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'RNI',                                   'HEM-016');
INSERT INTO tmexamenes VALUES (DEFAULT, 1, 'FIBRINÓGENO',                           'HEM-017');

-- QUÍMICA SANGUÍNEA
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'GLICEMIA BASAL',                        'QUI-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'GLICEMIA BASAL Y POST PRANDIAL',        'QUI-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'GLICEMIA BASAL Y POST CARGA',           'QUI-003');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'TEST DE O SULLIVAN',                    'QUI-004');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'COLESTEROL TOTAL',                      'QUI-005');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'COLESTEROL HDL, LDL, VLDL',            'QUI-006');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'TRIGLICÉRIDOS',                         'QUI-007');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'ÁCIDO ÚRICO',                           'QUI-008');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'UREA',                                  'QUI-009');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'CREATININA',                            'QUI-010');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'TGO',                                   'QUI-011');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'TGP',                                   'QUI-012');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'BILIRRUBINA TOTAL Y FRACCIONADA',       'QUI-013');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'CALCIO SÉRICO',                         'QUI-014');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'FÓSFORO SÉRICO',                        'QUI-015');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'SODIO Y POTASIO SÉRICO',               'QUI-016');
INSERT INTO tmexamenes VALUES (DEFAULT, 2, 'MAGNESIO',                              'QUI-017');

-- INMUNOLOGÍA / SEROLOGÍA
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'DENGUE IGG / IGM',                     'INM-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'TOXOPLASMA IGG / IGM',                 'INM-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'HEPATITIS B (HBsAg)',                  'INM-003');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'VIH (ELISA)',                          'INM-004');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'VDRL / RPR (SÍFILIS)',                 'INM-005');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'PROTEÍNA C REACTIVA (PCR)',            'INM-006');
INSERT INTO tmexamenes VALUES (DEFAULT, 3, 'FACTOR REUMATOIDE',                    'INM-007');

-- MICROBIOLOGÍA
INSERT INTO tmexamenes VALUES (DEFAULT, 4, 'UROCULTIVO',                           'MIC-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 4, 'CULTIVO DE SECRECIÓN',                 'MIC-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 4, 'GRAM DIRECTO',                         'MIC-003');

-- HORMONALES
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'TSH',                                  'HOR-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'T3 / T4',                              'HOR-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'FSH / LH',                             'HOR-003');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'PROLACTINA',                           'HOR-004');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'TESTOSTERONA TOTAL',                   'HOR-005');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'ESTRADIOL',                            'HOR-006');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'PROGESTERONA',                         'HOR-007');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'CORTISOL',                             'HOR-008');
INSERT INTO tmexamenes VALUES (DEFAULT, 5, 'INSULINA',                             'HOR-009');

-- ORINA Y HECES
INSERT INTO tmexamenes VALUES (DEFAULT, 6, 'UROANÁLISIS COMPLETO',                 'ORI-001');
INSERT INTO tmexamenes VALUES (DEFAULT, 6, 'UROCULTIVO CON ANTIBIOGRAMA',          'ORI-002');
INSERT INTO tmexamenes VALUES (DEFAULT, 6, 'COPROANÁLISIS',                        'ORI-003');
INSERT INTO tmexamenes VALUES (DEFAULT, 6, 'COPROCULTIVO',                         'ORI-004');
INSERT INTO tmexamenes VALUES (DEFAULT, 6, 'TEST DE GRAHAM (OXIUROS)',             'ORI-005');

--SELECT * FROM tmexamenes;


-- TABLA CAMPOS DE EXAMEN
-- Define los parámetros de cada examen con sus unidades y valores de referencia.
-- El campo "orden" controla el orden de aparición en el reporte.

CREATE TABLE tmcampos (
    id_cam      SERIAL          PRIMARY KEY,
    fkid_exa    INTEGER         NOT NULL,
    nombre_cam  VARCHAR(100)    NOT NULL,
    unidad      VARCHAR(50),
    referencia  VARCHAR(150),
    FOREIGN KEY (fkid_exa) REFERENCES tmexamenes(id_exa)
);

-- Campos: HEMATOLOGÍA COMPLETA CON PLAQUETAS (id_exa = 1)
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Hematocrito',          '%',        '37-47 (F) / 42-52 (M)');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Hemoglobina',          'gr/dl',    '12-16 (F) / 14-18 (M)');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'VSG 1H',               'mm/h',     '0-20');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'VSG 2H',               'mm/h',     '0-40');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Coombs directo',       NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Coombs indirecto',     NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Plaquetas',            'xmm3',     '150.000 - 400.000 Xmm3');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Leucocitos',           'xmm3',     '4.000 - 10.000 Xmm3');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Neutrófilos',          '%',        '55-70');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Cayados',              '%',        '0-5');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Linfocitos',           '%',        '20-40');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Eosinófilos',          '%',        '1-4');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Monocitos',            '%',        '2-8');
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Basófilos',            '%',        '0-1');

-- Campos: CONTAJE DE LEUCOCITOS (id_exa = 2)
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Leucocitos',           'xmm3',     '4.000 - 10.000 Xmm3');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Neutrófilos',          '%',        '55-70');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Cayados',              '%',        '0-5');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Linfocitos',           '%',        '20-40');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Eosinófilos',          '%',        '1-4');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Monocitos',            '%',        '2-8');
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Basófilos',            '%',        '0-1');

-- Campos: HEMOGLOBINA / HEMATOCRITO (id_exa = 3)
INSERT INTO tmcampos VALUES (DEFAULT, 3, 'Hematocrito',          '%',        '37-47 (F) / 42-52 (M)');
INSERT INTO tmcampos VALUES (DEFAULT, 3, 'Hemoglobina',          'gr/dl',    '12-16 (F) / 14-18 (M)');

-- Campos: COOMBS DIRECTO O INDIRECTO (id_exa = 4)
INSERT INTO tmcampos VALUES (DEFAULT, 4, 'Coombs directo',       NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 4, 'Coombs indirecto',     NULL,       'Negativo');

-- Campos: CONTAJE DE PLAQUETAS (id_exa = 5)
INSERT INTO tmcampos VALUES (DEFAULT, 5, 'Plaquetas',            'xmm3',     '150.000 - 400.000 Xmm3');

-- Campos: VELOCIDAD DE SEDIMENTACIÓN (id_exa = 9)
INSERT INTO tmcampos VALUES (DEFAULT, 9, 'VSG 1H',               'mm/h',     '0-20');
INSERT INTO tmcampos VALUES (DEFAULT, 9, 'VSG 2H',               'mm/h',     '0-40');

-- Campos: TIEMPO DE PROTROMBINA (id_exa = 14)
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Tiempo de protrombina',           'seg',  '11-14');
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Control protrombina',             'seg',  NULL);
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Actividad protrombínica',         '%',    '70-130');
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'INR',                             NULL,   '0.8-1.2');
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Razón',                           NULL,   NULL);

-- Campos: TIEMPO PARCIAL DE TROMBOPLASTINA (id_exa = 15)
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de tromboplastina activa', 'seg',  '25-35');
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Control tromboplastina',          'seg',  NULL);
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de coagulación',           NULL,   '5-10 min');
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de sangría',               NULL,   '1-3 min');

-- Campos: GLICEMIA BASAL (id_exa = 18)
INSERT INTO tmcampos VALUES (DEFAULT, 18, 'Glicemia basal',      'mg/dl',    '70-100');

-- Campos: COLESTEROL TOTAL (id_exa = 22)
INSERT INTO tmcampos VALUES (DEFAULT, 22, 'Colesterol total',    'mg/dl',    '< 200');

-- Campos: COLESTEROL HDL, LDL, VLDL (id_exa = 23)
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'Colesterol total',    'mg/dl',    '< 200');
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'HDL',                 'mg/dl',    '> 40 (M) / > 50 (F)');
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'LDL',                 'mg/dl',    '< 130');
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'VLDL',                'mg/dl',    '< 30');

-- Campos: TRIGLICÉRIDOS (id_exa = 24)
INSERT INTO tmcampos VALUES (DEFAULT, 24, 'Triglicéridos',       'mg/dl',    '< 150');

-- Campos: ÁCIDO ÚRICO (id_exa = 25)
INSERT INTO tmcampos VALUES (DEFAULT, 25, 'Ácido úrico',         'mg/dl',    '3.5-7.2 (M) / 2.6-6.0 (F)');

-- Campos: UREA (id_exa = 26)
INSERT INTO tmcampos VALUES (DEFAULT, 26, 'Urea',                'mg/dl',    '15-45');

-- Campos: CREATININA (id_exa = 27)
INSERT INTO tmcampos VALUES (DEFAULT, 27, 'Creatinina',          'mg/dl',    '0.7-1.3 (M) / 0.5-1.1 (F)');

-- Campos: TGO (id_exa = 28)
INSERT INTO tmcampos VALUES (DEFAULT, 28, 'TGO',                 'U/L',      '10-40');

-- Campos: TGP (id_exa = 29)
INSERT INTO tmcampos VALUES (DEFAULT, 29, 'TGP',                 'U/L',      '7-56');

-- Campos: BILIRRUBINA TOTAL Y FRACCIONADA (id_exa = 30)
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina total',   'mg/dl',    '0.2-1.2');
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina directa', 'mg/dl',    '0.0-0.3');
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina indirecta','mg/dl',   '0.2-0.9');

-- Campos: TSH (id_exa = 37)
INSERT INTO tmcampos VALUES (DEFAULT, 37, 'TSH',                 'uUI/mL',   '0.4-4.0');

-- Campos: T3 / T4 (id_exa = 38)
INSERT INTO tmcampos VALUES (DEFAULT, 38, 'T3 libre',            'pg/mL',    '2.3-4.2');
INSERT INTO tmcampos VALUES (DEFAULT, 38, 'T4 libre',            'ng/dL',    '0.89-1.76');

-- Campos: PROLACTINA (id_exa = 41)
INSERT INTO tmcampos VALUES (DEFAULT, 41, 'Prolactina',          'ng/mL',    '4-23 (F) / 3-15 (M)');

-- Campos: UROANÁLISIS COMPLETO (id_exa = 46)
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Color',               NULL,       'Amarillo pálido');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Aspecto',             NULL,       'Claro');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'pH',                  NULL,       '4.5-8.0');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Densidad',            NULL,       '1.005-1.030');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Proteínas',           NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Glucosa',             NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Cetonas',             NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Bilirrubina',         NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Sangre',              NULL,       'Negativo');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Leucocitos',          'x campo',  '0-5');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Eritrocitos',         'x campo',  '0-2');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Cilindros',           NULL,       'Ausentes');
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'Bacterias',           NULL,       'Escasas');

-- Campos: COPROANÁLISIS (id_exa = 48)
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Color',               NULL,       'Pardo');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Consistencia',        NULL,       'Blanda');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Moco',                NULL,       'Ausente');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Sangre',              NULL,       'Ausente');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Leucocitos',          'x campo',  '0-5');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Eritrocitos',         'x campo',  'Ausentes');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Parásitos',           NULL,       'No se observan');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Quistes',             NULL,       'No se observan');
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Levaduras',           NULL,       'Escasas');                     9);

--SELECT * FROM tmcampos;


-- ============================================================
-- TABLAS DE DETALLE / TRANSACCIONALES (td)
-- ============================================================

-- TABLA REGISTRO DE ATENCIÓN
-- Representa cada visita de un paciente al laboratorio.

CREATE TABLE tdregistro (
    id_reg          SERIAL          PRIMARY KEY,
    fkid_pac        INTEGER         NOT NULL,
    fecha_aten      DATE            NOT NULL DEFAULT CURRENT_DATE,
    numero_diario   INTEGER         NOT NULL,
    observaciones   TEXT,
    FOREIGN KEY (fkid_pac) REFERENCES tmpacientes(id_pac),
    UNIQUE (fecha_aten, numero_diario)
);

INSERT INTO tdregistro VALUES (DEFAULT, 1,  '2026-03-01', 1,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 2,  '2026-03-01', 2,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 3,  '2026-03-02', 1,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 4,  '2026-03-02', 2,  'Paciente en ayunas desde las 8pm');
INSERT INTO tdregistro VALUES (DEFAULT, 5,  '2026-03-05', 1,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 6,  '2026-03-05', 2,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 7,  '2026-03-10', 1,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 8,  '2026-03-10', 2,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 9,  '2026-03-15', 1,  'Muestra de orina entregada');
INSERT INTO tdregistro VALUES (DEFAULT, 10, '2026-03-15', 2,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 11, '2026-04-01', 1,  NULL);
INSERT INTO tdregistro VALUES (DEFAULT, 1,  '2026-04-06', 1,  NULL);

--SELECT * FROM tdregistro;


-- TABLA DETALLE DE EXAMEN
-- Exámenes seleccionados en cada registro de atención.

CREATE TABLE tddetalle (
    id_det      SERIAL      PRIMARY KEY,
    fkid_reg    INTEGER     NOT NULL,
    fkid_exa    INTEGER     NOT NULL,
    FOREIGN KEY (fkid_reg) REFERENCES tdregistro(id_reg),
    FOREIGN KEY (fkid_exa) REFERENCES tmexamenes(id_exa),
    UNIQUE (fkid_reg, fkid_exa)
);

-- Registro 1  (Manuel Torres, 2026-03-01): Hematología completa + Glicemia
INSERT INTO tddetalle VALUES (DEFAULT, 1, 1);
INSERT INTO tddetalle VALUES (DEFAULT, 1, 18);

-- Registro 2  (Michelle Quintero, 2026-03-01): TSH + T3/T4
INSERT INTO tddetalle VALUES (DEFAULT, 2, 37);
INSERT INTO tddetalle VALUES (DEFAULT, 2, 38);

-- Registro 3  (Sarah Mora, 2026-03-02): Colesterol HDL/LDL/VLDL + Triglicéridos
INSERT INTO tddetalle VALUES (DEFAULT, 3, 23);
INSERT INTO tddetalle VALUES (DEFAULT, 3, 24);

-- Registro 4  (David Quintero, 2026-03-02): TP + TPT
INSERT INTO tddetalle VALUES (DEFAULT, 4, 14);
INSERT INTO tddetalle VALUES (DEFAULT, 4, 15);

-- Registro 5  (Kevin Moreno, 2026-03-05): Uroanálisis + Coproanálisis
INSERT INTO tddetalle VALUES (DEFAULT, 5, 46);
INSERT INTO tddetalle VALUES (DEFAULT, 5, 48);

-- Registro 6  (Camilo Peña, 2026-03-05): Hematología completa
INSERT INTO tddetalle VALUES (DEFAULT, 6, 1);

-- Registro 7  (Carlos Perez, 2026-03-10): TGO + TGP + Bilirrubina
INSERT INTO tddetalle VALUES (DEFAULT, 7, 28);
INSERT INTO tddetalle VALUES (DEFAULT, 7, 29);
INSERT INTO tddetalle VALUES (DEFAULT, 7, 30);

-- Registro 8  (Andres Rojas, 2026-03-10): Ácido úrico + Creatinina + Urea
INSERT INTO tddetalle VALUES (DEFAULT, 8, 25);
INSERT INTO tddetalle VALUES (DEFAULT, 8, 26);
INSERT INTO tddetalle VALUES (DEFAULT, 8, 27);

-- Registro 9  (Jorge Ramirez, 2026-03-15): Uroanálisis
INSERT INTO tddetalle VALUES (DEFAULT, 9, 46);

-- Registro 10 (Luis Fernandez, 2026-03-15): Glicemia + Triglicéridos + Colesterol
INSERT INTO tddetalle VALUES (DEFAULT, 10, 18);
INSERT INTO tddetalle VALUES (DEFAULT, 10, 24);
INSERT INTO tddetalle VALUES (DEFAULT, 10, 22);

-- Registro 11 (Pedro Sanchez, 2026-04-01): Prolactina + TSH
INSERT INTO tddetalle VALUES (DEFAULT, 11, 41);
INSERT INTO tddetalle VALUES (DEFAULT, 11, 37);

-- Registro 12 (Manuel Torres, 2026-04-06): Glicemia basal
INSERT INTO tddetalle VALUES (DEFAULT, 12, 18);

--SELECT * FROM tddetalle;


-- TABLA RESULTADOS
-- Valores ingresados por la licenciada para cada campo de cada examen.

CREATE TABLE tdresultados (
    id_res      SERIAL          PRIMARY KEY,
    fkid_det    INTEGER         NOT NULL,
    fkid_cam    INTEGER         NOT NULL,
    valor       VARCHAR(100),
    fecha_reg   TIMESTAMP       NOT NULL DEFAULT NOW(),
    FOREIGN KEY (fkid_det) REFERENCES tddetalle(id_det),
    FOREIGN KEY (fkid_cam) REFERENCES tmcampos(id_cam),
    UNIQUE (fkid_det, fkid_cam)
);

-- Resultados det 1: Hematología completa (Manuel Torres, 2026-03-01)
INSERT INTO tdresultados VALUES (DEFAULT, 1, 1,  '42',       NOW());  -- Hematocrito
INSERT INTO tdresultados VALUES (DEFAULT, 1, 2,  '14.2',     NOW());  -- Hemoglobina
INSERT INTO tdresultados VALUES (DEFAULT, 1, 3,  '8',        NOW());  -- VSG 1H
INSERT INTO tdresultados VALUES (DEFAULT, 1, 4,  '18',       NOW());  -- VSG 2H
INSERT INTO tdresultados VALUES (DEFAULT, 1, 5,  'Negativo', NOW());  -- Coombs directo
INSERT INTO tdresultados VALUES (DEFAULT, 1, 6,  'Negativo', NOW());  -- Coombs indirecto
INSERT INTO tdresultados VALUES (DEFAULT, 1, 7,  '220000',   NOW());  -- Plaquetas
INSERT INTO tdresultados VALUES (DEFAULT, 1, 8,  '7200',     NOW());  -- Leucocitos
INSERT INTO tdresultados VALUES (DEFAULT, 1, 9,  '62',       NOW());  -- Neutrófilos
INSERT INTO tdresultados VALUES (DEFAULT, 1, 10, '2',        NOW());  -- Cayados
INSERT INTO tdresultados VALUES (DEFAULT, 1, 11, '30',       NOW());  -- Linfocitos
INSERT INTO tdresultados VALUES (DEFAULT, 1, 12, '2',        NOW());  -- Eosinófilos
INSERT INTO tdresultados VALUES (DEFAULT, 1, 13, '3',        NOW());  -- Monocitos
INSERT INTO tdresultados VALUES (DEFAULT, 1, 14, '1',        NOW());  -- Basófilos

-- Resultados det 2: Glicemia basal (Manuel Torres, 2026-03-01)
INSERT INTO tdresultados VALUES (DEFAULT, 2, 70, '88',       NOW());  -- Glicemia basal

-- Resultados det 3: TSH (Michelle Quintero, 2026-03-01)
INSERT INTO tdresultados VALUES (DEFAULT, 3, 97, '2.1',      NOW());  -- TSH

-- Resultados det 4: T3/T4 (Michelle Quintero, 2026-03-01)
INSERT INTO tdresultados VALUES (DEFAULT, 4, 98, '3.5',      NOW());  -- T3 libre
INSERT INTO tdresultados VALUES (DEFAULT, 4, 99, '1.1',      NOW());  -- T4 libre

-- Resultados det 5: Colesterol HDL/LDL/VLDL (Sarah Mora, 2026-03-02)
INSERT INTO tdresultados VALUES (DEFAULT, 5, 82, '185',      NOW());  -- Colesterol total
INSERT INTO tdresultados VALUES (DEFAULT, 5, 83, '55',       NOW());  -- HDL
INSERT INTO tdresultados VALUES (DEFAULT, 5, 84, '110',      NOW());  -- LDL
INSERT INTO tdresultados VALUES (DEFAULT, 5, 85, '20',       NOW());  -- VLDL

-- Resultados det 6: Triglicéridos (Sarah Mora, 2026-03-02)
INSERT INTO tdresultados VALUES (DEFAULT, 6, 86, '130',      NOW());  -- Triglicéridos

-- Resultados det 7: Tiempo de protrombina (David Quintero, 2026-03-02)
INSERT INTO tdresultados VALUES (DEFAULT, 7, 40, '13',       NOW());  -- TP
INSERT INTO tdresultados VALUES (DEFAULT, 7, 41, '12',       NOW());  -- Control
INSERT INTO tdresultados VALUES (DEFAULT, 7, 42, '95',       NOW());  -- Actividad
INSERT INTO tdresultados VALUES (DEFAULT, 7, 43, '1.08',     NOW());  -- INR
INSERT INTO tdresultados VALUES (DEFAULT, 7, 44, '1.0',      NOW());  -- Razón

--SELECT * FROM tdresultados;

-- ============================================================
-- CORRECCIÓN DE tmcampos Y tdresultados
-- Laboratorio Clínico Danimar
-- Ejecutar estando conectado a bddanimar
-- ============================================================

-- Limpiar datos incorrectos
TRUNCATE TABLE tdresultados RESTART IDENTITY CASCADE;
TRUNCATE TABLE tmcampos    RESTART IDENTITY CASCADE;


-- ============================================================
-- INSERTAR tmcampos CON IDs REALES DE tmexamenes
-- ============================================================

-- HEMATOLOGÍA COMPLETA CON PLAQUETAS (id_exa = 1)
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Hematocrito',           '%',      '37-47 (F) / 42-52 (M)',   1);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Hemoglobina',           'gr/dl',  '12-16 (F) / 14-18 (M)',   2);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'VSG 1H',                'mm/h',   '0-20',                    3);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'VSG 2H',                'mm/h',   '0-40',                    4);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Coombs directo',        NULL,     'Negativo',                5);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Coombs indirecto',      NULL,     'Negativo',                6);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Plaquetas',             'xmm3',   '150.000 - 400.000 Xmm3', 7);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Leucocitos',            'xmm3',   '4.000 - 10.000 Xmm3',    8);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Neutrófilos',           '%',      '55-70',                   9);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Cayados',               '%',      '0-5',                    10);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Linfocitos',            '%',      '20-40',                  11);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Eosinófilos',           '%',      '1-4',                    12);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Monocitos',             '%',      '2-8',                    13);
INSERT INTO tmcampos VALUES (DEFAULT, 1, 'Basófilos',             '%',      '0-1',                    14);

-- CONTAJE DE LEUCOCITOS (id_exa = 2)
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Leucocitos',            'xmm3',   '4.000 - 10.000 Xmm3',    1);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Neutrófilos',           '%',      '55-70',                   2);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Cayados',               '%',      '0-5',                     3);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Linfocitos',            '%',      '20-40',                   4);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Eosinófilos',           '%',      '1-4',                     5);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Monocitos',             '%',      '2-8',                     6);
INSERT INTO tmcampos VALUES (DEFAULT, 2, 'Basófilos',             '%',      '0-1',                     7);

-- HEMOGLOBINA / HEMATOCRITO (id_exa = 3)
INSERT INTO tmcampos VALUES (DEFAULT, 3, 'Hematocrito',           '%',      '37-47 (F) / 42-52 (M)',   1);
INSERT INTO tmcampos VALUES (DEFAULT, 3, 'Hemoglobina',           'gr/dl',  '12-16 (F) / 14-18 (M)',   2);

-- COOMBS DIRECTO O INDIRECTO (id_exa = 4)
INSERT INTO tmcampos VALUES (DEFAULT, 4, 'Coombs directo',        NULL,     'Negativo',                1);
INSERT INTO tmcampos VALUES (DEFAULT, 4, 'Coombs indirecto',      NULL,     'Negativo',                2);

-- CONTAJE DE PLAQUETAS (id_exa = 5)
INSERT INTO tmcampos VALUES (DEFAULT, 5, 'Plaquetas',             'xmm3',   '150.000 - 400.000 Xmm3', 1);

-- VELOCIDAD DE SEDIMENTACIÓN (id_exa = 9)
INSERT INTO tmcampos VALUES (DEFAULT, 9, 'VSG 1H',                'mm/h',   '0-20',                    1);
INSERT INTO tmcampos VALUES (DEFAULT, 9, 'VSG 2H',                'mm/h',   '0-40',                    2);

-- TIEMPO DE PROTROMBINA (id_exa = 14)
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Tiempo de protrombina',       'seg', '11-14',    1);
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Control protrombina',         'seg', NULL,       2);
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Actividad protrombínica',     '%',   '70-130',   3);
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'INR',                         NULL,  '0.8-1.2',  4);
INSERT INTO tmcampos VALUES (DEFAULT, 14, 'Razón',                       NULL,  NULL,       5);

-- TIEMPO PARCIAL DE TROMBOPLASTINA (id_exa = 15)
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de tromboplastina',    'seg', '25-35',    1);
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Control tromboplastina',      'seg', NULL,       2);
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de coagulación',       NULL,  '5-10 min', 3);
INSERT INTO tmcampos VALUES (DEFAULT, 15, 'Tiempo de sangría',           NULL,  '1-3 min',  4);

-- GLICEMIA BASAL (id_exa = 18)
INSERT INTO tmcampos VALUES (DEFAULT, 18, 'Glicemia basal',        'mg/dl', '70-100',                  1);

-- COLESTEROL TOTAL (id_exa = 22)
INSERT INTO tmcampos VALUES (DEFAULT, 22, 'Colesterol total',      'mg/dl', '< 200',                   1);

-- COLESTEROL HDL, LDL, VLDL (id_exa = 23)
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'Colesterol total',      'mg/dl', '< 200',                   1);
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'HDL',                   'mg/dl', '> 40 (M) / > 50 (F)',     2);
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'LDL',                   'mg/dl', '< 130',                   3);
INSERT INTO tmcampos VALUES (DEFAULT, 23, 'VLDL',                  'mg/dl', '< 30',                    4);

-- TRIGLICÉRIDOS (id_exa = 24)
INSERT INTO tmcampos VALUES (DEFAULT, 24, 'Triglicéridos',         'mg/dl', '< 150',                   1);

-- ÁCIDO ÚRICO (id_exa = 25)
INSERT INTO tmcampos VALUES (DEFAULT, 25, 'Ácido úrico',           'mg/dl', '3.5-7.2 (M) / 2.6-6.0 (F)', 1);

-- UREA (id_exa = 26)
INSERT INTO tmcampos VALUES (DEFAULT, 26, 'Urea',                  'mg/dl', '15-45',                   1);

-- CREATININA (id_exa = 27)
INSERT INTO tmcampos VALUES (DEFAULT, 27, 'Creatinina',            'mg/dl', '0.7-1.3 (M) / 0.5-1.1 (F)', 1);

-- TGO (id_exa = 28)
INSERT INTO tmcampos VALUES (DEFAULT, 28, 'TGO',                   'U/L',   '10-40',                   1);

-- TGP (id_exa = 29)
INSERT INTO tmcampos VALUES (DEFAULT, 29, 'TGP',                   'U/L',   '7-56',                    1);

-- BILIRRUBINA TOTAL Y FRACCIONADA (id_exa = 30)
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina total',     'mg/dl', '0.2-1.2',                 1);
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina directa',   'mg/dl', '0.0-0.3',                 2);
INSERT INTO tmcampos VALUES (DEFAULT, 30, 'Bilirrubina indirecta', 'mg/dl', '0.2-0.9',                 3);

-- TSH (id_exa = 45)
INSERT INTO tmcampos VALUES (DEFAULT, 45, 'TSH',                   'uUI/mL','0.4-4.0',                 1);

-- T3 / T4 (id_exa = 46)
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'T3 libre',              'pg/mL', '2.3-4.2',                 1);
INSERT INTO tmcampos VALUES (DEFAULT, 46, 'T4 libre',              'ng/dL', '0.89-1.76',               2);

-- PROLACTINA (id_exa = 48)
INSERT INTO tmcampos VALUES (DEFAULT, 48, 'Prolactina',            'ng/mL', '4-23 (F) / 3-15 (M)',     1);

-- UROANÁLISIS COMPLETO (id_exa = 54)
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Color',                 NULL,    'Amarillo pálido',          1);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Aspecto',               NULL,    'Claro',                    2);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'pH',                    NULL,    '4.5-8.0',                  3);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Densidad',              NULL,    '1.005-1.030',              4);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Proteínas',             NULL,    'Negativo',                 5);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Glucosa',               NULL,    'Negativo',                 6);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Cetonas',               NULL,    'Negativo',                 7);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Bilirrubina',           NULL,    'Negativo',                 8);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Sangre',                NULL,    'Negativo',                 9);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Leucocitos',            'x campo','0-5',                    10);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Eritrocitos',           'x campo','0-2',                    11);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Cilindros',             NULL,    'Ausentes',                12);
INSERT INTO tmcampos VALUES (DEFAULT, 54, 'Bacterias',             NULL,    'Escasas',                 13);

-- COPROANÁLISIS (id_exa = 56)
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Color',                 NULL,    'Pardo',                    1);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Consistencia',          NULL,    'Blanda',                   2);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Moco',                  NULL,    'Ausente',                  3);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Sangre',                NULL,    'Ausente',                  4);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Leucocitos',            'x campo','0-5',                     5);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Eritrocitos',           'x campo','Ausentes',                6);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Parásitos',             NULL,    'No se observan',           7);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Quistes',               NULL,    'No se observan',           8);
INSERT INTO tmcampos VALUES (DEFAULT, 56, 'Levaduras',             NULL,    'Escasas',                  9);

--SELECT * FROM tmcampos ORDER BY fkid_exa, orden;


-- ============================================================
-- INSERTAR tdresultados USANDO SUBCONSULTAS (sin IDs hardcodeados)
-- ============================================================

-- det 1: Hematología completa (Manuel Torres, 2026-03-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '42',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Hematocrito';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '14.2',     NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Hemoglobina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '8',        NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'VSG 1H';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '18',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'VSG 2H';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Coombs directo';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Coombs indirecto';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '220000',   NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Plaquetas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '7200',     NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Leucocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '62',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Neutrófilos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '2',        NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Cayados';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '30',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Linfocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '2',        NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Eosinófilos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '3',        NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Monocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 1, id_cam, '1',        NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Basófilos';

-- det 2: Glicemia basal (Manuel Torres, 2026-03-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 2, id_cam, '88',       NOW() FROM tmcampos WHERE fkid_exa = 18 AND nombre_cam = 'Glicemia basal';

-- det 3: TSH (Michelle Quintero, 2026-03-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 3, id_cam, '2.1',      NOW() FROM tmcampos WHERE fkid_exa = 45 AND nombre_cam = 'TSH';

-- det 4: T3/T4 (Michelle Quintero, 2026-03-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 4, id_cam, '3.5',      NOW() FROM tmcampos WHERE fkid_exa = 46 AND nombre_cam = 'T3 libre';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 4, id_cam, '1.1',      NOW() FROM tmcampos WHERE fkid_exa = 46 AND nombre_cam = 'T4 libre';

-- det 5: Colesterol HDL/LDL/VLDL (Sarah Mora, 2026-03-02)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 5, id_cam, '185',      NOW() FROM tmcampos WHERE fkid_exa = 23 AND nombre_cam = 'Colesterol total';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 5, id_cam, '55',       NOW() FROM tmcampos WHERE fkid_exa = 23 AND nombre_cam = 'HDL';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 5, id_cam, '110',      NOW() FROM tmcampos WHERE fkid_exa = 23 AND nombre_cam = 'LDL';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 5, id_cam, '20',       NOW() FROM tmcampos WHERE fkid_exa = 23 AND nombre_cam = 'VLDL';

-- det 6: Triglicéridos (Sarah Mora, 2026-03-02)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 6, id_cam, '130',      NOW() FROM tmcampos WHERE fkid_exa = 24 AND nombre_cam = 'Triglicéridos';

-- det 7: Tiempo de protrombina (David Quintero, 2026-03-02)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 7, id_cam, '13',       NOW() FROM tmcampos WHERE fkid_exa = 14 AND nombre_cam = 'Tiempo de protrombina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 7, id_cam, '12',       NOW() FROM tmcampos WHERE fkid_exa = 14 AND nombre_cam = 'Control protrombina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 7, id_cam, '95',       NOW() FROM tmcampos WHERE fkid_exa = 14 AND nombre_cam = 'Actividad protrombínica';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 7, id_cam, '1.08',     NOW() FROM tmcampos WHERE fkid_exa = 14 AND nombre_cam = 'INR';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 7, id_cam, '1.0',      NOW() FROM tmcampos WHERE fkid_exa = 14 AND nombre_cam = 'Razón';

-- det 8: TPT (David Quintero, 2026-03-02)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 8, id_cam, '30',       NOW() FROM tmcampos WHERE fkid_exa = 15 AND nombre_cam = 'Tiempo de tromboplastina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 8, id_cam, '29',       NOW() FROM tmcampos WHERE fkid_exa = 15 AND nombre_cam = 'Control tromboplastina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 8, id_cam, '7 min',    NOW() FROM tmcampos WHERE fkid_exa = 15 AND nombre_cam = 'Tiempo de coagulación';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 8, id_cam, '2 min',    NOW() FROM tmcampos WHERE fkid_exa = 15 AND nombre_cam = 'Tiempo de sangría';

-- det 9: Uroanálisis (Jorge Ramirez, 2026-03-15)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Amarillo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Color';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Claro',    NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Aspecto';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, '6.0',      NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'pH';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, '1.018',    NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Densidad';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Proteínas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Glucosa';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Cetonas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Bilirrubina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Negativo', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Sangre';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, '2',        NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Leucocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, '0',        NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Eritrocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Ausentes', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Cilindros';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 9, id_cam, 'Escasas',  NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Bacterias';

-- det 10: Glicemia basal (Luis Fernandez, 2026-03-15)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 10, id_cam, '102',     NOW() FROM tmcampos WHERE fkid_exa = 18 AND nombre_cam = 'Glicemia basal';

-- det 11: Triglicéridos (Luis Fernandez, 2026-03-15)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 11, id_cam, '180',     NOW() FROM tmcampos WHERE fkid_exa = 24 AND nombre_cam = 'Triglicéridos';

-- det 12: Colesterol total (Luis Fernandez, 2026-03-15)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 12, id_cam, '210',     NOW() FROM tmcampos WHERE fkid_exa = 22 AND nombre_cam = 'Colesterol total';

-- det 13: Prolactina (Pedro Sanchez, 2026-04-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 13, id_cam, '12.3',    NOW() FROM tmcampos WHERE fkid_exa = 48 AND nombre_cam = 'Prolactina';

-- det 14: TSH (Pedro Sanchez, 2026-04-01)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 14, id_cam, '3.8',     NOW() FROM tmcampos WHERE fkid_exa = 45 AND nombre_cam = 'TSH';

-- det 15: Glicemia basal (Manuel Torres, 2026-04-06)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 15, id_cam, '92',      NOW() FROM tmcampos WHERE fkid_exa = 18 AND nombre_cam = 'Glicemia basal';

-- det 16: TGO (Carlos Perez, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 16, id_cam, '35',      NOW() FROM tmcampos WHERE fkid_exa = 28 AND nombre_cam = 'TGO';

-- det 17: TGP (Carlos Perez, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 17, id_cam, '42',      NOW() FROM tmcampos WHERE fkid_exa = 29 AND nombre_cam = 'TGP';

-- det 18: Bilirrubina (Carlos Perez, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 18, id_cam, '0.8',     NOW() FROM tmcampos WHERE fkid_exa = 30 AND nombre_cam = 'Bilirrubina total';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 18, id_cam, '0.2',     NOW() FROM tmcampos WHERE fkid_exa = 30 AND nombre_cam = 'Bilirrubina directa';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 18, id_cam, '0.6',     NOW() FROM tmcampos WHERE fkid_exa = 30 AND nombre_cam = 'Bilirrubina indirecta';

-- det 19: Ácido úrico (Andres Rojas, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 19, id_cam, '5.8',     NOW() FROM tmcampos WHERE fkid_exa = 25 AND nombre_cam = 'Ácido úrico';

-- det 20: Urea (Andres Rojas, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 20, id_cam, '28',      NOW() FROM tmcampos WHERE fkid_exa = 26 AND nombre_cam = 'Urea';

-- det 21: Creatinina (Andres Rojas, 2026-03-10)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 21, id_cam, '0.9',     NOW() FROM tmcampos WHERE fkid_exa = 27 AND nombre_cam = 'Creatinina';

-- det 22: Hematología completa (Camilo Peña, 2026-03-05)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '45',      NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Hematocrito';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '15.1',    NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Hemoglobina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '5',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'VSG 1H';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '12',      NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'VSG 2H';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Coombs directo';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Coombs indirecto';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '310000',  NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Plaquetas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '8500',    NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Leucocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '58',      NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Neutrófilos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '1',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Cayados';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '35',      NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Linfocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '3',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Eosinófilos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '2',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Monocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 22, id_cam, '1',       NOW() FROM tmcampos WHERE fkid_exa = 1 AND nombre_cam = 'Basófilos';

-- det 23: Uroanálisis (Kevin Moreno, 2026-03-05)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Amarillo oscuro', NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Color';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Turbio',  NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Aspecto';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, '5.5',     NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'pH';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, '1.022',   NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Densidad';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Trazas',  NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Proteínas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Glucosa';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Cetonas';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Bilirrubina';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Negativo',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Sangre';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, '8',       NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Leucocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, '1',       NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Eritrocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Ausentes',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Cilindros';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 23, id_cam, 'Moderadas',NOW() FROM tmcampos WHERE fkid_exa = 54 AND nombre_cam = 'Bacterias';

-- det 24: Coproanálisis (Kevin Moreno, 2026-03-05)
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Pardo',       NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Color';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Blanda',      NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Consistencia';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Ausente',     NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Moco';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Ausente',     NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Sangre';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, '3',           NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Leucocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Ausentes',    NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Eritrocitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'No se observan', NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Parásitos';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'No se observan', NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Quistes';
INSERT INTO tdresultados (fkid_det, fkid_cam, valor, fecha_reg)
SELECT 24, id_cam, 'Escasas',     NOW() FROM tmcampos WHERE fkid_exa = 56 AND nombre_cam = 'Levaduras';

