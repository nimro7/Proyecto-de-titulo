from django.contrib import admin

# Register your models here.
from appgestion.models import pais
admin.site.register(pais)
from appgestion.models import ciudad
admin.site.register(ciudad)
from appgestion.models import contacto
admin.site.register(contacto)
from appgestion.models import usuarios
admin.site.register(usuarios)
from appgestion.models import datos_banco
admin.site.register(datos_banco)
from appgestion.models import solicitudes
admin.site.register(solicitudes)
from appgestion.models import tipo_solicitud
admin.site.register(tipo_solicitud)
from appgestion.models import proyecto
admin.site.register(proyecto)
from appgestion.models import tipo_proyecto
admin.site.register(tipo_proyecto)
from appgestion.models import benefio_pro
admin.site.register(benefio_pro)
from appgestion.models import equipo_pro
admin.site.register(equipo_pro)
from appgestion.models import material_pro
admin.site.register(material_pro)
from appgestion.models import transsaccion
admin.site.register(transsaccion)






