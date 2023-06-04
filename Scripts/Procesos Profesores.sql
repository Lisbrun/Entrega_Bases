-- Procedimientos
-- Datos personales
drop view if exists Vst_Estuidiante_Datos;
CREATE VIEW Vst_Estuidiante_Datos AS
SELECT  Documento, Tipo_Documento, persona_vinculada.Nombre, persona_vinculada.Apellido,Correo_Personal, Correo_institucional,
Telefono, Estrato, Ciudad, Calle, historial_academico.Papa,historial_academico.Papi, historial_academico.Pa,
programa.Nombre  As Programa, persona_vinculada.Usuario_id as userid
       from persona_vinculada
       join estudiante on (estudiante.Persona_Vinculada_id = Documento)
       join residencia on (estudiante.Id_estudiante=residencia.Estudiante_id)
       join historial_academico on (historial_academico.Estudiante_id= estudiante.Id_estudiante) 
       join programa on (programa.Codigo_SNIES=historial_academico.Programa_id)

-- mostrar_datos
DELIMITER $$
CREATE PROCEDURE mostrar_Datos(in idusuario int)
	BEGIN
		SELECT Documento, Tipo_Documento, Vst_Estuidiante_Datos.Nombre, 
        Vst_Estuidiante_Datos.Apellido,Correo_Personal, Correo_institucional, Telefono,
		Estrato, Ciudad, Calle, Programa FROM Vst_Estuidiante_Datos where userid=idusuario;
	END $$
DELIMITER ;




-- Actualizar_datos
DELIMITER $$
CREATE PROCEDURE Actualizar_Datos(in usuarioid int,IN Correo_Personal_u  varchar(254), 
	IN Telefono_u varchar(31), IN Estrato_u INT, IN ciudad_u varchar(50), IN Calle_u varchar(255))
	BEGIN 
    UPDATE persona_vinculada
       join estudiante on (estudiante.Persona_Vinculada_id = Documento)
       join residencia on (estudiante.Id_estudiante=residencia.Estudiante_id)
       join historial_academico on (historial_academico.Estudiante_id= estudiante.Id_estudiante) 
       join programa on (programa.Codigo_SNIES=historial_academico.Programa_id) 
       SET Correo_Personal =Correo_Personal_u, Telefono= Telefono_u ,Estrato= Estrato_u, ciudad=ciudad_u, Calle=Calle_u 
       WHERE persona_vinculada.Usuario_id=usuarioid;
	END $$
DELIMITER ;

drop procedure Actualizar_Datos;

-- Historial academico
drop view if exists vts_resumen_historial;
CREATE VIEW vts_resumen_Historial AS
SELECT  asignatura.Nombre, Creditos, Tipologia,Semestre , Nota_Definitiva,Aprobada,Creditos_Adicionales,Cupo_Creditos,
cupo_credito.Creditos_Disponibles as Disponibles, Creditos_Doble_titulacion,resumen_credito.Creditos_Exigidos,
resumen_credito.Creditos_Aprobados,resumen_credito.Pendientes,resumen_credito.Inscritos,resumen_credito.Cursados,
persona_vinculada.Usuario_id AS usuario
       from persona_vinculada
       join estudiante on (Persona_Vinculada_id = Documento)
       join historial_academico on (historial_academico.Estudiante_id= estudiante.Id_estudiante) 
       join resumen_credito on (resumen_credito.Historial_id=historial_academico.Id_Historial)
       join cupo_credito on (cupo_credito.Historial_id= historial_academico.Id_Historial)
       join programa on (programa.Codigo_SNIES=historial_academico.Programa_id)
       join notas_historial on (notas_historial.historial_academico_id=historial_academico.Id_Historial)
       join notas on (notas.Id_Nota=notas_historial.notas_id)
       join inscripcion_cancelacion_grupo on (inscripcion_cancelacion_grupo.Id=notas.Inscripcion_id )
       join inscripcion_cancelacion on (inscripcion_cancelacion.Id_incripcion=inscripcion_cancelacion_grupo.Inscripcion_id)
       join grupo on (grupo.Id_grupo=inscripcion_cancelacion_grupo.Grupo_id)
       join asignatura on (asignatura.Codigo=grupo.Asignatura_id)

-- mostrar historiar
DELIMITER $$
CREATE PROCEDURE mostar_Historial(in usuarioid int)
	BEGIN
		SELECT   Id_Historial, Codigo_SNIES, Programa FROM Vst_Estuidiante_Datos  where Vst_Estuidiante_Datos.usuario=usuarioid; 
	END $$
DELIMITER ;

-- PAPA
DELIMITER $$
CREATE PROCEDURE mostar_papa(in usuarioid int)
	BEGIN
		SELECT Papa FROM Vst_Estuidiante_Datos where Vst_Estuidiante_Datos.usuario=usuarioid;
	END $$
DELIMITER ;

-- PA
DELIMITER $$
CREATE PROCEDURE mostar_Pa(in usuarioid int)
	BEGIN
		SELECT  Pa FROM Vst_Estuidiante_Datos where Vst_Estuidiante_Datos.usuario=usuarioid;
	END $$
DELIMITER ;

-- PAPI
DELIMITER $$
CREATE PROCEDURE mostar_Papi(in usuarioid int)
	BEGIN
		SELECT  Papi FROM Vst_Estuidiante_Datos where Vst_Estuidiante_Datos.usuario=usuarioid;
	END $$
DELIMITER ;
       
