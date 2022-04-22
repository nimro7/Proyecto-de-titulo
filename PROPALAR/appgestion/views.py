from django.shortcuts import render

# Create your views here.
def login(request):
    return render(request, "logins.html")

def registro(request):
    return render(request, "registro.html")

def index(request):
    return render(request, "index.html")