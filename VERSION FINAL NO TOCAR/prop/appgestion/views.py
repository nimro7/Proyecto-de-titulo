

# Create your views here.
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import Http404
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as loginn, logout
from django.contrib import messages
from .form import *
# Create your views here.
def render_registro(request):
    return render(request,'registro.html')
def perfil(request):
    return render(request,'perfil.html')
def login(request):
    return render(request,'logins.html')
def foter(request):
    return render(request,'footer.html')
def index(request):
    return render(request,'index.html')
def contacto(request):
    return render(request,'contacto.html')

def bienvenida(request):
    return render(request,'bienvenida.html')

def crear_usuario(request):
    if request.method== "POST":

        username=request.POST['username']
        pass1=request.POST['pass1']
        email = request.POST['email']
        fname=request.POST['fname'] 
        lname=request.POST['lname']  
        
        myuser = User.objects.create_user(username, email, pass1)
        myuser.first_name = fname
        myuser.last_name = lname

        myuser.save()

        messages.success(request, "Tu cuenta ha sido creada")

        return redirect('/login/')
    
    return render(request, "registro.html")


def inicioSesion(request): 
    
    if request.method == 'POST':
        username = request.POST['username']
        pass1 = request.POST['pass1']

        user = authenticate(username=username, password=pass1)

        if user is not None:
            loginn(request, user)
            return render(request, "index.html")

        else:
            messages.error(request, "datos incorrectos")
            return redirect('/login/')
    return render(request, "/login/")


def cerrarSesion(request):
    logout(request)
    messages.success(request, "Sesión cerrada")
    return redirect('/login/')

def crear_proyecto(request):
    context = {'form' :Projecto5Form}
    return render(request,'crear.html',context)
