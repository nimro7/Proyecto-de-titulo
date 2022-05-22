from django.contrib import admin

# Register your models here.
from appgestion.models import Usuarios , Datos_banco , Pais , Ciudad ,Contacto , Solicitudes , Tipo_solicitud , Proyecto , Tipo_proyecto ,Benefio_pro, Equipo_pro , Material_pro ,Transsaccion
admin.site.register(Usuarios)
admin.site.register(Datos_banco)
admin.site.register(Pais)
admin.site.register(Ciudad)
admin.site.register(Contacto)
admin.site.register(Solicitudes)
admin.site.register(Tipo_solicitud)
admin.site.register(Proyecto)
admin.site.register(Tipo_proyecto)
admin.site.register(Benefio_pro)
admin.site.register(Material_pro)
admin.site.register(Transsaccion)
