from asyncio.windows_events import NULL
from datetime import date, timedelta
import math
import requests
from django.shortcuts import render, redirect

from app.forms import ProductoForm
from .models import *
from .forms import *
from django.contrib.auth import authenticate, login as login_aut
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages
from django.contrib.auth.models import Group

# Create your views here.


def index(request):
    response = requests.get('https://digimon-api.vercel.app/api/digimon').json()
    productosAll = Producto.objects.all()
    datos = {
        'listarProductos' : productosAll,
        'listarDigi' : response
    }

    return render(request, 'app/index.html', datos)

@login_required
@permission_required('app.add_producto')
def agregar_producto(request):
    producto = Producto.objects.all()
    datos = {
        'form' : ProductoForm()
    }
    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            for i in producto:
                codProd = i.codigo
                products = Producto.objects.get(codigo = codProd)
                if products:
                    if i.descuento > 0:
                        products.total_descuento = math.trunc(products.precio - (products.precio * (products.descuento / 100)))
                        products.save()
                    else:
                        producto.total_descuento = 0 
                        products.save()
            messages.success(request,'Producto agregado correctamente!')

    return render(request, 'app/productos/agregar_productos.html', datos)

@login_required
@permission_required('app.change_producto')
def modificar_productos(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    datos = {
        'form' : ProductoForm(instance=producto)
    }

    if request.method == 'POST':
        formulario = ProductoForm(data=request.POST, files=request.FILES, instance=producto)
        if formulario.is_valid():
            if producto:
                if producto.descuento > 0:
                    producto.total_descuento = math.trunc(producto.precio - (producto.precio * (producto.descuento / 100)))
                    producto.save()
                else:
                    producto.total_descuento = 0
            formulario.save()
            messages.success(request,'Producto modificado correctamente!')
            datos['form'] = formulario

    return render(request, 'app/productos/modificar_productos.html', datos)

# SECCION ELIMINAR

@login_required
@permission_required('app.delete_producto')
def eliminar_producto(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    producto.delete()

    return redirect(to="listar_productos")

@login_required
def eliminar_carrito(request, id):
    carrito = Carrito.objects.get(id=id)
    codProd = carrito.codigo
    producto = Producto.objects.get(codigo = int(codProd))
    producto.stock += carrito.cantidad
    producto.save()
    carrito.delete()

    datos = {
        'listarCarrito' : carrito
    }

    return redirect(to='carrito')

@login_required
@permission_required('app.view_producto')
def listar_productos(request):
    productosAll = Producto.objects.all()
    datos = {
        'listarProductos' : productosAll
    }
    return render(request, 'app/productos/listar_productos.html', datos)

@login_required
@permission_required('app.view_extend_user')
def listar_usuarios(request):
    usuariosAll = ExtendUser.objects.all()
    datos = {
        'listarUsuarios' : usuariosAll
    }
    return render(request, 'app/usuarios/listar_usuarios.html', datos)

@login_required
@permission_required('app.change_extend_user')
def modificar_usuario(request, rut):
    usuarios = ExtendUser.objects.get(rut=rut)
    datos = {
        'form' : UsuarioForm(instance=usuarios)
    }

    if request.method == 'POST':
        formulario = UsuarioForm(data=request.POST, files=request.FILES, instance=usuarios)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Usuario modificado correctamente!')
            datos['form'] = formulario

    return render(request, 'app/usuarios/modificar_usuario.html', datos)

@login_required
def cambiar_foto(request, rut):
    usuarios = ExtendUser.objects.get(rut=rut)
    datos = {
        'form' : CambiarFoto(instance=usuarios)
    }

    if request.method == 'POST':
        formulario = CambiarFoto(data=request.POST, files=request.FILES, instance=usuarios)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Imagen modificada correctamente!')
            datos['form'] = formulario
            return redirect(to='perfil')

    return render(request, 'app/usuarios/cambiar_foto.html', datos)

@login_required
@permission_required('app.delete_extend_user')
def eliminar_usuario (request, rut):
    usuario = ExtendUser.objects.get(rut=rut)
    nombreusuario = usuario.djangoUser
    users = User.objects.get(username = nombreusuario)
    users.delete()
    usuario.delete()
    return redirect(to='listar_usuarios')

@login_required
def carrito(request):

    users = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = users)

    usuarioCarrito = request.user.username
    fecha_actual = date.today() + timedelta(2)
    fecha_estimada = fecha_actual + timedelta(3)
    total = 0
    count = 0
    iva = 0.19
    montoiva = 0
    carrito = Carrito.objects.filter(usuario = usuarioCarrito)
    productos = Producto.objects.all()
    for i in carrito:
        total += int(i.total_pagar)
        count += i.cantidad
    
    montoiva = math.trunc(total * iva)
    montototal = total 
    datos = {
        'listarCarrito' : carrito,
        'listaProd' : productos,
        'suma' : total,
        'iva' : montoiva,
        'totaliva' : montototal,
        'contador' : count,
        'fecha_actual' : fecha_actual,
        'fecha_estimada' : fecha_estimada,
        'ExtendUser' : usuarioExtendido
    }

    if request.method == 'POST':
        
        compra = Compras()
        compra.codigo = request.POST.get('codigo')
        compra.cantidad = request.POST.get('cantidad')
        compra.subtotal = request.POST.get('subtotal')
        compra.precioiva = request.POST.get('iva')
        compra.total = request.POST.get('total')

        compra.save()
    
    return render(request, 'app/carrito.html',datos)


@login_required
def reset_carrito(request):
    usuarioCarrito = request.user.username
    carrito = Carrito.objects.filter(usuario= usuarioCarrito)
    subtotal = 0
    count = 0
    iva = 0.19
    for i in carrito:
        subtotal += int(i.total_pagar)
        count += i.cantidad
    
    montoiva = math.trunc(subtotal * iva)
    montototal = subtotal + montoiva

    lista_productos = " "
    for producto in carrito:
        lista_productos = "" + lista_productos + producto.nombre + " (" + str(producto.cantidad) + ") "
    
    fecha_actual = date.today()
    cliente = request.user.username

    compra = Compras()
    compra.articulos = lista_productos
    compra.cantidad = count
    compra.fecha_compra = fecha_actual
    compra.estado_pedido = "Validación"
    compra.cliente = cliente
    compra.subtotal = subtotal
    compra.precioiva = montoiva
    compra.total = montototal
    compra.save()

    carrito.delete()
    # Volver pag carrito.
    return redirect(to='carrito')

@login_required
def compras(request):
    comprasAll = Compras.objects.filter(cliente=request.user.username)
    datos = {
        'listarCompras' : comprasAll
    }
    return render(request, 'app/compras.html', datos)

@login_required
def listar_pedidos(request):
    comprasAll = Compras.objects.all()
    datos = {
        'listarPedidos' : comprasAll
    }
    return render(request, 'app/pedidos/listar_pedidos.html', datos)

@login_required
def cambiar_estado(request, codigo):

    mensaje = ""

    estados = EstadoCompra.objects.all()
    pedido = Compras.objects.get(codigo = codigo)

    if request.method == 'POST':
        estadoNuevo = request.POST.get('estados')
        pedido.estado_pedido = estadoNuevo
        pedido.save()
        mensaje = "Estado de pedido actualizado."
        return redirect(to='listar_pedidos')

    datos = {
        'estados' : estados,
        'pedido' : pedido,
        'messages' : mensaje
    }
    return render(request, 'app/pedidos/cambiar_estado.html', datos)

@login_required
def eliminar_pedido(request, codigo):
    pedido = Compras.objects.get(codigo=codigo)
    pedido.delete()

    return redirect(to="listar_pedidos")

@login_required
def seguimiento(request, codigo):
    usuario = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = usuario)
    seguimiento = Compras.objects.get(codigo = codigo)
    datos = {
        'seguimiento' : seguimiento,
        'ExtendUser': usuarioExtendido, 
        'usuario' : usuario
    }
    return render (request,'app/seguimiento.html', datos)

