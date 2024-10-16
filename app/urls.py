from django.urls import path, include
from .views import *

urlpatterns = [
    path('', index, name="index"),
    path('', include('apiapp.urls')),
    path('carrito/', carrito, name="carrito"),
    path('reset_carrito/', reset_carrito, name="reset_carrito"),
    path('compras/', compras, name="compras"),
    path('listar_pedidos/', listar_pedidos, name="listar_pedidos"),
    path('logeado/', logeado, name="logeado"),
    path('perfil/', perfil, name="perfil"),
    path('seguimiento/<codigo>', seguimiento, name="seguimiento"),
    path('suscripcion/', suscripcion, name="suscripcion"),
    path('suscribir/', suscribir, name="suscribir"),
    path('anular_suscripcion/', anular_suscripcion, name="anular_suscripcion"),
    path('agregar_producto/', agregar_producto, name="agregar_producto"), 
    path('modificar_productos/<codigo>/', modificar_productos, name="modificar_productos"), 
    path('modificar_usuario/<rut>/', modificar_usuario, name="modificar_usuario"), 
    path('cambiar_foto/<rut>/', cambiar_foto, name="cambiar_foto"), 
    path('cambiar_estado/<codigo>/', cambiar_estado, name="cambiar_estado"), 
    path('eliminar_producto/<codigo>/', eliminar_producto, name="eliminar_producto"), 
    path('eliminar_pedido/<codigo>/', eliminar_pedido, name="eliminar_pedido"), 
    path('eliminar_usuario/<rut>/', eliminar_usuario, name="eliminar_usuario"), 
    path('eliminar_carrito/<id>/', eliminar_carrito, name="eliminar_carrito"), 
    path('listar_productos/', listar_productos, name="listar_productos"), 
    path('listar_usuarios/', listar_usuarios, name="listar_usuarios"), 
    path('direccion_api/', direccion_api, name="direccion_api"), 
    path('direccion_api_prod/', direccion_api_prod, name="direccion_api_prod"), 
    path('detalle_producto/<codigo>/', detalle_producto, name="detalle_producto"),
    path('detalle_producto_copy/<codigo>/', detalle_producto_copy, name="detalle_producto_copy"),
    path('registro/', registro, name="registro"),
]

