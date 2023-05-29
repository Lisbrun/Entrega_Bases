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
drop trigger Aprobacion;



-- Si un estudiante saca mas de 3  aprueba la materia le aumenta los creditos *2 de la materia y si la pierde le quita esos creditos 
DELIMITER $$
CREATE TRIGGER Modificacion_Creditos
BEFORE UPDATE ON notas
FOR EACH ROW
BEGIN
	declare creditos int;
    declare valorfk int;
    if new.Nota_Definitiva>=3  then
    
		select asignatura.Creditos INTO creditos from notas inner join inscripcion_cancelacion_grupo as inscripcion on notas.Inscripcion_id=inscripcion.Id 
		inner join grupo on inscripcion.Grupo_id=grupo.Id_grupo inner join asignatura on Asignatura_id=grupo.Asignatura_id where notas.Id_Nota= new.Id_Nota;
        
       select his.Id_Historial into valorfk  from notas inner join inscripcion_cancelacion_grupo as inscripcion_grupo on notas.Inscripcion_id=inscripcion_grupo.Id 
	inner join inscripcion_cancelacion inscripcion on inscripcion.Id_incripcion=inscripcion_grupo.Inscripcion_id inner join cita_inscripcion cita
	on cita.Id_cita=inscripcion.Cita_id inner join historial_academico his on his.Id_Historial= cita.Historial_id where notas.Id_Nota= new.Id_Nota;
    
        update resumen_credito set resumen_credito.Creditos_Aprobados=creditos where resumen_credito.Historial_id=valorfk;
        update cupo_credito set cupo_credito.Creditos_Disponibles= cupo_credito.Creditos_Disponibles+ (creditos*2) where cupo_credito.Historial_id=valorfk;
	else 
		update cupo_credito set cupo_credito.Creditos_Disponibles= cupo_credito.Creditos_Disponibles- creditos*2 where cupo_credito.Historial_id=valorfk;
    
    end if;
END $$
DELIMITER ;

-- inscritos :)
DELIMITER $$
CREATE TRIGGER Inscritos
AFTER INSERT ON inscripcion_cancelacion_grupo
FOR EACH ROW
BEGIN
	declare creditoss int;
    declare valorfks int;
    
		select asignatura.Creditos INTO creditoss from  inscripcion_cancelacion_grupo as inscripcion inner join grupo on inscripcion.Grupo_id=grupo.Id_grupo 
        inner join asignatura on Asignatura_id=grupo.Asignatura_id where inscripcion.Id= new.Id;
        
       select Id_Historial into valorfks  from  inscripcion_cancelacion_grupo inscripcion_grupo inner join inscripcion_cancelacion as inscripcion2 
       on inscripcion_grupo.Inscripcion_id= inscripcion2.Id_incripcion inner join cita_inscripcion as cita on inscripcion2.Cita_id=cita.Id_cita
       inner join historial_academico his on his.Id_Historial=cita.Historial_id where inscripcion_grupo.Id=new.Id;
       
        update resumen_credito set resumen_credito.Inscritos= resumen_credito.Inscritos+Creditoss where resumen_credito.Historial_id=valorfks;
        
        UPDATE grupo SET Cupos = Cupos - 1 WHERE grupo.Id_grupo = NEW.grupo_id;

END $$
DELIMITER ;

show triggers;
DROP TRIGGER Inscritos;




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
AFTER INSERT ON persona_vinculada
FOR EACH ROW
BEGIN
	declare miemail varchar(50);
    select Correo_institucional into miemail from persona_vinculada as persona where persona.Usuario_id=new.Usuario_id;
	update auth_user set auth_user.email=miemail where auth_user.id=new.Usuario_id ;

END $$
DELIMITER ;

