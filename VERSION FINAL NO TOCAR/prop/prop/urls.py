"""prop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from appgestion import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('registro/', views.render_registro),
    path('',views.bienvenida),
    path('crear_usuario/',views.crear_usuario),
    path('login/', views.login),
    path('index/',views.index),
    path('inicioSesion/',views.inicioSesion),
    path('cerrarSesion/',views.cerrarSesion),
    path('perfil/',views.perfil),
    path('contacto/',views.contacto),
    path('crear/',views.crear_proyecto),
    path('bienvenida/',views.crear_proyecto),
    path('crear_proyecto/',views.crear_proyecto),

]