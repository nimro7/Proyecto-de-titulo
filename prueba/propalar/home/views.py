from django.shortcuts import render, redirect
from .form import * 
# Create your views here.
def bienvenida(request):
    return render(request,'bienvenida.html')

def index(request):
    return render(request,'index.html')
    
def iniciar(request):
    return render(request,'login.html')


def crear(request):
    context = {'form' : ProyectoForm}
    try:
        if request.method == 'POST':
            form = ProyectoForm(request.POST)
            print(request.FILES)
            imagen = request.FILES['imagen']
            titulo = request.POST.get('titulo')
            user = request.user
            tipo = request.POST.get('tipo')
            
            if form.is_valid():
                contenido = form.cleaned_data['contenido']
            
            proyecto_obj = Proyecto.objects.create(
                user = user , titulo = titulo, 
                contenido = contenido, imagen = imagen
            )

            prueba1_obj = Prueba1.objects.create(
                proyecto=proyecto_obj,
                tipo = tipo
            )
            print(proyecto_obj)
            print(prueba1_obj)
            
            return redirect('/crear/')
            
            
    
    except Exception as e :
        print(e)
    
    return render(request , 'crear.html' , context)