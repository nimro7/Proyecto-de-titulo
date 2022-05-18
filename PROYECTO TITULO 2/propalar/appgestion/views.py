from django.shortcuts import render
from django.http import HttpResponse
from django.http import Http404
from appgestion.models import Usuarios
from django.contrib import messages
# Create your views here.
def render_registro(request):
    return render(request,'registro.html')
def login(request):
    return render(request,'logins.html')
def foter(request):
    return render(request,'footer.html')
def index(request):
    return render(request,'index.html')

def crear_usuario(request):
    nickname=request.GET["nickname"]
    contrasena=request.GET["contrasena"]
    nombres=request.GET["Nombres"] 
    apellidos_pat=request.GET["appPaterno"]  
    apellido_mat=request.GET["appMater"]  
    correo=request.GET["correo"]    
    telefono=request.GET["telefono"]   
    if  len(nickname)>0:
        user=Usuarios(nickname=nickname,contrasena=contrasena,nombres=nombres,
        apellidos_pat=apellidos_pat,apellido_mat=apellido_mat,correo=correo,
        telefono=telefono
        ) 
        user.save()
        messages.success(request ,"USUARIO CREADO INTENTE INICIAR SESSION")
        return render(request,'logins.html')

    else:
        messages.error(request,"usuario No ingresado o faltan datos...")
        return render(request,'registro.html')

def paginaLogin(request):
    nicknamevalidar=request.GET["nickname"]
    contrasenavalidar=request.GET["contrasena"]
    detalleUsuarios= Usuarios.objects.get(nickname, contrasena)
    print("usuario=", detalleUsuario)
    if  (detalleUsuario.nickname==nicknamevalidar):
        return render(request, 'index.html') 
    else:
        messages.success(request, 'Nombre de usuario o password no es correcto')


    

    
    
    
  