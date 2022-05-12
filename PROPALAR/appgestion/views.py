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
    nickname=request.GET.get("nickname")
    contraseña=request.GET.get("contrasena")
    nombres=request.GET.get("Nombres")
    apellidos_pat=request.GET.get("appPaterno")
    apellido_mat=request.GET.get("appMater")
    correo=request.GET.get("correo")
    telefono=request.GET.get("telefono")
    roll = 1
    us=usuarios(nickname,contraseña,nombres,apellidos_pat,apellido_mat,correo,telefono,roll)
    us.save()
    mensaje="Usuario Registrado"
    
    
    return HttpResponse(mensaje)
