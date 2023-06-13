-- Trigger inscripcion grupo
DELIMITER $$
CREATE TRIGGER Actualizacion_grupo
AFTER INSERT ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
    UPDATE grupo
    SET Cupos = Cupos - 1
    WHERE grupo.Id_grupo = NEW.grupo_id;
END $$
DELIMITER ;
DROP TRIGGER Actualizacion_grupo;

-- Trigger quitar inscripcion grupo
DELIMITER $$
CREATE TRIGGER Actualizacion_grupo_suma
AFTER DELETE ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
    UPDATE grupo
    SET Cupos = Cupos + 1
    WHERE grupo.Id_grupo = OLD.grupo_id;
END $$
DELIMITER ;

-- Trigger calcular definitiva
DELIMITER $$
CREATE TRIGGER Actualizar
BEFORE UPDATE ON notas
FOR EACH ROW
BEGIN
    SET NEW.Nota_Definitiva = round((NEW.Primer_Corte + NEW.Segundo_Corte + NEW.Tercer_Corte) / 3,2);
END $$
DELIMITER ;

-- Trigger Aprobacion
DELIMITER $$
CREATE TRIGGER Aprobacion
BEFORE UPDATE ON notas
FOR EACH ROW
BEGIN
    if new.Nota_Definitiva>=3  then 
    set new.Aprobada = 1;
    else
    set new.aprobada =0;
    end if;
END $$
DELIMITER ;


-- Si un estudiante saca mas de 3  aprueba la materia le aumenta los creditos *2 de la materia y si la pierde le quita esos creditos 
DROP TRIGGER Modificacion_Creditos;
DELIMITER $$
CREATE TRIGGER Modificacion_Creditos
After UPDATE ON notas
FOR EACH ROW
BEGIN
	declare creditos int;
    declare valorfk int;
    if new.Nota_Definitiva>=3 then
    
		select min(asignatura.Creditos) INTO creditos 
        from notas 
        join inscripcion_cancelacion_grupo as inscripcion on notas.Inscripcion_id=inscripcion.Id 
		join grupo on inscripcion.Grupo_id=grupo.Id_grupo 
        join asignatura on grupo.Asignatura_id=asignatura.Codigo 
        where notas.Id_Nota= new.Id_Nota;
        
       select distinct(historial_academico.Id_Historial) into valorfk  
       from historial_academico
       inner join notas_historial on (historial_academico.Id_Historial= notas_historial.historial_academico_id)
	   inner join notas on (notas_historial.notas_id= notas.Id_Nota )
	   where notas.Id_Nota= new.Id_Nota;

        update resumen_credito set resumen_credito.Creditos_Aprobados = resumen_credito.Creditos_Aprobados + creditos where resumen_credito.Historial_id=valorfk;
        update cupo_credito set cupo_credito.Creditos_Disponibles = cupo_credito.Creditos_Disponibles+ (creditos*2) where cupo_credito.Historial_id=valorfk;
        
    end if;
END $$
DELIMITER ;


-- inscritos :)
DELIMITER $$
CREATE TRIGGER Disponibles
AFTER INSERT ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
	declare creditos int;
    declare historialid int;
    
		select min(asignatura.Creditos) into creditos from inscripcion_cancelacion_grupo 
		inner join grupo on (inscripcion_cancelacion_grupo.Grupo_id=grupo.Id_grupo)
		inner join asignatura on (grupo.Asignatura_id=asignatura.Codigo)
        where inscripcion_cancelacion_grupo.Grupo_id=new.Grupo_id;
        
        select distinct(historial_academico.Id_Historial) into historialid from inscripcion_cancelacion_grupo
        inner join inscripcion_cancelacion on (inscripcion_cancelacion.Id_incripcion=inscripcion_cancelacion_grupo.Inscripcion_id)
        inner join cita_inscripcion on (cita_inscripcion.Id_cita=inscripcion_cancelacion.Cita_id)
        inner join historial_academico on (historial_academico.Id_Historial=cita_inscripcion.Historial_id)
        where inscripcion_cancelacion_grupo.Inscripcion_id=new.Inscripcion_id;
       
        update cupo_credito set cupo_credito.Creditos_Disponibles= cupo_credito.Creditos_Disponibles-creditos where cupo_credito.Historial_id=historialid;
        update resumen_credito set resumen_credito.Inscritos= resumen_credito.Inscritos+creditos 
        where resumen_credito.Historial_id=historialid;
END $$
DELIMITER ;








drop trigger Inscritos_eliminar;
DELIMITER $$
CREATE TRIGGER Inscritos_eliminar
BEFORE DELETE ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
	declare creditos int;
    declare historialid int;
    
		select min(asignatura.Creditos) into creditos from inscripcion_cancelacion_grupo 
		inner join grupo on (inscripcion_cancelacion_grupo.Grupo_id=grupo.Id_grupo)
		inner join asignatura on (grupo.Asignatura_id=asignatura.Codigo)
        where inscripcion_cancelacion_grupo.Grupo_id=old.Grupo_id;
        
        select distinct(historial_academico.Id_Historial) into historialid from inscripcion_cancelacion_grupo
        inner join inscripcion_cancelacion on (inscripcion_cancelacion.Id_incripcion=inscripcion_cancelacion_grupo.Inscripcion_id)
        inner join cita_inscripcion on (cita_inscripcion.Id_cita=inscripcion_cancelacion.Cita_id)
        inner join historial_academico on (historial_academico.Id_Historial=cita_inscripcion.Historial_id)
        where inscripcion_cancelacion_grupo.Inscripcion_id=old.Inscripcion_id;
       
        update resumen_credito set resumen_credito.Inscritos= resumen_credito.Inscritos-creditos 
        where resumen_credito.Historial_id=historialid;

