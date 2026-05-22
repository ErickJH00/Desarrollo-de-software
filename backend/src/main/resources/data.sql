INSERT INTO tmusuarios (usuario, contrasena_hash) VALUES ('marisolquintero', 'danielita123');

INSERT INTO tmpacientes (cedula, nombre_completo) VALUES ('29636040', 'Manuel Torres');
INSERT INTO tmpacientes (cedula, nombre_completo) VALUES ('15774151', 'Michelle Quintero');

INSERT INTO tmcategorias (id_cat, nombre_cat) VALUES (1, 'HEMATOLOGÍA');
INSERT INTO tmcategorias (id_cat, nombre_cat) VALUES (2, 'QUÍMICA SANGUÍNEA');

INSERT INTO tmexamenes (fkid_cat, nombre_exa, codigo_exa) VALUES (1, 'HEMATOLOGÍA COMPLETA CON PLAQUETAS', 'HEM-001');
INSERT INTO tmexamenes (fkid_cat, nombre_exa, codigo_exa) VALUES (1, 'CONTAJE DE LEUCOCITOS', 'HEM-002');
INSERT INTO tmexamenes (fkid_cat, nombre_exa, codigo_exa) VALUES (2, 'GLICEMIA BASAL', 'QUI-001');

INSERT INTO tmcampos (fkid_exa, nombre_cam, unidad, referencia) VALUES (1, 'Hematocrito', '%', '37-47 (F) / 42-52 (M)');
INSERT INTO tmcampos (fkid_exa, nombre_cam, unidad, referencia) VALUES (1, 'Hemoglobina', 'gr/dl', '12-16 (F) / 14-18 (M)');
INSERT INTO tmcampos (fkid_exa, nombre_cam, unidad, referencia) VALUES (3, 'Glicemia basal', 'mg/dl', '70-100');

-- Omiting other data for brevity, but this gives a working starting point.
