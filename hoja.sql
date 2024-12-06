use fcfm_web;

SELECT * FROM licenciaturas;
SELECT * FROM planes_de_estudios;
SELECT * FROM materias;
SELECT * FROM cambio_calificaciones_datos;
SELECT * FROM cambioscalificacionessolicitudes;
select * from grupos;
SELECT * FROM tipo_examen;
select * from prefijos;
SELECT * FROM empleados;
select * from empleados_materias;
select * from grupo_alumnos;
select * from alumnos;
select*from roles;

/*A partir de aqui son las tablas que se usan en el nuevo metodo para hacer solicitudes*/
SELECT * FROM cambio_calificaciones_datos;
SELECT * FROM cambioscalificacionessolicitudes;
select * from grupos;
SELECT * FROM tipo_examen;
select * from prefijos;
SELECT * FROM empleados;
select * from empleados_materias;
select*from roles;
/*Nuevas*/
select * from alumnos;
select * from grupo_alumnos;
select * from plan_estudios_cambios;
select*from materias_cambios;

TRUNCATE ALUMNOS;
TRUNCATE GRUPO_ALUMNOS;
truncate materias_cambios;
truncate empleados_materias;
truncate grupos;
truncate cambio_calificaciones_datos;
truncate cambioscalificacionessolicitudes;

insert into empleados (NoEmpleado, Nombre, ApPaterno, ApMaterno, Firma, contrasena, activo, created_at, updated_at) VALUES (100440, 'DRA. ALEJANDRA AZUCENA','ACEVES','ALÓS',null,'$2y$10$RA2WKqv0NG1MokQ.FdQwouPD2Lxkf4KsgYqZWjc4dBUdnkgyMpOlG',1, now(),now());
DELETE FROM empleados WHERE id = 65;

DELETE FROM empleados_materias WHERE fkMateria = 1097;
DELETE FROM grupos WHERE idGrupo=31;
DELETE FROM cambioscalificacionessolicitudes WHERE fkGrupo = 31;
DELETE FROM cambio_calificaciones_datos WHERE fkSolicitud = 67;
DELETE FROM materias WHERE id BETWEEN 1097 AND 1124;

INSERT INTO empleados_materias (fkEmpleado, fkMateria, Activo, created_at, updated_at)
VALUES (49, 1097, 1, NOW(), NOW());
INSERT INTO grupos (descripcion, capacidad, fkEmpMat, Activo, created_at, updated_at, grupo, horario, frecuencia, aula, plan, modalidad) 
VALUES ('Grupo A', 20, 27, 1, NOW(), NOW(), '052', '09:00 - 11:00', 'MA', 'AVI13', 4,'PRESENCIAL');

INSERT INTO grupo_alumnos (idAlumno, idGrupo, oportunidad, tipoExamen, calificacion, created_at, updated_at)
SELECT 
    a.id AS idAlumno,
    31 AS idGrupo,               -- idGrupo fijo
    1 AS oportunidad,            -- oportunidad fija
    1 AS tipoExamen,             -- tipoExamen fijo
    ROUND(RAND() * 100, 2) AS calificacion, -- Calificación aleatoria entre 0.00 y 10.00
    NOW() AS created_at,
    NOW() AS updated_at
FROM 
    alumnos a
WHERE 
    a.Plan = 430;

Truncate grupo_alumnos;

SELECT * FROM configuraciones_laboratorio;
SELECT * FROM problema_laboratorio;
DELETE FROM configuraciones_laboratorio WHERE laboratorio_id = 21;

-- Generación de INSERTs para grupos
INSERT INTO grupos (idGrupo, descripcion, capacidad, fkEmpMat, Activo, created_at, updated_at) VALUES 
(16, 'Grupo A', 20, 12, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(17, 'Grupo B', 20, 13, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(18, 'Grupo C', 20, 14, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(19, 'Grupo A', 20, 15, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(20, 'Grupo B', 20, 16, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(21, 'Grupo C', 20, 17, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(22, 'Grupo A', 20, 18, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(23, 'Grupo B', 20, 19, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(24, 'Grupo C', 20, 20, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(25, 'Grupo A', 20, 21, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(26, 'Grupo B', 20, 22, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(27, 'Grupo C', 20, 23, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(28, 'Grupo A', 20, 24, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(29, 'Grupo B', 20, 25, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(30, 'Grupo C', 20, 26, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00');

/*
INSERT INTO empleados_materias (id, fkEmpleado, fkMateria, Activo, created_at, updated_at)
VALUES
(12, 49, 249, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(13, 49, 250, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(14, 49, 256, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(15, 49, 257, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(16, 49, 258, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(17, 49, 259, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(18, 49, 260, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(19, 49, 261, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(20, 49, 769, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(21, 49, 770, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(22, 49, 771, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(23, 49, 772, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(24, 49, 773, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(25, 49, 774, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'),
(26, 49, 775, 1, '2024-06-25 00:00:00', '2024-06-25 00:00:00'); 
*/