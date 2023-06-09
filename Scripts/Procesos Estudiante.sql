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



-- Historial academico
drop view if exists vts_resumen_historial;
CREATE VIEW vts_resumen_Historial AS
SELECT  asignatura.Nombre, Creditos, Tipologia,Semestre , Nota_Definitiva,Aprobada,Creditos_Adicionales,Cupo_Creditos,
cupo_credito.Creditos_Disponibles as Disponibles, Creditos_Doble_titulacion,resumen_credito.Creditos_Exigidos,
resumen_credito.Creditos_Aprobados,resumen_credito.Pendientes,resumen_credito.Inscritos,resumen_credito.Cursados,
persona_vinculada.Usuario_id AS usuario, programa.Nombre as nomprograma, resumen_credito.Creditos_Aprobados as aprobados , resumen_credito.Creditos_Exigidos as exigidos, inscripcion_cancelacion.Semestre as semestre
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
       join asignatura on (asignatura.Codigo=grupo.Asignatura_id);

-- Resumen Asignaturas
DELIMITER $$
CREATE PROCEDURE mostar_asignaturas(in usuarioid int, in programain varchar(100))
	BEGIN
		SELECT Nombre, Creditos, Tipologia,Semestre , Nota_Definitiva,Aprobada FROM vts_resumen_Historial
        where usuario=usuarioid and nomprograma=programain;
	END $$
DELIMITER ;



-- Periodo Academico
DELIMITER $$
CREATE PROCEDURE Periodo_Academico(in usuarioid int, in programain varchar(100))
	BEGIN
		SELECT Nombre, Creditos, Tipologia,Semestre , Nota_Definitiva,Aprobada FROM vts_resumen_Historial
        where usuario=usuarioid and nomprograma=programain;
	END $$
DELIMITER ;



-- Traer todos los semestres
DELIMITER $$
CREATE PROCEDURE Semestres(in usuarioid int)
	BEGIN
		SELECT DISTINCT(semestre) FROM vts_resumen_Historial
        where usuario=usuarioid;
	END $$
DELIMITER ;
call Semestres(11);

-- Asignaturas
DELIMITER $$
CREATE PROCEDURE Notas_Asignaturas(in usuarioid int, in semestrein int)
	BEGIN
		SELECT Nombre,Nota_Definitiva,nomprograma FROM vts_resumen_Historial
        where usuario=usuarioid and semestre=semestrein ;
	END $$
DELIMITER ;




-- mostrar historiar
DELIMITER $$
CREATE PROCEDURE mostar_Historial(in usuarioid int)
	BEGIN
		SELECT   Id_Historial, Codigo_SNIES, Programa FROM Vst_Estuidiante_Datos  where Vst_Estuidiante_Datos.usuario=usuarioid; 
	END $$
DELIMITER ;

-- PAPA
DELIMITER $$
CREATE PROCEDURE mostar_papa(in usuarioid int, in programain varchar(100))
	BEGIN
		SELECT Papa FROM Vst_Estuidiante_Datos where userid=usuarioid and Programa=programain;
	END $$
DELIMITER ;

 
-- PA
DELIMITER $$
CREATE PROCEDURE mostar_Pa(in usuarioid int,in  programain varchar(100))
	BEGIN
		SELECT  Pa FROM Vst_Estuidiante_Datos where userid=usuarioid  and Programa= programain;
	END $$
DELIMITER ;

-- PAPI
DELIMITER $$
CREATE PROCEDURE mostar_Papi(in usuarioid int,in  programain varchar(100))
	BEGIN
		SELECT  Papi FROM Vst_Estuidiante_Datos where userid=usuarioid  and Programa= programain;
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
CREATE PROCEDURE mostar_cupo(in usuarioid int, in  programain varchar(100))
	BEGIN
		SELECT Creditos_Adicionales,Cupo_Creditos,Disponibles, 
        Creditos_Doble_titulacion, aprobados, exigidos
        FROM vts_resumen_Historial
        where  usuario=usuarioid and nomprograma=programain ;
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
asignatura.Codigo, asignatura.Nombre AS asignatura, asignatura.Creditos, asignatura.Tipologia, grupo.Numero_grupo,
grupo.Cupos, persona_vinculada.Nombre AS Profesor, prerequisito.Prerequisito_id AS prerequisito,
prereq_asignatura.Codigo AS codigo_prerequisito, prereq_asignatura.Nombre AS prerequisito_asignatura

