from django.shortcuts import render,redirect
from django.db import connection
from django.contrib.auth.models import User
from django.contrib.auth import login,logout, authenticate
from django.http import HttpResponse    
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required, user_passes_test
#trae user
# Create your views here.
def procesoEstudiante(id):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_Datos(%s)",[id])
        resultado = cursor.fetchone()
        return resultado

def actualizarestudiante(id,direccion,telefono,correo,estrato,ciudad):
    with connection.cursor() as cursor:
        cursor.execute("call Actualizar_Datos(%s,%s,%s,%s,%s,%s)",[id,correo,telefono,estrato,ciudad,direccion])
        
def main(request):
    
    if request.user.groups.filter(name__in=['Estudiante']):
        return redirect('Estudiante')
    elif request.user.groups.filter(name__in=['Profesor']):
        return redirect('Profesor')
    else: 
        HttpResponse("No tiene permisos para acceder a esta pagina")

def Profesor(request):
    return render(request,'academico/Profesor.html')

def Estudiante(request):
    
    return render(request,'academico/Estudiante.html')

def registro(request):
    if request.method =="POST":
        usuario = request.POST['email']
        contraseña = request.POST['password']
        Usuario = authenticate(request, username=usuario, password=contraseña)
        if Usuario is not None:
            login(request,Usuario)
            usuario = request.user.id
            return redirect('main')
        
        else:
            return HttpResponse("Usuario no valido")
            
    form=AuthenticationForm()
    return render(request,'academico/login.html',{'form':form})


def salir(request):
    logout(request)
    return redirect('inicio')


def DatosPersonales(request):
    if request.method =="POST":
        Direccion = request.POST['Direccion']
        Telefono = request.POST['Telefono']
        Correo = request.POST['Correo']
        Estrato = request.POST['Estrato']
        Ciudad = request.POST['Ciudad']
        actualizarestudiante(request.user.id,Direccion,Telefono,Correo,Estrato,Ciudad)
        resultado = procesoEstudiante(request.user.id)
        
    
    user_id = request.user.id
    resultado =procesoEstudiante(user_id)
    return render (request,'academico/DatosPersonales.html',{"resultado":resultado})

    
def mod_estudiante(request):
    
    
    return render (request,'academico/modPersonales.html')    
    
def Historia_Academica(request):
    pass
def Calificaciones(request):
    pass