-- Resumen Asignaturas
DELIMITER $$
CREATE PROCEDURE mostar_asignaturas(in usuarioid int)
	BEGIN
		SELECT Nombre, Creditos, Tipologia,Semestre , Nota_Definitiva,Aprobada FROM vts_resumen_Historial
        where vts_resumen_Historial.usuario=usuarioid;
	END $$
DELIMITER ;

-- Resumen Creditos
DELIMITER $$
CREATE PROCEDURE mostar_creditos(in usuarioid int)
	BEGIN
		SELECT Creditos_Exigidos,Creditos_Aprobados,Pendientes,
        Inscritos,Cursados FROM vts_resumen_Historial
        where  vts_resumen_Historial.usuario=usuarioid;
	END $$
DELIMITER ;

-- cupo credito
DELIMITER $$
CREATE PROCEDURE mostar_cupo(in usuarioid int)
	BEGIN
		SELECT Creditos_Adicionales,Cupo_Creditos,Disponibles, 
        Creditos_Doble_titulacion FROM vts_resumen_Historial
        where  vts_resumen_Historial.usuario=usuarioid;
	END $$
DELIMITER ;

-- Calificaciones
DELIMITER $$
CREATE PROCEDURE mostar_Calificaciones(in usuarioid int, in Semestre_p int)
	BEGIN
		SELECT Creditos_Adicionales,Cupo_Creditos, Disponibles, 
        Creditos_Doble_titulacion FROM vts_resumen_Historial 
        WHERE vts_resumen_Historial.Semestre= Semestre_p and vts_resumen_Historial.usuario=usuarioid;
	END $$
DELIMITER ;


-- Buscador de cursos
drop view if exists vts_buscador_cursos;
CREATE VIEW  vts_buscador_cursos AS
SELECT sede.Nombre AS Sede, facultad.Nombre AS Facultad, programa.Codigo_SNIES, programa.Nombre AS programa,
asignatura.Codigo, asignatura.Nombre As asignatura, asignatura.Creditos, asignatura.Tipologia, grupo.Numero_grupo,
grupo.Cupos,persona_vinculada.Nombre AS Profesor, academico_espacio.Dia, academico_espacio.Edificio, academico_espacio.Salon,
academico_espacio.Hora
	from sede
    join facultad on (sede.ID_sede=facultad.Sede_id)
	join programa on (facultad.Id_Facultad=programa.Facultad_id)
    join asignatura on (programa.Codigo_SNIES=asignatura.Programa_id)
    join grupo on (asignatura.Codigo=grupo.Asignatura_id)
    join docente on (grupo.Profesor_id=docente.Id_docente)
    join persona_vinculada on (persona_vinculada.Documento=docente.Persona_Vinculada_id)
	join academico_espacio on (grupo.Id_grupo=academico_espacio.Grupo_id)

-- Buscador
DELIMITER $$
CREATE PROCEDURE Buscador(in nom_sede varchar(60), in nom_facultad varchar(120), in nom_programa varchar(100),
 in Tipologia_p varchar(100),in creditos_p int, in nombre_a varchar(100))
	BEGIN	
	IF nom_sede IS NULL OR nom_facultad IS NULL OR nom_programa IS NULL THEN
        SELECT 'No se puede realizar la consulta. Los parámetros nom_sede, nom_facultad y nom_programa no pueden ser nulos.';
    
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NULL AND creditos_p IS NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa;
	
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p;
	
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS not NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p
        AND Creditos=creditos_p;
        
	ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS not NULL AND nombre_a  IS NOT NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p
        AND Creditos=creditos_p AND asignatura=nombre_a;
	END IF;

    END $$
DELIMITER ;

-- Vista cita de inscripcion 
Drop view if exists vst_inscripcion;
Create view vst_inscripcion as
Select programa.Nombre as programa,cita_inscripcion.Id_cita as idcita, facultad.Nombre as facultad, Fecha, Hora, persona_vinculada.Usuario_id as userid
	from persona_vinculada
    join estudiante on (Persona_Vinculada_id=Documento)
    join historial_academico on (Id_estudiante = Estudiante_id)
    join programa on (Codigo_SNIES = historial_academico.Programa_id)
    join cita_inscripcion on (Id_Historial= Historial_id)
    join facultad on (facultad.Id_Facultad=programa.Facultad_id);
    
-- Procedimiento almacenado para consulta
DElimiter $$
create procedure mostrar_Plan_estudio(in usuarioid int)
	Begin
		select Plan_de_estudio from vst_inscripcion
        where vst_inscripcion.userid=usuarioid;
	end $$
delimiter ;
    
-- Proximas Citas    
Delimiter $$
create procedure mostrar_proximas_citas(in usuarioid int)
	Begin
		DECLARE fecha_actual DATE;
        SET fecha_actual = CURDATE();
		select programa,facultad,fecha, Hora,idcita from vst_inscripcion WHERE fecha >= fecha_actual and userid=usuarioid;
	end $$
delimiter ;

drop procedure mostrar_proximas_citas;

-- Registro citas
DElimiter $$
create procedure mostrar_registro_citas(in usuarioid int)
	Begin
		DECLARE fecha_actual DATE;
        SET fecha_actual = CURDATE();
		select programa,facultad,Fecha,Hora from vst_inscripcion 
        WHERE fecha < fecha_actual  and userid=usuarioid;
	end $$
delimiter ;


-- Crear Inscripcion 
DElimiter $$
create procedure Crear_Inscripcion(in id_Inscripcion int)
	Begin
		insert into inscripcion_cancelacion(Cita_id) values (id_Inscripcion);
	end $$
delimiter ;



