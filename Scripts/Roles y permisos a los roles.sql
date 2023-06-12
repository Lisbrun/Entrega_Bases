
-- Usuarios Estudiantes
Create User 'Maria'@'localhost' IDENTIFIED  by '123456';
GRANT Estudiante TO 'Maria'@'Localhost';
SET DEFAULT ROLE 	Estudiante To 'Maria'@'Localhost';

Create User 'Pedro'@'localhost' IDENTIFIED  by '123456';
GRANT Estudiante TO 'Pedro'@'Localhost';
SET DEFAULT ROLE 	Estudiante To 'Pedro'@'Localhost';

Create User 'Carlos'@'localhost' IDENTIFIED  by '123456';
GRANT Estudiante TO 'Carlos'@'Localhost';
SET DEFAULT ROLE 	Estudiante To 'Carlos'@'Localhost';

-- Usuarios Administradores

Create User 'Sergio'@'localhost' IDENTIFIED  by '123456';
GRANT Administrador TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Administrador To 'Carlos'@'Localhost';

Create User 'Daniel'@'localhost' IDENTIFIED  by '123456';
GRANT Administrador TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Administrador To 'Carlos'@'Localhost';

Create User 'Emanuel'@'localhost' IDENTIFIED  by '123456';
GRANT Administrador TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Administrador To 'Carlos'@'Localhost';



-- Usuarios Profesores 

Create User 'Martha'@'localhost' IDENTIFIED  by '123456';
GRANT Profesor TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Profesor To 'Carlos'@'Localhost';

Create User 'Milton'@'localhost' IDENTIFIED  by '123456';
GRANT Profesor TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Profesor To 'Carlos'@'Localhost';

Create User 'Lebedev'@'localhost' IDENTIFIED  by '123456';
GRANT Profesor TO 'Carlos'@'Localhost';
SET DEFAULT ROLE Profesor To 'Carlos'@'Localhost';

DROP ROLE IF EXISTS Administrador;
CREATE ROLE Administrador;
	GRANT EXECUTE ON PROCEDURE mostrar_Datos To Administrador;
    GRANT EXECUTE ON PROCEDURE Actualizar_Datos To Administrador ;
	GRANT EXECUTE ON PROCEDURE mostar_asignaturas To Administrador ;
    GRANT EXECUTE ON PROCEDURE Periodo_Academico To Administrador ;
    GRANT EXECUTE ON PROCEDURE Semestres To Administrador ;
	GRANT EXECUTE ON PROCEDURE Notas_Asignaturas To Administrador ;
	GRANT EXECUTE ON PROCEDURE mostar_Historial To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostar_papa To Administrador ;
	GRANT EXECUTE ON PROCEDURE mostar_Pa To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostar_Papi To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostar_creditos To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostar_cupo To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostar_Calificaciones To Administrador ;
    GRANT EXECUTE ON PROCEDURE Buscador TO Administrador;
    GRANT EXECUTE ON PROCEDURE mostrar_Plan_estudio To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostrar_proximas_citas To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostrar_registro_citas To Administrador ;
    GRANT EXECUTE ON PROCEDURE Crear_Inscripcion To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_inscripcion To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_idinscripcion To Administrador ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias To Administrador ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_optativas To Administrador ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_nivelacion To Administrador ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_funobli To Administrador ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_funopta To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_sedes To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_facultades To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_tipologias To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_programas To Administrador ;
    GRANT EXECUTE ON PROCEDURE obtener_infoinscripcion To Administrador ;
    GRANT EXECUTE ON PROCEDURE Insc_cance_grupo To Administrador ;
    GRANT EXECUTE ON PROCEDURE Eliminar_inscripcion To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostrar_idgrupo_asignatura_docente_creditos To Administrador ;
    GRANT EXECUTE ON PROCEDURE mostrar_Datos_Docente To Administrador;
    GRANT EXECUTE ON PROCEDURE Actualizar_DatosActualizar_Datos To Administrador;
    GRANT EXECUTE ON PROCEDURE Vista_general_grupos To Administrador;
     GRANT EXECUTE ON PROCEDURE Vista_especifica_grupo To Administrador;
     GRANT EXECUTE ON PROCEDURE Actualizar_Notas To Administrador;
    
    
    
    

DROP ROLE IF EXISTS Estudiante;
CREATE ROLE Estudiante;
	GRANT EXECUTE ON PROCEDURE mostrar_Datos To Estudiante;
    GRANT EXECUTE ON PROCEDURE Actualizar_Datos To Estudiante ;
	GRANT EXECUTE ON PROCEDURE mostar_asignaturas To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Periodo_Academico To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Semestres To Estudiante ;
	GRANT EXECUTE ON PROCEDURE Notas_Asignaturas To Estudiante ;
	GRANT EXECUTE ON PROCEDURE mostar_Historial To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostar_papa To Estudiante ;
	GRANT EXECUTE ON PROCEDURE mostar_Pa To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostar_Papi To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostar_creditos To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostar_cupo To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostar_Calificaciones To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Buscador TO Estudiante;
    GRANT EXECUTE ON PROCEDURE mostrar_Plan_estudio To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostrar_proximas_citas To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostrar_registro_citas To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Crear_Inscripcion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_inscripcion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_idinscripcion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_optativas To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_nivelacion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_funobli To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Filtrar_Materias_funopta To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_sedes To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_facultades To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_tipologias To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_programas To Estudiante ;
    GRANT EXECUTE ON PROCEDURE obtener_infoinscripcion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Insc_cance_grupo To Estudiante ;
    GRANT EXECUTE ON PROCEDURE Eliminar_inscripcion To Estudiante ;
    GRANT EXECUTE ON PROCEDURE mostrar_idgrupo_asignatura_docente_creditos To Estudiante ;
    
    
    
    
    

DROP ROLE IF EXISTS Profesor;
CREATE ROLE Profesor;
	GRANT EXECUTE ON PROCEDURE mostrar_Datos_Docente To Profesor;
    GRANT EXECUTE ON PROCEDURE Actualizar_DatosActualizar_Datos To Profesor;
    GRANT EXECUTE ON PROCEDURE Vista_general_grupos To Profesor;
     GRANT EXECUTE ON PROCEDURE Vista_especifica_grupo To Profesor;
     GRANT EXECUTE ON PROCEDURE Actualizar_Notas To Profesor;


	