from django.shortcuts import render,redirect
from django.db import connection
from django.contrib.auth.models import User
from django.contrib.auth import login,logout, authenticate
from django.http import HttpResponse
from django.contrib.auth.forms import AuthenticationForm
#trae user
# Create your views here.
def proceso(id):
    with connection.cursor() as cursor:
        cursor.execute("call mostrar_Datos(%s)",[id])
        resultado = cursor.fetchone()
        return resultado

def main(request):
    user_id = request.user.id
    resultado =proceso(user_id)
    return render(request,'academico/index.html',{'Datos':resultado})



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
