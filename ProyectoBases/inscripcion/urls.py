from django.urls import path

from .views import *

app_name = "inscripcion"

urlpatterns = [
    path("Agregar/<int:inscripcion_id>/<int:grupo_id>/<int:id_cita>/", agregar, name="agregar"),
    path("Eliminar/<int:inscripcion_id>/<int:grupo_id>/<int:id_cita>/", eliminar, name="eliminar"),
]