@login_required
def logeado(request):
    productosAll = Producto.objects.all()

    users = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = users)

    datos = {
        'ExtendUser' : usuarioExtendido,
        'usuario' : users,
        'listarProductos' : productosAll
    }

    if request.method == 'POST':

        codProd = request.POST.get('codigo')
        canti = int(request.POST.get('cantidad'))
        producto = Producto.objects.get(codigo=int(codProd))

        if producto.stock > 0:
            producto.stock -= canti
            producto.save()

            usuarioCarrito = request.user.username

            codProducto = request.POST.get('codigo')
            carritoExiste = Carrito.objects.filter(usuario = usuarioCarrito, codigo = codProducto)

            if carritoExiste:
                carro = Carrito.objects.get(usuario = usuarioCarrito, codigo = codProducto)
                cant = int(request.POST.get('cantidad'))
                carro.cantidad += cant
                carro.total_pagar = carro.cantidad * carro.precio
                carro.save()

            else:
                carrito = Carrito()
                carrito.codigo = request.POST.get('codigo')
                carrito.nombre = request.POST.get('nombre')
                carrito.marca = request.POST.get('marca')
                carrito.precio = request.POST.get('precio')
                carrito.stock = request.POST.get('stock')
                carrito.detalle = request.POST.get('detalle')
                carrito.imagen = request.POST.get('imagen')
                carrito.cantidad = request.POST.get('cantidad')
                carrito.tipo = request.POST.get('tipo')
                carrito.total_pagar = int(carrito.cantidad)* int(carrito.precio)
                carrito.usuario = request.user.username
                carrito.save()
        

    return render(request, 'app/logeado.html',datos)

