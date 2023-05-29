-- Vista datos personales docente
Drop view if exists vst_Docente_datos;
Create view vst_Docente_datos as
SELECT Documento, Tipo_Documento, persona_vinculada.Nombre, persona_vinculada.Apellido, Correo_Personal, Correo_institucional, Telefono, 
	   persona_vinculada.Usuario_id AS usuario
       from persona_vinculada
       join docente on (Persona_Vinculada_id = Documento)

-- mostrar_datos_docente
DELIMITER $$
CREATE PROCEDURE mostrar_Datos_Docente(in usuarioid int)
	BEGIN
		SELECT Documento, Tipo_Documento, persona_vinculada.Nombre, persona_vinculada.Apellido, Correo_Personal, Correo_institucional, Telefono
        FROM vst_Docente_datos 
        where vst_Docente_datos.usuario=usuarioid;
	END $$
DELIMITER ;

-- Actualizar_datos
DELIMITER $$
CREATE PROCEDURE Actualizar_Datos(in usuarioid int, IN Correo_Personal_u  varchar(254),IN Telefono_u varchar(31) )
	BEGIN UPDATE vst_Docente_datos SET Correo_Personal = Correo_Personal_u, Telefono = Telefono_u 
    WHERE vst_Docente_datos.usuario=usuarioid;
	END $$
DELIMITER ;

-- Poner nota
Drop view if exists vst_Docente_nota;
Create view vst_Docente_nota as
SELECT Numero_grupo, asignatura.Nombre as nombre_asignatura, asignatura.Codigo, academico_espacio.Dia, academico_espacio.hora, academico_espacio.Edificio,
	   academico_espacio.Salon, persona_estudiante.Nombre as nombre_estudiante,  persona_estudiante.Apellido ,persona_estudiante.Documento, Primer_Corte, Segundo_Corte,
       Tercer_Corte, Nota_Definitiva,
       
       persona_vinculada.Usuario_id AS usuario
	   from persona_vinculada
       join docente on (Persona_Vinculada_id = Documento)
       join grupo on (Id_docente = Profesor_id)
       join academico_espacio on (Id_grupo = academico_espacio.Grupo_id)
       join asignatura on (Asignatura_id = Codigo)
       join inscripcion_cancelacion_grupo on (Id_grupo = inscripcion_cancelacion_grupo.Grupo_id)
       join notas on (inscripcion_cancelacion_grupo.Id = notas.Inscripcion_id)
       join notas_historial on (historial_academico_id = Id_Nota)
       join historial_academico on (Id_Historial=historial_academico_id)
       join estudiante on (Id_estudiante = Estudiante_id)
       join persona_vinculada as persona_estudiante on (persona_estudiante.Documento = estudiante.Persona_Vinculada_id);
       
-- Vista General grupos
DELIMITER $$
CREATE PROCEDURE Vista_general_grupos(in usuarioid int)
	BEGIN
		SELECT Numero_grupo, nombre_asignatura, asignatura.Codigo
        FROM vst_Docente_nota 
        where vst_Docente_datos.usuario=usuarioid;
	END $$
DELIMITER ;

-- Viste especifica grupo 
DELIMITER $$
CREATE PROCEDURE Vista_especifica_grupo(in usuarioid int)
	BEGIN
		SELECT Numero_grupo, nombre_asignatura, asignatura.Codigo, academico_espacio.Dia, academico_espacio.hora, academico_espacio.Edificio,
	    academico_espacio.Salon, nombre_estudiante,  persona_estudiante.Apellido ,persona_estudiante.Documento,Primer_Corte, Segundo_Corte,
       Tercer_Corte, Nota_Definitiva
        FROM vst_Docente_nota 
        where vst_Docente_datos.usuario=usuarioid;
	END $$
DELIMITER ;


-- Poner y actualizar notas 
DELIMITER $$
CREATE PROCEDURE Actualizar_Notas(IN usuarioid INT, IN insert_primer_corte INT, IN insert_segundo_corte INT,
								  IN insert_Tercer_corte INT )
	BEGIN UPDATE vst_Docente_nota SET insert_primer_corte = Primer_Corte, insert_segundo_corte = Segundo_Corte, insert_Tercer_corte = Tercer_Corte
    WHERE vst_Docente_nota.usuario=usuarioid;
	END $$
DELIMITER ;