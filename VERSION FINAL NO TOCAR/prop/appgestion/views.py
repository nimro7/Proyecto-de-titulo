

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
    try:
        correo = request.POST['correo']
        asunto = request.POST['combo_box']
        comentarios = request.POST['textarea']
        if len(correo)>0 and len(asunto)>0 and len(comentarios)>0:
            if len(correo)<51 and len(asunto)<51 and len(comentarios)<201:
                CC = Contacto(correo=correo,asunto=asunto,comentarios=comentarios)
                CC.save()
                print(CC)
                messages.success(request,"Se a enviado su consulta con el asunto :  "+  request.POST['asunto'])
            else:
                messages.success(request,"Los campos exceden el maximo de caracteres permitido") 
        else:
            messages.success(request,"Faltan ingresar campos")
    except Exception as e:
        messages.success(request,"error inesperado")
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
    try:
        if request.method == 'POST':
            form = Projecto5Form(request.POST)
            print(request.FILES)
            imagen = request.FILES['imagen']
            titulo = request.POST.get('titulo')
            user = request.user
            categoria = request.POST.get('categoria')
            monto_recaudar = request.POST.get('monto_recaudar')
            categoria_beneficio = request.POST.get('categoria_beneficio')
            nombre_beneficio = request.POST.get('nombre_beneficio')
            descripcion_beneficio = request.POST.get('descripcion_beneficio')
            empresa = request.POST.get('empresa')
            descripcion_empresa = request.POST.get('Descripcion_Empresa')
            nombre_jefeProjecto  = request.POST.get('nombre_jefeProjecto')
            nombre_subjefe = request.POST.get('subjefe_proyecto')
            nombre_subSubjefe = request.POST.get('subSubjefe_proyecto')
            categoria = request.POST.get('categoria')
            facebook = request.POST.get('Facebook')
            instagram = request.POST.get('Instagram')
            twitter = request.POST.get('twitter')
            paginaWeb = request.POST.get('paginaWeb')
            if form.is_valid():
                contenido = form.cleaned_data['contenido']
            
            projecto5_obj = Projecto5.objects.create(
                user = user , categoria = categoria , titulo = titulo,
                contenido = contenido, imagen = imagen,
                monto_meta = monto_recaudar
            )

            beneficio_obj = Beneficio.objects.create(
                project = projecto5_obj , categoria_beneficio = categoria_beneficio, 
                nombre_beneficio = nombre_beneficio, descripcion_beneficio = descripcion_beneficio
                
            )
            equipo_obj = EquipoTrabajo.objects.create(
                project = projecto5_obj , empresa = empresa, 
                descripcion_empresa = descripcion_empresa, nombre_jefeProjecto = nombre_jefeProjecto ,
                nombre_subjefe = nombre_subjefe , nombre_subSubjefe = nombre_subSubjefe
                
            )
            materiales_obj = materiales.objects.create(
                project = projecto5_obj , facebook = facebook, 
                instagram = instagram, paginaWeb = paginaWeb,
                twitter = twitter
                
            )
            print(projecto5_obj)
            print(equipo_obj)
            print(beneficio_obj)
            print(materiales_obj)
            return redirect('/crear_proyecto/')
            
            
    
    except Exception as e :
        print(e)
    
    return render(request , 'crear.html' , context)
    
