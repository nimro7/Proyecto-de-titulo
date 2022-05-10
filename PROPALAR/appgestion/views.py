from django.shortcuts import render
from django.http import HttpResponse
from django.http import Http404
from appgestion.models import usuarios
from django.contrib import messages
# Create your views here.
def index(request):
    return render(request,'index.html')

def registro(request):
    return render(request,'registro.html')

def login(request):
    return render(request,'logins.html')

def explorar(request):
    return render(request,'explorar.html')
    
def contacto(request):
    return render(request,'contacto.html')

def crear(request):
    return render(request,'crear.html')   

def bienvenida(request):
    return render(request,'bienvenida.html')

def paginaLogin(request):    
    if request.method=='POST':     
        try:             
            detalleUsuario=usuario.objects.get(nickname=request.POST['nickname'], contraseña=request.POST['contraseña'])           
            print("usuario=", detalleUsuario)            
            request.session['nickname']=detalleUsuario.nickname          
            return render(request, 'index.html')         
        except usuario.DoesNotExist as e: 
            messages.success(request, 'Nombre de usuario o password no es correcto')    
    return render(request, 'logins.html')

def registroUsuario(request):
    nickname=request.GET["nickname"]
    contraseña=request.GET["contrasena"]
    nombres=request.GET["Nombres"]
    apellidos_pat=request.GET["appPaterno"]
    apellido_mat=request.GET["appMater"]
    correo=request.GET["correo"]
    telefono=request.GET["telefono"]
    roll = 1
    if len(nickname)>0:
        us=usuarios(nickname=nickname,contraseña=contraseña,nombres=nombres,apellido_pat=apellidos_pat,apellido_mat=apellido_mat,correo=correo,telefono=telefono,roll=roll)
        us.save()
        mensaje="Usuario Registrado"
    else:
        mensaje="usuario no registrado"
    return HttpResponse(mensaje)
