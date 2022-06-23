

# Create your views here.
from csv import excel_tab
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import Http404
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as loginn, logout
from django.contrib import messages
from django.db.models import Sum
from .form import *
from django.core.paginator import Paginator
# Create your views here.
def render_registro(request):
    return render(request,'registro.html')
def perfil(request):
    context = {}
    try:
        
        datos_user = Datos_usuario.objects.filter(user = request.user).first()
        context['datos_user'] = datos_user
        datos_banco = Datos_banco.objects.filter(user = request.user).first()
        context['datos_banco'] = datos_banco
        
        projecto5_objs = Projecto5.objects.filter(user = request.user)
        context['projecto5_objs'] =  projecto5_objs
        proyecto_equipo = EquipoTrabajo.objects.filter(project = projecto5_objs).first()
        context['proyecto_equipo'] = proyecto_equipo
    except Exception as e:
        print(e)
    
    if request.method == 'POST':
        foto = request.FILES['foto']
        foto_obj = Datos_usuario.objects.filter( user = request.user).update(
            foto = foto
        )
    
    return render(request,'perfil.html', context)

def login(request):
    return render(request,'logins.html')
def foter(request):
    return render(request,'footer.html')
def index(request):
    context = {}
    try:

        proyecto_obj = Projecto5.objects.all().order_by('-monto_total')

        paginator = Paginator(proyecto_obj, 4)

        pagina = paginator.get_page(1)

        context['pagina'] =  pagina
    except Exception as e:
        print(e)

    return render(request,'index.html', context)
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
        genero=request.POST['genero']
        rut=request.POST['rut']
        myuser = User.objects.create_user(username, email, pass1)
        myuser.first_name = fname
        myuser.last_name = lname
        myuser.save()
        datos_user= Datos_usuario.objects.create(user = myuser, genero = genero)
        datos_banco= Datos_banco.objects.create(user = myuser, rut = rut)
        datos_user.save()
        datos_banco.save()

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
            return redirect('/general/')
            
            
    
    except Exception as e :
        print(e)
    
    return render(request , 'crear.html' , context)
    
def administrar_proyecto(request):
    context = {}
    
    try:
        projecto5_objs = Projecto5.objects.filter(user = request.user)
        context['projecto5_objs'] =  projecto5_objs
    except Exception as e: 
        print(e)
    
    print(context)
    return render(request , 'administrar.html' ,context)

def proyecto_detalle(request , slug):
    context = {}
    try:
        proyecto_obj = Projecto5.objects.filter(slug = slug).first()
        context['proyecto_obj'] =  proyecto_obj
        proyecto_beneficio = Beneficio.objects.filter(project = proyecto_obj).first()
        context['proyecto_beneficio'] = proyecto_beneficio
        proyecto_equipo = EquipoTrabajo.objects.filter(project = proyecto_obj).first()
        context['proyecto_equipo'] = proyecto_equipo
        proyecto_materiales = materiales.objects.filter(project = proyecto_obj).first()
        context['proyecto_materiales'] = proyecto_materiales
        
    except Exception as e:
        print(e)
    return render(request , 'detalle.html' , context)

def general(request):

    context = {'proyectos' : Projecto5.objects.all()}
    return render(request , 'general.html' , context)

def donar(request, id):

    context = {}
    try:
            
        datos_user = Datos_usuario.objects.filter(user = request.user).first()
        context['datos_user'] = datos_user
        datos_banco = Datos_banco.objects.filter(user = request.user).first()
        context['datos_banco'] = datos_banco
            
        projecto5_objs = Projecto5.objects.filter(id = id).first()
        context['projecto5_objs'] =  projecto5_objs
        if request.method == 'POST':
            projecto5_objs = Projecto5.objects.filter(id = id).first()
            monto_trans = request.POST.get('monto')
            user = request.user
            resultado = request.POST.get('resultado')
            
            
            
            transaccion_monto = transaccion.objects.create(
                user = user, project = projecto5_objs,
                monto = monto_trans)

            print(transaccion_monto)
            
            projecto5_objs = Projecto5.objects.filter(id = id).update(
                monto_total = resultado
            )
            

            return redirect('/general/')
    except Exception as e:
        print(e)



    return render(request,'donar_proyecto.html', context)

def proyecto_borrar(request , id):
    try:
        projecto5_obj = Projecto5.objects.get(id = id)
        if projecto5_obj.user == request.user:
            projecto5_obj.delete()
            
            
        else:
            print("error")
        
        
            
        
    except Exception as e :
        print(e)

    return redirect('/perfil/')

def modificar_proyecto(request , slug ):
    context = {}
    
    try:
        
        
        projecto5_obj = Projecto5.objects.get(slug = slug)
        equipo_obj = EquipoTrabajo.objects.get(project = projecto5_obj)
        materiales_obj = materiales.objects.get(project = projecto5_obj)
        beneficio_obj = Beneficio.objects.get(project = projecto5_obj)
        if projecto5_obj.user != request.user:
            return redirect('/')
        
        initial_dict = {'contenido': projecto5_obj.contenido}
        form = Projecto5Form(initial = initial_dict)
        if request.method == 'POST':
            form = Projecto5Form(request.POST, request.FILES)
            print(request.FILES)
            imagen = request.FILES['imagen']
            contenido = request.POST.get('contenido')
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
            
            
            projecto5_obj = Projecto5.objects.filter( slug = slug).update(
                user = user , categoria = categoria , titulo = titulo,
                contenido = contenido, imagen = imagen,
                monto_meta = monto_recaudar
            )

            
                
            beneficio_obj = Beneficio.objects.filter( project = projecto5_obj).update(
                categoria_beneficio = categoria_beneficio, 
                nombre_beneficio = nombre_beneficio, descripcion_beneficio = descripcion_beneficio
                
            )
            equipo_obj = EquipoTrabajo.objects.filter( project = projecto5_obj).update(
                empresa = empresa, 
                descripcion_empresa = descripcion_empresa, nombre_jefeProjecto = nombre_jefeProjecto ,
                nombre_subjefe = nombre_subjefe , nombre_subSubjefe = nombre_subSubjefe
                
            )
            materiales_obj = materiales.objects.filter( project = projecto5_obj).update(
                facebook = facebook, 
                instagram = instagram, paginaWeb = paginaWeb,
                twitter = twitter
                
            )

        
        context['projecto5_obj'] = projecto5_obj
        context['beneficio_obj'] = beneficio_obj
        context['equipo_obj'] = equipo_obj
        context['materiales_obj'] = materiales_obj
        
        print(projecto5_obj)
        print(beneficio_obj)
        print(materiales_obj)
        context['form'] = form
    except Exception as e :
        print(e)

    return render(request , 'modificar.html' , context)

def juegos(request):

    context = {'proyectos' : Projecto5.objects.filter(categoria = 'juego')}
    return render(request , 'juegos.html' , context)

def tecnologia(request):

    context = {'proyectos' : Projecto5.objects.filter(categoria = 'tecnologia')}
    return render(request , 'tecnologia.html' , context)

def arte(request):

    context = {'proyectos' : Projecto5.objects.filter(categoria = 'arte')}
    return render(request , 'arte.html' , context)

