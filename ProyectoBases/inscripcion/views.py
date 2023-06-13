
from django.shortcuts import redirect
from .Inscripcion import Inscripcion
# Create your views here.

def agregar(request, inscripcion_id, grupo_id,id_cita):
    inscripcion = Inscripcion(request)
    inscripcion.agregar(inscripcion_id, grupo_id)
    return redirect("/Inscripcion_Materias/{}".format(id_cita))

def eliminar(request, inscripcion_id, grupo_id,id_cita):
    eliminar = Inscripcion(request)
    eliminar.eliminar_grupo(inscripcion_id, grupo_id)
    return redirect("/Inscripcion_Materias/{}".format(id_cita))
