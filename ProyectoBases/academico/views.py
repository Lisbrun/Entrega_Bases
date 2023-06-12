from django.shortcuts import render, redirect
from django.db import connection
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.http import HttpResponse
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required, user_passes_test
from datetime import date
from inscripcion.Inscripcion import Inscripcion
from django.db import IntegrityError
from django.http import HttpResponse




def procesoEstudiante(id):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_Datos(%s)", [id])
        resultado = cursor.fetchone()
        return resultado


def actualizarestudiante(id, direccion, telefono, correo, estrato, ciudad):
    with connection.cursor() as cursor:
        cursor.execute("call Actualizar_Datos(%s,%s,%s,%s,%s,%s)", [
                    id, correo, telefono, estrato, ciudad, direccion])


def mostrar_plan_estudio(id):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_Plan_estudio(%s)", [id])
        resultado = cursor.fetchall()
        return resultado


def mostrarCitas(id, programa):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_proximas_citas(%s,%s)", [id, programa])
        resultado = cursor.fetchone()
        return resultado


def mostrar_proximas_citas(id, programa):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_registro_citas(%s,%s)", [id, programa])
        results = cursor.fetchall()
    return results


def Crear_Inscripcion(id):
    with connection.cursor() as cursor:
        cursor.execute("call Crear_Inscripcion(%s)", [id])


def inscripcion_cancelacion(id):
    with connection.cursor() as cursor:
        cursor.execute("call obtener_inscripcion(%s)", [id])
        resultado = cursor.fetchone()
        return resultado


