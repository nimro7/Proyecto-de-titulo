from home import views
from django.urls import path, include
from .views_api import *
urlpatterns = [
   path('', views.bienvenida, name="bienvenida"),
   path('iniciar/', views.iniciar, name="iniciar"),
   path('index/', views.index, name="index"),
   path('crear/', views.crear, name="crear")
]