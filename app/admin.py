from django.contrib import admin


from app.models import TipoProducto
from .models import *
# Register your models here.

class ProductoAdmin(admin.ModelAdmin):
    list_display = ['codigo', 'nombre', 'marca', 'precio', 'stock', 'detalle', 'tipo', 'imagen', 'created_at', 'updated_at']
    search_fields =['codigo']
    list_per_page =4

admin.site.register(TipoProducto)
admin.site.register(Producto, ProductoAdmin)

class CarritoAdmin(admin.ModelAdmin):
    list_display = ['codigo','nombre','marca','precio', 'stock', 'detalle', 'cantidad', 'tipo', 'imagen', 'total_pagar', 'usuario']
    search_fields = ['codigo', 'nombre']
    list_per_page = 5
admin.site.register(Carrito, CarritoAdmin)


class ComprasAdmin(admin.ModelAdmin):
    list_display = ['codigo','articulos','cantidad','fecha_compra', 'estado_pedido', 'cliente', 'subtotal', 'precioiva', 'total']
    search_fields = ['codigo', 'cliente']
    list_per_page = 5

admin.site.register(Compras, ComprasAdmin)

admin.site.register(EstadoCompra)
admin.site.register(ExtendUser)