END $$
DELIMITER ;





-- Apenas se cree un Historial crear un resumen creditos y un cupo creditos
DELIMITER $$
CREATE TRIGGER Creditos_exigidos
AFTEr INSERT ON historial_academico
FOR EACH ROW
BEGIN
	declare exigidos int;
    declare historialid int;
    select Id_Historial into historialid from historial_academico where historial_academico.Id_Historial=new.Id_Historial;
    select Creditos_exigidos into exigidos from historial_academico inner join programa on historial_academico.Programa_id= programa.Codigo_SNIES 
    where historial_academico.Id_Historial=new.Id_Historial;
    insert into resumen_credito values (null,exigidos,0,0,0,0,historialid);
    insert into cupo_credito values (null,0,0,30,0,historialid);
END $$
DELIMITER ;


-- Apenas se cree persona vinculada con el usuario asignar a el usuario el correo institucional de persona vinculada 
DELIMITER $$
CREATE TRIGGER Correo_Usuario
BEFORE INSERT ON persona_vinculada
FOR EACH ROW
BEGIN
    DECLARE siglasemail VARCHAR(30);
    DECLARE apellidocuanto FLOAT(2);
    SET apellidocuanto = LOCATE(' ', NEW.Apellido);
    
    IF apellidocuanto > 0 THEN
        SET siglasemail = CONCAT(LEFT(NEW.Nombre, 2), SUBSTRING(NEW.Apellido, 1, LOCATE(' ', NEW.Apellido) - 1), FLOOR(RAND() * (10 - 1 + 1)) + 1, '@unal.edu.co');
        SET NEW.Correo_institucional = siglasemail;
        UPDATE auth_user SET email = siglasemail WHERE id = NEW.Usuario_id;
    ELSE 
        SET siglasemail = CONCAT(LEFT(NEW.Nombre, 2), NEW.Apellido, FLOOR(RAND() * (10 - 1 + 1)) + 1, '@unal.edu.co');
        SET NEW.Correo_institucional = siglasemail;
        UPDATE auth_user SET email = siglasemail WHERE id = NEW.Usuario_id;
    END IF;
END $$
DELIMITER ;
drop trigger Asignar_periodo;
-- Asignar un periodo academico
drop trigger  Asignar_periodo;
DELIMITER $$
CREATE TRIGGER Asignar_periodo
BEFORE INSERT ON inscripcion_cancelacion
FOR EACH ROW
BEGIN
    DECLARE mes_actual INT;
    DECLARE disponibles varchar(30);
    SELECT cupo_credito.Creditos_Disponibles INTO disponibles FROM cita_inscripcion
    INNER JOIN historial_academico ON cita_inscripcion.Historial_id = historial_academico.Id_Historial
    INNER JOIN cupo_credito ON historial_academico.Id_Historial = cupo_credito.Historial_id where cita_inscripcion.Id_cita=new.Cita_id;
    
    SET mes_actual = MONTH(CURDATE());
    IF mes_actual < 6 THEN 
        SET new.Semestre = CONCAT(YEAR(CURDATE()), 1);
        SET new.Creditos_Disponibles = disponibles;
    ELSE 
        SET new.Semestre = CONCAT(YEAR(CURDATE()), 2);
        SET new.Creditos_Disponibles = disponibles;
    END IF;
END $$
DELIMITER ;


-- Trigger creacion Nota
drop trigger Creacion_tablaNota;
DELIMITER $$
CREATE TRIGGER Creacion_tablaNota
AFTER INSERT ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
    insert into notas(notas.Primer_Corte,notas.Segundo_Corte,notas.Tercer_Corte,notas.Aprobada,notas.Inscripcion_id,notas.Nota_Definitiva)
    values (0,0,0,False,new.Id,0);
    
END $$
DELIMITER ;

-- Trigger Nota-Historial

DELIMITER $$
CREATE TRIGGER Nota_Historial
AFTER INSERT ON notas
FOR EACH ROW
BEGIN
	declare id_Historiall int ;
	select historial_academico.Id_Historial into id_Historiall from notas 
    inner join inscripcion_cancelacion_grupo on (notas.Inscripcion_id=inscripcion_cancelacion_grupo.Id)
    inner join inscripcion_cancelacion on (inscripcion_cancelacion.Id_incripcion= inscripcion_cancelacion_grupo.Inscripcion_id)
    inner join cita_inscripcion on (cita_inscripcion.Id_cita = inscripcion_cancelacion.Cita_id)
    inner join historial_academico on (historial_academico.Id_Historial=cita_inscripcion.Historial_id)
    where notas.Inscripcion_id=new.Inscripcion_id;
    insert into notas_historial(notas_historial.historial_academico_id,notas_historial.notas_id)
    values (id_Historiall,new.Id_Nota);
    
END $$
DELIMITER ;




ALTER TABLE notas DROP FOREIGN KEY Notas_Inscripcion_id_a2464d71_fk_Inscripci;
ALTER TABLE notas ADD CONSTRAINT Notas_Inscripcion_id_a2464d71_fk_Inscripci FOREIGN KEY (Inscripcion_id) REFERENCES inscripcion_cancelacion_grupo (Id) ON DELETE CASCADE;

ALTER TABLE notas_historial DROP FOREIGN KEY Notas_Historial_notas_id_96dc0ade_fk_Notas_Id_Nota;
ALTER TABLE notas_historial ADD CONSTRAINT Notas_Historial_notas_id_96dc0ade_fk_Notas_Id_Nota FOREIGN KEY (notas_id) REFERENCES notas (Id_Nota) ON DELETE CASCADE;