def obtener_materias(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call Filtrar_Materias(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def obtener_materias_optativas(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call Filtrar_Materias_optativas(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def obtener_materias_nivelacion(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call Filtrar_Materias_nivelacion(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def obtener_materias_fundamentalobli(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call  Filtrar_Materias_funobli(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def obtener_materias_grado(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call Filtrar_Materias_grado(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def obtener_materias_funopta(id, idcita):
    with connection.cursor() as cursor:
        cursor.execute("call Filtrar_Materias_funopta(%s,%s)", [id, idcita])
        resultado = cursor.fetchall()
        return resultado


def PAPA(id, historial):
    with connection.cursor() as cursor:
        cursor.execute("call mostar_papa(%s,%s)", [id, historial])
        resultado = cursor.fetchone()
        return resultado


def PAPi(id, historial):
    with connection.cursor() as cursor:
        cursor.execute("call mostar_Papi(%s,%s)", [id, historial])
        resultado = cursor.fetchone()
        return resultado


def PA(id, historial):
    with connection.cursor() as cursor:
        cursor.execute("call mostar_Pa(%s,%s)", [id, historial])
        resultado = cursor.fetchone()
        return resultado


def asignaturas(id, historial):
    with connection.cursor() as cursor:
        cursor.execute("call mostar_asignaturas(%s,%s)", [id, historial])
        resultado = cursor.fetchall()
        return resultado

def cupo_creditos(id, historial):
    with connection.cursor() as cursor:
        cursor.execute("call mostar_cupo(%s,%s)", [id, historial])
        resultado = cursor.fetchone()
        return resultado


def Semestre(id):
    with connection.cursor() as cursor:
        cursor.execute("call Semestres(%s)", [id])
        resultado = cursor.fetchall()
        return resultado


def Calificaciones_semestre(id, semestre):
    with connection.cursor() as cursor:
        cursor.execute("call Notas_Asignaturas(%s,%s)", [id, semestre])
        resultado = cursor.fetchall()
        return resultado


def sedes():
    with connection.cursor() as cursor:
        cursor.execute("call obtener_sedes")
        resultado = cursor.fetchall()
        return resultado


def facultades():
    with connection.cursor() as cursor:
        cursor.execute("call obtener_facultades")
        resultado = cursor.fetchall()
        return resultado


def Tipologias():
    with connection.cursor() as cursor:
        cursor.execute("call obtener_tipologias")
        resultado = cursor.fetchall()
        return resultado


def programas():
    with connection.cursor() as cursor:
        cursor.execute("call obtener_programas")
        resultado = cursor.fetchall()
        return resultado


def Buscador(sede, facultad, programa, tipologia, creditos, nombre):
    with connection.cursor() as cursor:
        cursor.execute("call Buscador(%s,%s,%s,%s,%s,%s)", [
            sede, facultad, programa, tipologia, creditos, nombre])
        resultado = cursor.fetchall()
        return resultado
    

def obtener_grupos(id_asignatura):
    with connection.cursor() as cursor:
        cursor.execute("call Obtener_grupos(%s)",[id_asignatura])
        resultado = cursor.fetchall()
        return resultado
    
def obtener_idinscripcion(id_cita):
    with connection.cursor() as cursor:
        cursor.execute("call obtener_idinscripcion(%s)",[id_cita])
        resultado = cursor.fetchone()
        return resultado
    
def info_inscripcion(id_grupo):
    with connection.cursor() as cursor:
        cursor.execute("call obtener_infoinscripcion(%s)",[id_grupo])
        resultado = cursor.fetchone()
        return resultado
    


def informacion_cancelacion(id_inscripcion):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_idgrupo_asignatura_docente_creditos(%s)",[id_inscripcion])
        resultado = cursor.fetchall()
        return resultado
    

def cancelar_materia(id_inscripcion,id_grupo):
    with connection.cursor() as cursor:
        cursor.execute("call Eliminar_inscripcion(%s,%s)",[id_inscripcion,id_grupo])
        resultado = cursor.fetchall()
        return resultado
    
    
    
def traer_disponibles(id_cita):
    with connection.cursor() as cursor:
        cursor.execute("call de_id_cita_a_creditos_disponibles(%s)",[id_cita])
        resultado = cursor.fetchone()
        return resultado
# ------------------------ vistas -----------------------------#


def main(request):
    if request.user.groups.filter(name__in=['Estudiante']):
        return redirect('Estudiante')
    elif request.user.groups.filter(name__in=['Profesor']):
        return redirect('Profesor')
    else:
        HttpResponse("No tiene permisos para acceder a esta pagina")


def Profesor(request):
    return render(request, 'academico/Profesor.html')


def Estudiante(request):
    
    return render(request, 'academico/estudiante2.html')


def registro(request):
    if request.method == "POST":
        usuario = request.POST['email']
        contraseña = request.POST['password']
        Usuario = authenticate(request, username=usuario, password=contraseña)
        if Usuario is not None:
            login(request, Usuario)
            usuario = request.user.id
            return redirect('main')

        else:
            return HttpResponse("Usuario no valido")

    form = AuthenticationForm()
    return render(request, 'academico/login.html', {'form': form})


def salir(request):
    logout(request)
    return redirect('inicio')


def DatosPersonales(request):
    if request.method == "POST":
        Direccion = request.POST['Direccion']
        Telefono = request.POST['Telefono']
        Correo = request.POST['Correo']
        Estrato = request.POST['Estrato']
        Ciudad = request.POST['Ciudad']
        actualizarestudiante(request.user.id, Direccion,
                            Telefono, Correo, Estrato, Ciudad)
        resultado = procesoEstudiante(request.user.id)

    user_id = request.user.id
    resultado = procesoEstudiante(user_id)
    return render(request, 'academico/DatosPersonales.html', {"resultado": resultado})


def mod_estudiante(request):
    return render(request, 'academico/modPersonales.html')


def CitaInscripcion(request):
    programas = mostrar_plan_estudio(request.user.id)
    if request.method == "POST":
        programa = request.POST['fruits']
        citas = mostrarCitas(request.user.id, programa)
        proximas_citas = mostrar_proximas_citas(request.user.id, programa)
        Fecha_actual = date.today()
        return render(request, 'academico/CitaInscripcion.html', {"programas": programas, "citas": citas, "proximas_citas": proximas_citas, "Fecha_actual": Fecha_actual})

    return render(request, 'academico/CitaInscripcion.html', {"programas": programas})


def Historia_Academica(request):
    programas = mostrar_plan_estudio(request.user.id)
    if request.method == "POST":
        programa = request.POST['Programas']
        pa = PA(request.user.id, programa)
        papi = PAPi(request.user.id, programa)
        papa = PAPA(request.user.id, programa)
        asignatura = asignaturas(request.user.id, programa)
        cupo_credito = cupo_creditos(request.user.id, programa)
        porcentaje_avance = (round(cupo_credito[4]/cupo_credito[5],2))*100
        return render(request, 'academico/Historia_Academica.html', {
            "programas": programas,
            "pa": pa, "papi": papi, 
            "papa": papa, 
            "asignatura": asignatura,
            "cupo_creditos": cupo_credito,
            "porcentaje_avance": porcentaje_avance

            })
    return render(request, 'academico/Historia_Academica.html', {"programas": programas})


def Calificaciones(request):
    periodos = Semestre(request.user.id)
    if request.method == "POST":
        semestre_elegido = request.POST['semestre']
        Asignaturas = Calificaciones_semestre(
            request.user.id, semestre_elegido)
        return render(request, 'academico/calificaciones.html', {
            "semestre": periodos,
            "Asignaturas": Asignaturas
        })

    return render(request, 'academico/calificaciones.html', {"semestre": periodos})


def Inscripion(request, id):
    try:
        Crear_Inscripcion(id)
    except IntegrityError:
        pass
    resultado2 = inscripcion_cancelacion(id)
    return render(request, 'academico/inscripcion/inscripcion.html', {"resultado": resultado2, "id_cita": id})

def cancelaciones(request, id):
    
    resultado2 = inscripcion_cancelacion(id)
    id_inscripcion = obtener_idinscripcion(id)
    materias_cancelacion = informacion_cancelacion(id_inscripcion)
    if request.method =="POST":
        materia = request.POST.get('materia')
        cancelar = cancelar_materia(id_inscripcion,materia)
        return redirect('Cancelaciones', id)
        
    if not materias_cancelacion:
        return redirect ('Inscripcion_Materias', id)
    return render(request, 'academico/inscripcion/cancelaciones.html', {
        "resultado": resultado2,
        "materias_cancelacion": materias_cancelacion,
        "id":id,
        })

def Inscripcion_Materias(request, id):
    eleccion =[]
    suma = 0
    inscripcion = Inscripcion(request)
    id_citaa=id
    materias = obtener_materias(request.user.id, id)
    optativas = obtener_materias_optativas(request.user.id, id)
    nivelacion = obtener_materias_nivelacion(request.user.id, id)
    fundamentalobli = obtener_materias_fundamentalobli(request.user.id, id)
    grado = obtener_materias_grado(request.user.id, id)
    funopta = obtener_materias_funopta(request.user.id, id)
    resultado2 = inscripcion_cancelacion(id)
    id_inscripcion = obtener_idinscripcion(id)
    disponibles= traer_disponibles(id_inscripcion)
    diccionario = request.session.get('inscripcion', {})
    print(disponibles)
    for key, value in diccionario.items():
        for value in value:
            resultadoins =info_inscripcion(value)
            eleccion.append(resultadoins)
    for inscripciones in eleccion:
        ultimo = inscripciones[-1]
        suma += ultimo
    
    if request.method =="POST":
        asignatura_ID = request.POST.get('id_asignatura')
        valor = request.POST.get('inscrito')
        grupos = obtener_grupos(asignatura_ID)
        if valor == 'Inscripcion':
            with connection.cursor() as cursor:
                for tupla in eleccion:
                    valor = tupla[0]
                    cursor.execute("CALL Insc_cance_grupo(%s, %s)",(valor, id_inscripcion))
            if 'inscripcion' in request.session:
                del request.session['inscripcion']
            return redirect('Estudiante')
            
        return render(request, 'academico/inscripcion/Materias.html', {
            "materias": materias,
            "optativas": optativas,
            "id": id,
            "nivelacion": nivelacion,
            "fundamentalobli": fundamentalobli,
            "grado": grado,
            "funopta": funopta,
            "resultado": resultado2,
            "grupos": grupos,
            "id_inscripcion": id_inscripcion,
            "id_citaa": id_citaa,
            "eleccion": eleccion,
            "suma": suma,
            "disponibles": disponibles,
            })
        
        
        
    return render(request, 'academico/inscripcion/Materias.html', {
        "materias": materias,
        "optativas": optativas, 
        "id": id, 
        "nivelacion": nivelacion,
        "fundamentalobli": fundamentalobli,
        "grado": grado, "funopta": funopta,
        "resultado": resultado2,
        "eleccion": eleccion,
        "suma": suma,
        "disponibles": disponibles,
        })


def Buscador_cursos(request):
    sede = sedes()
    facultad = facultades()
    tipologia = Tipologias()
    programa = programas()
    if request.method == "POST":
        sede_in = request.POST['sede']
        facultad_in = request.POST['facultad']
        tipologia_in = request.POST['Tipologia']
        programa_in = request.POST['programa']
        creditos_in = request.POST.get('creditos')
        if creditos_in:
            try:
                creditos_in = int(creditos_in)
            except ValueError:
            
                creditos_in = None
        else:
            creditos_in = None
        nombre_in = request.POST.get('Nombre')
        if nombre_in=="":
            nombre_in = None
        
        if tipologia_in=='#':
            tipologia_in = None
            
        cursos = Buscador(sede_in, facultad_in, programa_in,
                        tipologia_in, creditos_in, nombre_in)
        if not cursos:
            return render(request, 'academico/Buscador_cursos.html', {
                "sedes": sede,
                "facultades": facultad,
                "tipologias": tipologia,
                "programas": programa
            })
        else:
            return render(request, 'academico/buscador_cursos2.html', {
                "cursos": cursos
            })

    return render(request, 'academico/Buscador_cursos.html', {
        "sedes": sede,
        "facultades": facultad,
        "tipologias": tipologia,
        "programas": programa
    })
