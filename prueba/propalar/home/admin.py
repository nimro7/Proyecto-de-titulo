from django.contrib import admin

# Register your models here.
from .models import Proyecto, Proyecto2, Prueba1

admin.site.register(Proyecto)
admin.site.register(Proyecto2)
admin.site.register(Prueba1)