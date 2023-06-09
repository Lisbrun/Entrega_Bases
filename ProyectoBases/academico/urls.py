from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from .views import *
urlpatterns = [
    path('', registro, name='inicio'),
    path('Main/', main, name='main'),
    path('logout/', salir, name='salir'),
    path('Profesor/', Profesor, name='Profesor'),
    path('Estudiante/', Estudiante, name='Estudiante'),
    path('DatosPersonales/', DatosPersonales, name='DatosPersonales'),
    path('ModPersonales/', mod_estudiante, name='modestudiante'),
    path('CitaInscripcion/', CitaInscripcion, name='CitaInscripcion'),
    path('Inscripcion/<int:id>/', Inscripion, name='Inscribir'),
    path('Calificaciones', Calificaciones, name='Notas'),
    path('Buscador_Cursos', Buscador_cursos, name='Buscador'),
    path('Cancelaciones/<int:id>/', cancelaciones, name='Cancelaciones'),
    path('Inscripcion_Materias/<int:id>/',
        Inscripcion_Materias, name='Inscripcion_Materias'),
    path('Historia_Academica/' ,
        Historia_Academica, name='Historia_Academica'),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
