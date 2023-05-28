from django.db import models
from django.conf import settings
#import User
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator,MinValueValidator

from phone_field import PhoneField
class Persona_vinculada(models.Model):
    Documento = models.IntegerField(primary_key=True,null=False,blank=False,unique=True)
    Usuario = models.OneToOneField( settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    Tipo_Documento= models.CharField(max_length=20,null=False,blank=False)
    Nombre = models.CharField(max_length=50,null=False,blank=False)
    Apellido = models.CharField(max_length=50,null=False,blank=False)
    Sexo = models.CharField(max_length=1,null=False,blank=False)
    Correo_Personal = models.EmailField(max_length=254,null=False,blank=False)
    Telefono= PhoneField(blank=True, help_text='Contact phone number')
    Nacionalidad = models.CharField(max_length=50,null=False,blank=False)
    Correo_institucional = models.EmailField(max_length=254,null=True,blank=True)
    Fecha_Vinculacion = models.DateField(null=False,blank=False)


    def save (self,*args, **kwargs):
        self.Correo_institucional=f"{self.Nombre}@unal.edu.co"
        super().save(*args, **kwargs)
        
    class Meta: 
        db_table = 'Persona_vinculada'
        verbose_name = 'Persona_vinculada'
        verbose_name_plural = 'Persona_vinculadas'
        
    def __str__(self):
        return "Nombre: {} ".format(self.Nombre)
    


class estudiante (models.Model):
    Id_estudiante = models.AutoField(primary_key=True,unique=True,null=False,blank=True)
    Peama = models.BooleanField(help_text="Pertenece al grupo Peama")
    Persona_Vinculada = models.OneToOneField(Persona_vinculada, on_delete=models.CASCADE)
    
    
    class Meta: 
        db_table ='Estudiante'
        verbose_name = 'Estudiante'
        verbose_name_plural= 'Estudiantes'
        
        
        
        
class Residencia(models.Model):
    Id_residencia = models.AutoField(primary_key=True,unique=True,null=False,blank=True)
    Estrato = models.IntegerField(validators=[MinValueValidator(0),MaxValueValidator(5)])
    Ciudad = models.CharField(max_length=50)
    Calle= models.CharField(max_length=255)
    Numero= models.IntegerField()
    Estudiante = models.ForeignKey(estudiante, on_delete=models.CASCADE)
    
    class Meta: 
        db_table ='Residencia'
        verbose_name = 'Residencia'
        verbose_name_plural= 'Residencias'
        
class Sede (models.Model):
    ID_sede = models.AutoField(primary_key=True,unique=True)
    Nombre = models.CharField(max_length=60)
    
    class Meta: 
        db_table ='Sede'
        verbose_name = 'Sede'
        verbose_name_plural= 'Sedes'
        
        
class Docente (models.Model):
    Id_docente = models.AutoField(primary_key=True,unique=True)
    Persona_Vinculada = models.OneToOneField(Persona_vinculada, on_delete=models.CASCADE)
    Sede = models.OneToOneField(Sede,on_delete=models.CASCADE)
    Ocasional = models.BooleanField(default=False)
    
    class Meta:
        db_table ='Docente'
        verbose_name = 'Docente'
        verbose_name_plural= 'Docentes'
        
        
class Decano (models.Model):
    Id_decano = models.AutoField(primary_key=True,unique=True)
    Docente= models.OneToOneField(Docente,on_delete=models.CASCADE)
    Ejerciendo = models.BooleanField(default=True)

    class Meta: 
        db_table ='Decano'
        verbose_name = 'Decano'
        verbose_name_plural= 'Decanos'

class Departamento (models.Model):
    Id_departamento = models.AutoField(primary_key=True,unique=True)
    Nombre = models.CharField(max_length=100)
    Sede = models.ForeignKey(Sede,on_delete=models.CASCADE)    
    class Meta: 
        db_table ='Departamento'
        verbose_name = 'Departamento'
        verbose_name_plural= 'Departamentos'
        
        
class Facultad(models.Model):
    Id_Facultad = models.AutoField(primary_key=True)
    Nombre = models.CharField(max_length=60)
    Departamento= models.ForeignKey(Departamento,on_delete=models.CASCADE)
    class Meta: 
        db_table ='Facultad'
        verbose_name = 'Facultad'
        verbose_name_plural= 'Facultades'
        
        
class Programa(models.Model):
    OPCIONES_GRADO = (
        ('pregrado', 'Pregrado'),
        ('posgrado', 'Posgrado'),
        ('maestria', 'Maestría'),
        ('doctorado', 'Doctorado'),
    )
    Codigo_SNIES= models.IntegerField(primary_key=True,unique=True)
    Nombre = models.CharField(max_length=100)
    Creditos_exigidos=models.IntegerField()
    Grado_licenciatura= models.CharField(max_length=60,choices=OPCIONES_GRADO)
    Facultad = models.ForeignKey(Facultad,on_delete=models.CASCADE)
    
    class Meta: 
        db_table ='Programa'
        verbose_name = 'Programa'
        verbose_name_plural= 'Programas'
        

class Asignatura(models.Model):
    Codigo= models.AutoField(primary_key=True,unique=True)
    Nombre = models.CharField(max_length=100)
    Tipologia = models.CharField(max_length=100)
    Creditos = models.IntegerField()
    Programa = models.ForeignKey(Programa,on_delete=models.CASCADE)
    
    
    class Meta:
        db_table='Asignatura'
        verbose_name = 'Asignatura'
        verbose_name_plural = 'ASignaturas'
        
        
class Grupo(models.Model):
    Id_grupo = models.AutoField(primary_key=True,unique=True)
    Numero_grupo=models.IntegerField()
    Cupos = models.IntegerField()
    Asignatura = models.ForeignKey(Asignatura,on_delete=models.CASCADE)
    Profesor = models.ForeignKey(Docente, on_delete=models.CASCADE)
    
    class Meta: 
        db_table ='Grupo'
        verbose_name = 'Grupo'
        verbose_name_plural= 'Grupos'
        
        
class Historial_Academico(models.Model):
    Id_Historial = models.AutoField(primary_key=True,unique=True)
    Papa= models.FloatField(default=0.0)
    Papi= models.FloatField(default=0.0)
    Pa = models.FloatField(default=0.0 )
    Estudiante = models.ForeignKey(estudiante,on_delete=models.CASCADE)
    Matriculas = models.IntegerField()
    Programa = models.OneToOneField(Programa,on_delete=models.CASCADE)
    
    class Meta:
        db_table='Historial_Academico'
        verbose_name = 'Historial_Academico'
        verbose_name_plural = 'Historiales_Academicos'
        
        
class Cupo_Creditos(models.Model):
    Creditos_Adicionales = models.IntegerField(default=0)
    Cupo_Creditos= models.IntegerField(default=0)
    Creditos_Disponibles = models.IntegerField()
    Creditos_Doble_titulacion = models.IntegerField(default=0)
    Historial= models.OneToOneField(Historial_Academico,on_delete=models.CASCADE)
    
    
    class Meta: 
        db_table ='Cupo_Credito'
        verbose_name = 'Cupo_Credito'
        verbose_name_plural= 'Cupo_Creditos'
        
        
        
class Resumen_Creditos(models.Model):
    Creditos_Exigidos = models.IntegerField(null=True)
    Creditos_Aprobados = models.IntegerField(null=True)
    Pendientes = models.IntegerField(null=True)
    Inscritos = models.IntegerField(null=True)
    Cursados = models.IntegerField(null=True)
    Historial =  models.OneToOneField(Historial_Academico,on_delete=models.CASCADE)
    
    class Meta: 
        db_table ='Resumen_Credito'
        verbose_name = 'Resumen_Credito'
        verbose_name_plural= 'Resumen_Creditos'
        
        
class Cita_Inscripcion (models.Model):
    Id_cita = models.AutoField(primary_key=True,unique=True)
    Fecha = models.DateField()
    Hora= models.TimeField()
    Historial = models.ForeignKey(Historial_Academico,on_delete=models.CASCADE) 
    class Meta:
        db_table='Cita_Inscripcion'
        verbose_name = 'Cita_Inscripcion'
        verbose_name_plural = 'Citas_Inscripcion'
        
class Inscripcion_cancelacion(models.Model):
    Id_incripcion = models.AutoField(primary_key=True,unique=True)
    Creditos_Disponibles = models.IntegerField()
    Semestre = models.IntegerField()
    Cita = models.OneToOneField(Cita_Inscripcion,on_delete=models.CASCADE)
    class Meta:
        db_table='Inscripcion_cancelacion'
        verbose_name = 'Inscripcion_cancelacion'
        verbose_name_plural = 'Inscripciones_cancelaciones'

class Inscripcion_cancelacion_grupo(models.Model):
        Id= models.AutoField(primary_key=True,unique=True)
        Inscripcion= models.ForeignKey(Inscripcion_cancelacion,on_delete=models.CASCADE)
        Grupo = models.ForeignKey(Grupo,on_delete=models.CASCADE)
    
        class Meta:
            db_table = 'Inscripcion_cancelacion_grupo'
            verbose_name = 'Inscripcion_cancelacion_grupo'
            verbose_name_plural = 'Inscripcion_cancelacion_grupos'      

class Espacio(models.Model):
    Id_espacio = models.AutoField(primary_key=True,unique=True)
    Dia = models.CharField(max_length=100)
    Hora= models.TimeField()
    Edificio = models.CharField(max_length=100)
    Salon = models.IntegerField()
    Grupo= models.ForeignKey(Grupo,on_delete=models.CASCADE)
    
class Meta:
    db_table='Espacio'
    verbose_name = 'Espacio'
    verbose_name_plural = 'Espacios'
    
    
    
    
class Notas(models.Model):
    Id_Nota = models.AutoField(primary_key=True,unique=True)
    Primer_Corte = models.FloatField(null=True,blank=True)
    Segundo_Corte = models.FloatField(null=True,blank=True)
    Tercer_Corte = models.FloatField(null=True,blank=True)  
    Nota_Definitiva = models.FloatField(null=True,blank=True)
    Aprobada = models.BooleanField()
    Inscripcion= models.ForeignKey(Inscripcion_cancelacion_grupo,on_delete=models.CASCADE)
    Historial = models.ManyToManyField(Historial_Academico)

    class Meta:
        db_table = 'Notas'
        verbose_name = 'Nota'
        verbose_name_plural = 'Notas'
        


class Pago_Semestre(models.Model):
    Id_Pago = models.AutoField(primary_key=True,unique=True)
    Fecha = models.DateField()
    Verificacion = models.BooleanField()
    Historial = models.ForeignKey(Historial_Academico,on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'Pago_Semestre'
        verbose_name = 'Pago_Semestre'
        verbose_name_plural = 'Pagos_Semestre'
        
        
