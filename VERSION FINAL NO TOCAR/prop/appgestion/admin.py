from django.contrib import admin
from appgestion.models import Contacto , Projecto5 , Beneficio,EquipoTrabajo,materiales, Datos_banco, Datos_usuario, transaccion

admin.site.register(Projecto5)
admin.site.register(Beneficio)
admin.site.register(EquipoTrabajo)
admin.site.register(Contacto)
admin.site.register(materiales)
admin.site.register(Datos_usuario)
admin.site.register(Datos_banco)
admin.site.register(transaccion)