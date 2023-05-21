from django.contrib import admin

from tiendaEcomerce.models import Producto, Cliente, Factura

# Register your models here.

class ClienteAdmin(admin.ModelAdmin):
    list_display=("nombre", "mail", "nro_Celular")
    search_fields= ("nombre", "mail")

class ProductoAdmin(admin.ModelAdmin):
    list_filter=("seccion",)


class FacturaAdmin (admin.ModelAdmin):
    list_display=("fecha", "descripcion_prod", "total")
    list_filter=("fecha",)
    date_hierarchy="fecha"

admin.site.register (Producto, ProductoAdmin)
admin.site.register (Cliente, ClienteAdmin)
admin.site.register (Factura, FacturaAdmin)

