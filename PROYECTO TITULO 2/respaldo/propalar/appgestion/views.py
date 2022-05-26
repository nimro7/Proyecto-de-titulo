from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import Http404
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as loginn, logout
from django.contrib import messages
from appgestion.models import Contacto ,Proyecto ,Tipo_proyecto
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
def crear_proyecto(request):
    return render(request,'crear.html')
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


def contactar(request):
    try:
        correo = request.POST['correo']
        asunto = request.POST['asunto']
        comentarios = request.POST['textarea']
        if len(correo)>0 and len(asunto)>0 and len(comentarios)>0:
            if len(correo)<51 and len(asunto)<51 and len(comentarios)<201:
                CC = Contacto(correo=correo,asunto=asunto,comentarios=comentarios)
                CC.save()
                messages.success(request,"Se a enviado su consulta con el asunto :  "+  request.POST['asunto'])
            else:
                messages.success(request,"Los campos exceden el maximo de caracteres permitido") 
        else:
            messages.success(request,"Faltan ingresar campos")
    except Exception as e:
        messages.success(request,"error inesperado")
    return render(request,'contacto.html')

def crear_proyecto(request):
    try:
        titulo = request.POST['titulo']
        sub_titulo = request.POST['sub_titulo']
        cuerpo = request.POST['textarea_descrip']
        monto_meta = request.POST['monto_meta']
        monto_recauda = 0
        nombre_tipo = request.POST['combo_box']
        if len(titulo)>0 and len(sub_titulo)>0 and len(cuerpo)>0 and len(monto_meta)>0:
            pro = Proyecto(titulo=titulo,sub_titulo=sub_titulo,cuerpo=cuerpo,monto_meta=monto_meta,monto_recauda=monto_recauda)
            pro.save()
            tipo_pro = Tipo_proyecto(nombre_tipo=nombre_tipo,id_proyecto=titulo)
            tipo_pro.save()
            messages.success(request,"Se ha creado el Proyecto")
            
        else:
            messages.success(request,"Debe rellenar todos los campos")
    except Exception as e:
        messages.success(request,"error inesperado")
    return render(request,'crear.html')
    





    
    
  