@login_required
def perfil(request):
    usuario = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = usuario)

    datos = {
        'ExtendUser': usuarioExtendido, 
        'usuario' : usuario
    }
    return render(request, 'app/perfil.html', datos)

@login_required
def suscribir(request):

    usuario = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = usuario)
    usuarioExtendido.suscripcion = True
    usuarioExtendido.save()
    return redirect(to='suscripcion')

@login_required
def suscripcion(request):
    usuario = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = usuario)

    datos = {
        'ExtendUser': usuarioExtendido, 
        'usuario' : usuario
    }
    return render(request, 'app/suscripcion.html', datos)

@login_required
def anular_suscripcion(request):
    usuario = request.user
    usuarioExtendido = ExtendUser.objects.get(djangoUser = usuario)
    usuarioExtendido.suscripcion = False
    usuarioExtendido.save()
    return redirect(to='suscripcion')

def direccion_api(request):
    response = requests.get('https://www.freetogame.com/api/games').json()
    datos = {
        'listaJson' : response
    }
    return render(request, 'app/direccion_api.html', datos)

def direccion_api_prod(request):
    response = requests.get('http://127.0.0.1:8000/api/productos/').json()
    datos = {
        'listarProd' : response
    }
    return render(request, 'app/direccion_api_prod.html', datos)

@login_required
def detalle_producto(request, codigo):
    
    producto = Producto.objects.get(codigo=codigo)

    users = request.user        
    usuarioExtendido = ExtendUser.objects.get(djangoUser = users)

    if request.method == 'POST':

        codProd = request.POST.get('codigo')
        canti = int(request.POST.get('cantidad'))
        producto = Producto.objects.get(codigo=int(codProd))

        if producto.stock > 0:
            producto.stock -= canti
            producto.save()

            usuarioCarrito = request.user.username

            codProducto = request.POST.get('codigo')
            carritoExiste = Carrito.objects.filter(usuario = usuarioCarrito, codigo = codProducto)

            if carritoExiste:
                carro = Carrito.objects.get(usuario = usuarioCarrito, codigo = codProducto)
                cant = int(request.POST.get('cantidad'))
                carro.cantidad += cant
                carro.total_pagar = carro.cantidad * carro.precio
                carro.save()

            else:
                carrito = Carrito()
                carrito.codigo = request.POST.get('codigo')
                carrito.nombre = request.POST.get('nombre')
                carrito.marca = request.POST.get('marca')
                carrito.precio = request.POST.get('precio')
                carrito.stock = request.POST.get('stock')
                carrito.detalle = request.POST.get('detalle')
                carrito.imagen = request.POST.get('imagen')
                carrito.cantidad = request.POST.get('cantidad')
                carrito.tipo = request.POST.get('tipo')
                carrito.total_pagar = int(carrito.cantidad)* int(carrito.precio)
                carrito.usuario = request.user.username
                carrito.save()

    datos = {
        'ExtendUser' : usuarioExtendido,
        'usuario' : users,
        'DetallesProducto': producto
    }

    return render(request, 'app/detalle_producto.html', datos)