FROM sedes
JOIN facultad ON (sede.ID_sede = facultad.Sede_id)
JOIN programa ON (facultad.Id_Facultad = programa.Facultad_id)
JOIN asignatura ON (programa.Codigo_SNIES = asignatura.Programa_id)
JOIN grupo ON (asignatura.Codigo = grupo.Asignatura_id)
JOIN docente ON (grupo.Profesor_id = docente.Id_docente)
JOIN persona_vinculada ON (persona_vinculada.Documento = docente.Persona_Vinculada_id)
LEFT JOIN prerequisito ON (asignatura.Codigo = prerequisito.Materia_id)
LEFT JOIN asignatura AS prereq_asignatura ON (prerequisito.Prerequisito_id = prereq_asignatura.Codigo);



    
drop procedure Buscador;
-- Buscador
DELIMITER $$
CREATE PROCEDURE Buscador(in nom_sede varchar(60), in nom_facultad varchar(120), in nom_programa varchar(100),
 in Tipologia_p varchar(100),in creditos_p int, in nombre_a varchar(100))
	BEGIN	
	IF nom_sede IS NULL OR nom_facultad IS NULL OR nom_programa IS NULL THEN
        SELECT 'No se puede realizar la consulta. Los parámetros nom_sede, nom_facultad y nom_programa no pueden ser nulos.';
    
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NULL AND creditos_p IS NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia,prerequisito_asignatura from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa;
	
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia,prerequisito_asignatura from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p;
	
    ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS not NULL AND nombre_a IS NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia,prerequisito_asignatura from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p
        AND Creditos=creditos_p;
        
	ELSEIF nom_sede IS NOT NULL AND nom_facultad IS NOT NULL AND nom_programa IS NOT NULL AND Tipologia_p 
    IS NOT NULL AND creditos_p IS not NULL AND nombre_a  IS NOT NULL THEN
    
		SELECT Codigo,asignatura,Creditos,Tipologia,prerequisito_asignatura from vts_buscador_cursos Where Sede=nom_sede 
        AND Facultad=nom_facultad AND programa=nom_programa AND Tipologia=Tipologia_p
        AND Creditos=creditos_p AND asignatura=nombre_a;
	END IF;

    END $$
DELIMITER ;



Drop view if exists vst_inscripcion;
Create view vst_inscripcion as
select distinct(sede.nombre), facultad.Nombre,asignatura.Nombre,asignatura.Tipologia from sede 
inner join facultad on (facultad.Nombre=Sede_id)
inner join programa on (programa.Facultad_id=Facultad_id)
inner join asignatura on (asignatura.Programa_id=programa.Codigo_SNIES);





-- Vista cita de inscripcion 
Drop view if exists vst_inscripcion;
Create view vst_inscripcion as
Select programa.Nombre as programa,cita_inscripcion.Id_cita as idcita, facultad.Nombre as facultad, Fecha, Hora, persona_vinculada.Usuario_id as userid
	from persona_vinculada
    join estudiante on (Persona_Vinculada_id=Documento)
    join historial_academico on (estudiante.Id_estudiante = historial_academico.Estudiante_id)
    join programa on (Codigo_SNIES = historial_academico.Programa_id)
    join cita_inscripcion on (Id_Historial= Historial_id)
    join facultad on (facultad.Id_Facultad=programa.Facultad_id);
    

-- obtener los programas 
Drop view if exists programas_inscritos;
Create view programas_inscritos as
select persona_vinculada.Usuario_id as userid,programa.Nombre from persona_vinculada 
		 join estudiante on estudiante.Persona_Vinculada_id=persona_vinculada.Documento
		 join historial_academico on historial_academico.Estudiante_id= estudiante.Id_estudiante
		 join programa on programa.Codigo_SNIES=historial_academico.Programa_id;


