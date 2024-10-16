from .models import *

def procesadorUsuario(request):
    
    if request.user.is_authenticated:
        usuario = request.user
        usuarioExtend = ExtendUser.objects.get(djangoUser = usuario)
        suscripcionUsuario = usuarioExtend.suscripcion

        return {
            'suscripcionUsuario' : suscripcionUsuario
        }
    
    else:

        return {
            'usuario' : "vacío"
        }