function confirmDelete(codigo) {
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro?',
      text: 'No podrás deshacer la acción!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si,Eliminar!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Eliminado!',
          'Producto Eliminado Correctamente',
          'success'
        ).then(function() {
          window.location.href = "/eliminar_producto/"+ codigo +"/";
        })
      }
    })
}

function confirmDeletePedido(codigo) {
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro?',
      text: 'No podrás deshacer la acción!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si,Eliminar!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Eliminado!',
          'Pedido Eliminado Correctamente',
          'success'
        ).then(function() {
          window.location.href = "/eliminar_pedido/"+ codigo +"/";
        })
      }
    })
}

function confirmDeleteUser(rut) {
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro?',
      text: 'No podrás deshacer la acción!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si,Eliminar!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Eliminado!',
          'Usuario Eliminado Correctamente',
          'success'
        ).then(function() {
          window.location.href = "/eliminar_usuario/"+ rut +"/";
        })
      }
    })
}

function confirmDeleteCarrito(id) {
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro?',
      text: 'No podrás deshacer la acción!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si,Eliminar!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Eliminado!',
          'Producto Eliminado Correctamente',
          'success'
        ).then(function() {
          window.location.href = "/eliminar_carrito/"+ id +"/";
        })
      }
    })
}

function confirmBorrarCarrito(){
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro de realizar la compra?',
      text: 'Estas a solo un paso!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, Comprar!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Compra efectuada!',
          'Has hecho una compra',
          'success'
        ).then(function() {
          window.location.href = "/reset_carrito/";
        })
      }
    })
}

function confirmSuscripcion(){
  Swal.fire({
      icon: 'warning',
      title: 'Estás seguro de realizar el Pago?',
      text: 'Estas a un solo de suscribirte!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, Suscribirme!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Pago efectuado!',
          'Te has suscrito',
          'success'
        ).then(function() {
          window.location.href = "/suscribir/";
        })
      }
    })
}

function anularSuscripcion(){
  Swal.fire({
      icon: 'info',
      title: 'Estas seguro de Anular tu suscripción?',
      text: 'Perderas tus beneficios',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Si, Anular Suscripción!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        Swal.fire(
          'Anulación efectuada!',
          'Has anulado tu suscripción',
          'success'
        ).then(function() {
          window.location.href = "/anular_suscripcion/";
        })
      }
    })
}


function necesitasLogearte(){
  Swal.fire({
      icon: 'info',
      title: 'Aún no te has logeado?',
      text: 'Para comprar necesitas logearte!',
      showCancelButton: true,
      cancelButtonColor: "#d33",
      confirmButtonText: "Logeate!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.value) {
        window.location.href = "/accounts/login/";
      }
    })
}