-- Procedimiento almacenado para consulta
drop procedure mostrar_Plan_estudio;
DElimiter $$
create procedure mostrar_Plan_estudio(in usuarioid int)
	Begin
		select * from programas_inscritos where userid = usuarioid;
	end $$
delimiter ;



-- Proximas Citas    
Delimiter $$
create procedure mostrar_proximas_citas(in usuarioid int,in programa_seleccionado varchar(100))
	Begin
		DECLARE fecha_actual DATE;
        SET fecha_actual = CURDATE();
		select programa,facultad,fecha, Hora,idcita from vst_inscripcion WHERE fecha >= fecha_actual 
        and userid=usuarioid and programa =programa_seleccionado ;
	end $$
delimiter ;




-- Registro citas
DElimiter $$
create procedure mostrar_registro_citas(in usuarioid int, in programa_seleccionado varchar(100))
	Begin
		DECLARE fecha_actual DATE;
        SET fecha_actual = CURDATE();
		select programa,facultad,Fecha,Hora from vst_inscripcion 
        WHERE fecha < fecha_actual  and userid=usuarioid
        and programa =programa_seleccionado ;
        
	end $$
delimiter ;




Delimiter $$
create procedure obtener_inscripcion (in id_Inscripcion int)
	Begin
		select * from Inscripcion where idcita=id_Inscripcion;
	end $$
delimiter ;



Delimiter $$
create procedure obtener_idinscripcion (in id_cita int)
	Begin
		select inscripcion_cancelacion.Id_incripcion from inscripcion_cancelacion where inscripcion_cancelacion.Cita_id=id_cita;
	end $$
delimiter ;




-- Materias por cursar
drop view if exists Materias_Cursar;
create View Materias_Cursar as 
SELECT asignatura.Nombre, asignatura.Programa_id, asignatura.Codigo,persona_vinculada.Usuario_id as userid, historial_academico.Id_Historial as id_historial, asignatura.Tipologia as tipologia, asignatura.Creditos
FROM persona_vinculada
inner join estudiante on estudiante.Persona_Vinculada_id=persona_vinculada.Documento
inner join historial_academico on historial_academico.Estudiante_id=estudiante.Id_estudiante 
INNER JOIN programa ON historial_academico.Programa_id = programa.Codigo_SNIES
INNER JOIN asignatura ON programa.Codigo_SNIES = asignatura.Programa_id
WHERE asignatura.Codigo NOT IN (
    select asignatura.Codigo from historial_academico 
inner join notas_historial on historial_academico_id=notas_historial.historial_academico_id
inner join notas on notas.Id_Nota=notas_historial.notas_id
inner join inscripcion_cancelacion_grupo on inscripcion_cancelacion_grupo.Id=notas.Inscripcion_id
inner join grupo on grupo.Id_grupo= inscripcion_cancelacion_grupo.Grupo_id 
inner join asignatura on asignatura.Codigo=grupo.Asignatura_id where notas.Nota_Definitiva>=3);