def detalle_producto_copy(request, codigo):
    
    producto = Producto.objects.get(codigo=codigo)

    if request.method == 'POST':

        codProd = request.POST.get('codigo')
        canti = int(request.POST.get('cantidad'))
        producto = Producto.objects.get(codigo=int(codProd))

        if producto.stock > 0:
            producto.stock -= canti
            producto.save()

            usuarioCarrito = request.user.username

            codProducto = request.POST.get('codigo')
            carritoExiste = Carrito.objects.filter(usuario = usuarioCarrito, codigo = codProducto)

            if carritoExiste:
                carro = Carrito.objects.get(usuario = usuarioCarrito, codigo = codProducto)
                cant = int(request.POST.get('cantidad'))
                carro.cantidad += cant
                carro.total_pagar = carro.cantidad * carro.precio
                carro.save()

            else:
                carrito = Carrito()
                carrito.codigo = request.POST.get('codigo')
                carrito.nombre = request.POST.get('nombre')
                carrito.marca = request.POST.get('marca')
                carrito.precio = request.POST.get('precio')
                carrito.stock = request.POST.get('stock')
                carrito.detalle = request.POST.get('detalle')
                carrito.imagen = request.POST.get('imagen')
                carrito.cantidad = request.POST.get('cantidad')
                carrito.tipo = request.POST.get('tipo')
                carrito.total_pagar = int(carrito.cantidad)* int(carrito.precio)
                carrito.usuario = request.user.username
                carrito.save()

    datos = {
        'DetallesProducto': producto
    }

    return render(request, 'app/detalle_producto_copy.html', datos)


def registro(request):

    # Cargar datos de formulario (metodo POST)
    if request.method == 'POST':
        txtUser = request.POST.get('txtUser')
        txtEmail = request.POST.get('txtEmail')
        txtPassword = request.POST.get('txtPassword')
        txtNombre = request.POST.get('txtNombre')
        txtApellidos = request.POST.get('txtApellidos')
        txtRut = request.POST.get('txtRut')
        txtDv = request.POST.get('txtDv')
        txtDireccion = request.POST.get('txtDireccion')
        txtTel = request.POST.get('txtTel')

        # Crear objeto User y UsuarioExtendido.
        # User de Django.
        try:
            usuario = User()
            usuario.username = txtUser
            usuario.first_name = txtNombre
            usuario.last_name = txtApellidos
            usuario.email = txtEmail
            usuario.password = txtPassword
            usuario.set_password(txtPassword)
            usuario.save()

            # Obtener ID usuario creado.
            usuarioCreado = User.objects.get(username = txtUser)
            usuarioID = usuarioCreado.id

            # Usuario extendido (clase propia)
            usuarioExtend = ExtendUser()
            usuarioExtend.djangoUser = usuarioCreado
            usuarioExtend.rut = txtRut
            usuarioExtend.dv = txtDv
            usuarioExtend.direccion = txtDireccion
            usuarioExtend.telefono = txtTel
            usuarioExtend.imagen = NULL
            usuarioExtend.suscripcion = False
            usuarioExtend.save()

            #agregar usuario a grupo
            grupo = Group.objects.get(name= 'Cliente')
            usuario.groups.add(grupo)

            acceso = authenticate(request, username = txtUser, password = txtPassword)
            if acceso is not None and acceso.is_active:
                login_aut(request, acceso)
                return redirect('/logeado')

        except Exception as error:
            print("  ---> ERROR: Se ha encontrado el siguiente error:")
            print("  " + str(error))

    return render(request, 'registration/registro.html')

