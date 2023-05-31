from django.shortcuts import render,redirect
from django.db import connection
from django.contrib.auth.models import User
from django.contrib.auth import login,logout, authenticate
from django.http import HttpResponse    
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required, user_passes_test
#trae user
# Create your views here.
def proceso(id):
    with connection.cursor() as cursor:
        cursor.execute("call personavinculada(%s)",[id])
        resultado = cursor.fetchone()
        return resultado

def main(request):
    user_id = request.user.id
    resultado =proceso(user_id)
    if request.user.groups.filter(name__in=['Estudiante']):
        return render(request,'academico/Estudiante.html',{'Datos':resultado})
    elif request.user.groups.filter(name__in=['Profesor']):
        
        return render(request,'academico/Profesor.html',{'Datos':resultado})

    else: 
        HttpResponse("No tiene permisos para acceder a esta pagina")



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
    pass
def Historia_Academica(request):
    pass
def Calificaciones(request):
    pass