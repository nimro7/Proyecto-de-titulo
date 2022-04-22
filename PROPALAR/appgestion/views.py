from django.shortcuts import render
from appgestion.models import usuario
# Create your views here.
def index(request):
    return render(request,'index.html')

def registro(request):
    return render(request,'registro.html')

def login(request):
    return render(request,'logins.html')


def paginaLogin(request):    
    if request.method=='POST':     
        try:             
            detalleUsuario=usuario.objects.get(Nickname=request.POST['nickname'], contraseña=request.POST['contraseña'])           
            print("Usuario=", detalleUsuario)            
            request.session['nickname']=detalleUsuario.Nickname          
            return render(request, 'index.html')         
        except usuario.DoesNotExist as e: 
            messages.success(request, 'Nombre de usuario o password no es correcto')    
    return render(request, 'logins.html')