-- procedimiento filtrar por usuario y historial 
Delimiter $$
create procedure Filtrar_Materias (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'DISCIPLINAR OBLIGATORIA';
	end $$
delimiter ;


Delimiter $$
create procedure Filtrar_Materias_optativas (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'DISCIPLINAR OPTATIVA';
	end $$
delimiter ;

Delimiter $$
create procedure Filtrar_Materias_nivelacion (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'NIVELACION';
	end $$
delimiter ;



Delimiter $$
create procedure Filtrar_Materias_grado (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'Trabajo de Grado';
	end $$
delimiter ;


Delimiter $$
create procedure Filtrar_Materias_funobli (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'FUND. OBLIGATORIA';
	end $$
delimiter ;



Delimiter $$
create procedure Filtrar_Materias_funopta (in usuario int, in id_cita int)
	Begin
    declare idhistorial int ;
    select historial_academico.Id_Historial into idhistorial from cita_inscripcion 
    inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id where cita_inscripcion.Id_cita=id_cita;
		select * from Materias_Cursar where userid=usuario and id_historial=idhistorial and  tipologia = 'FUND. OPTATIVA';
	end $$
delimiter ;


Delimiter $$
create procedure obtener_sedes ()
	Begin
    select sede.Nombre from sede;
	end $$
delimiter ;


Delimiter $$
create procedure obtener_facultades ()
	Begin
    select distinct (facultad.Nombre) from facultad;
	end $$
delimiter ;


Delimiter $$
create procedure obtener_tipologias()
	Begin
    select distinct(asignatura.Tipologia) from asignatura;
	end $$
delimiter ;


Delimiter $$
create procedure obtener_programas ()
	Begin
    select programa.Nombre from programa;
	end $$
delimiter ;




-- vista Grupos 
drop view if exists Obtener_grupos;
create View Obtener_grupos as 
SELECT persona_vinculada.Nombre,  grupo.Id_grupo, grupo.Cupos, CONCAT(espacio.Edificio, " ", espacio.Salon), CONCAT(espacio.Dia, " ",  DATE_FORMAT(espacio.Hora,'%h:%i %p')),Asignatura_id as idasignatura
FROM asignatura
INNER JOIN grupo ON grupo.Asignatura_id = asignatura.Codigo
INNER JOIN academico_espacio AS espacio ON espacio.Grupo_id = grupo.Id_grupo
INNER JOIN docente ON docente.Id_docente = grupo.Profesor_id
INNER JOIN persona_vinculada ON persona_vinculada.Documento = docente.Persona_Vinculada_id;

-- Obtener Grupos
Delimiter $$
create procedure Obtener_grupos(in id_materia int)
	Begin
    select * from Obtener_grupos where idasignatura=id_materia ;
	end $$
delimiter ;


Delimiter $$
create procedure obtener_infoinscripcion(in id_grupoin int)
	Begin
    select grupo.Id_grupo, asignatura.Nombre, asignatura.Creditos from grupo
    inner join asignatura on (grupo.Asignatura_id=asignatura.Codigo) where grupo.Id_grupo=id_grupoin;
	end $$
delimiter ;



DELIMITER //
CREATE PROCEDURE Insc_cance_grupo(
  IN p_grupo INT,
  IN p_inscripcion_ID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Se produjo un error, la transacción se ha revertido.';
    END;

    START TRANSACTION;

    -- Realiza la inserción en la tabla "inscripcion_cancelacion_grupo"
    INSERT INTO inscripcion_cancelacion_grupo (Grupo_id, Inscripcion_id)
    VALUES (p_grupo, p_inscripcion_ID);

    COMMIT;

    SELECT 'La transacción se ha completado correctamente.';
END //

DELIMITER ;


-- Eliminar Inscripcion
DELIMITER $$

CREATE PROCEDURE Eliminar_inscripcion(IN id_inscripcionin INT, IN id_grupoin INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Se produjo un error, la transacción se ha revertido.';
    END;

    START TRANSACTION;

    -- Realiza la eliminación en la tabla "inscripcion_cancelacion_grupo"
    DELETE FROM inscripcion_cancelacion_grupo 
    WHERE inscripcion_cancelacion_grupo.Grupo_id = id_grupoin 
    AND inscripcion_cancelacion_grupo.Inscripcion_id = id_inscripcionin;

    COMMIT;

    SELECT 'La transacción se ha completado correctamente.';
END $$
DELIMITER ;



-- Mostrar Grupos cancelacion
DELIMITER //
CREATE PROCEDURE mostrar_idgrupo_asignatura_docente_creditos(
  IN p_Inscripcion_id int
)
BEGIN
	select Grupo_id, asignatura.Nombre as Nombre_asignatura, persona_vinculada.Nombre as Nombre_docente, creditos
    from inscripcion_cancelacion_grupo 
    join grupo on Id_grupo = Grupo_id 
    join asignatura on codigo = Asignatura_id
    join docente on Id_docente = Profesor_id
    join persona_vinculada on Persona_Vinculada_id=Documento
    
    
    where Inscripcion_id=p_Inscripcion_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE de_id_cita_a_creditos_disponibles(
  IN p_id_cita INT
)
BEGIN
	select Creditos_Disponibles from cita_inscripcion join historial_academico on (Id_Historial= cita_inscripcion.Historial_id) 
    join cupo_credito on (Id_Historial = cupo_credito.Historial_id)
    where Id_cita=p_id_cita;
END //
DELIMITER ;

