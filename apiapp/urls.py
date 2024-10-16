from django.urls import path, include
from .views import *
from rest_framework import routers

# Define la ruta del API
router = routers.DefaultRouter()
router.register('productos', ProductoViewSet)
router.register('tipo_producto', TipoProductoViewSet)
router.register('usuario', ExtendUserViewSet)
router.register('tipo_usuario', TipoUsuarioViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
]

