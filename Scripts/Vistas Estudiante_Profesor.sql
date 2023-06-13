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
       join programa on (programa.Codigo_SNIES=historial_academico.Programa_id);




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


drop view if exists vts_buscador_cursos;
CREATE VIEW  vts_buscador_cursos AS
SELECT sede.Nombre AS Sede, facultad.Nombre AS Facultad, programa.Codigo_SNIES, programa.Nombre AS programa,
asignatura.Codigo, asignatura.Nombre As asignatura, asignatura.Creditos, asignatura.Tipologia, grupo.Numero_grupo,
grupo.Cupos,persona_vinculada.Nombre AS Profesor
	from sede
    join facultad on (sede.ID_sede=facultad.Sede_id)
	join programa on (facultad.Id_Facultad=programa.Facultad_id)
    join asignatura on (programa.Codigo_SNIES=asignatura.Programa_id)
    join grupo on (asignatura.Codigo=grupo.Asignatura_id)
    join docente on (grupo.Profesor_id=docente.Id_docente)
    join persona_vinculada on (persona_vinculada.Documento=docente.Persona_Vinculada_id);


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


-- Vista cita de inscripcion 
Drop view if exists Inscripcion;
Create view Inscripcion as
Select Semestre,programa.Nombre, Cita_id as idcita , facultad.Nombre as "nom" from inscripcion_cancelacion
inner join cita_inscripcion on cita_inscripcion.Id_cita=inscripcion_cancelacion.Cita_id
inner join historial_academico on historial_academico.Id_Historial=cita_inscripcion.Historial_id
inner join programa on programa.Codigo_SNIES=historial_academico.Programa_id
inner join facultad on facultad.Id_Facultad= programa.Facultad_id
;




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




-- vista Grupos 
drop view if exists Obtener_grupos;
create View Obtener_grupos as 
SELECT persona_vinculada.Nombre,  grupo.Id_grupo, grupo.Cupos, CONCAT(espacio.Edificio, " ", espacio.Salon), CONCAT(espacio.Dia, " ",  DATE_FORMAT(espacio.Hora,'%h:%i %p')),Asignatura_id as idasignatura
FROM asignatura
INNER JOIN grupo ON grupo.Asignatura_id = asignatura.Codigo
INNER JOIN academico_espacio AS espacio ON espacio.Grupo_id = grupo.Id_grupo
INNER JOIN docente ON docente.Id_docente = grupo.Profesor_id
INNER JOIN persona_vinculada ON persona_vinculada.Documento = docente.Persona_Vinculada_id;




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
       