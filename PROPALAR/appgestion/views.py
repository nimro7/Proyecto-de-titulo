from django.shortcuts import render
from appgestion.models import usuario
# Create your views here.
def index(request):
    return render(request,'index.html')

def registro(request):
    return render(request,'registro.html')

def login(request):
    return render(request,'logins.html')


