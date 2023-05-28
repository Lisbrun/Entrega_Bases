from django.contrib import admin
from .models import *
# Register your models here.
@admin.register(Persona_vinculada)
class Admin_persona(admin.ModelAdmin):
    exclude=('Correo_institucional',)
    

@admin.register(estudiante)
class admin_estudiante(admin.ModelAdmin):
    exclude=(' Id_estudiante',)
    
@admin.register(Residencia)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_residencia',)
    
    
@admin.register(Sede)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_sede',)
    
        
@admin.register(Departamento)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_departamento',)
        
@admin.register(Facultad)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_Facultad',)
        
@admin.register(Programa)
class admin_residencia(admin.ModelAdmin):
    pass

@admin.register(Docente)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_docente',)
    
@admin.register(Decano)
class admin_residencia(admin.ModelAdmin):
    exclude=('Id_decano',)
    
@admin.register(Asignatura)
class admin_residencia(admin.ModelAdmin):
    pass

@admin.register(Grupo)
class admin_grupo(admin.ModelAdmin):
    pass

@admin.register(Historial_Academico)
class admin_historial(admin.ModelAdmin):
    pass

@admin.register(Cupo_Creditos)
class admin_cupocreditos(admin.ModelAdmin):
    pass

@admin.register(Resumen_Creditos)
class admin_resumencreditos(admin.ModelAdmin):
    pass
@admin.register(Cita_Inscripcion)
class admin_citainscripcion(admin.ModelAdmin):
    pass

@admin.register(Inscripcion_cancelacion)
class admin_inscripcioncancelacion(admin.ModelAdmin):
    pass

@admin.register(Espacio)
class admin_espacio(admin.ModelAdmin):
    pass


@admin.register(Inscripcion_cancelacion_grupo)
class admin_inscripcioncancelaciongrupo(admin.ModelAdmin):
    pass

@admin.register(Notas)
class admin_notas(admin.ModelAdmin):
    exclude=('Id_Nota',)
    
@admin.register(Pago_Semestre)
class admin_notas(admin.ModelAdmin):
    pass