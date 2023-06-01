from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from .views import *
urlpatterns = [
    path('',registro,name='inicio'),
    path('Main/',main , name='main'),
    path ('logout/', salir , name='salir'),
    path('Profesor/',Profesor,name='Profesor'),
    path('Estudiante/',Estudiante,name='Estudiante'),
    path('DatosPersonales/',DatosPersonales,name='DatosPersonales'),
    path ('Historia_Academica, Historia_Academica',Historia_Academica,name='Historia_Academica'),
    path ('Calificaciones',Calificaciones, name='Calificaciones'),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
