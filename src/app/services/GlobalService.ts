import { Injectable, Component } from '@angular/core';
import 'rxjs/add/operator/map';



@Injectable()
export class GlobalService {
    constructor(
    ) {

    }


    insertarUsuario(correo, nombre, password){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        var usuarioInsertar = {
            Correo: correo,
            Password: password,
            Nombre: nombre
        };
        if (!localStorage.getItem('ARR_USUARIOS')){
            //SI NO EXISTE EL OBJETO EN LOCAL STORAGE
            var arrUsuarios = [];

            arrUsuarios.push(usuarioInsertar);
            retorno.Usuario = usuarioInsertar;
            retorno.Mensaje = 'Usuario creado con éxito';
            retorno.Codigo = 0;
            localStorage.setItem('ARR_USUARIOS', JSON.stringify(arrUsuarios));
        }
        else{
            //SI EXISTE EL OBJETO EN LOCAL STORAGE
            var existe = false;
            var arreglo = JSON.parse(localStorage.getItem('ARR_USUARIOS'));
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(usuario => {
                    if (usuario.Correo == correo){
                        //ya existe
                        existe = true;
                    }
                });
            }
            if (existe){
                retorno.Usuario = usuarioInsertar;
                retorno.Mensaje = 'Usuario ya existe, intente con otro Correo electrónico';
                retorno.Codigo = 1;
            }
            else {
                arreglo.push(usuarioInsertar);
                retorno.Usuario = usuarioInsertar;
                retorno.Mensaje = 'Usuario creado con éxito';
                retorno.Codigo = 0;
                localStorage.setItem('ARR_USUARIOS', JSON.stringify(arreglo));
            }

        }
        return retorno;
    } 
    autentificarse(correo, password){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        if (!localStorage.getItem('ARR_USUARIOS')){
            retorno.Usuario = retorno;
            retorno.Mensaje = 'No existe usuario';
            retorno.Codigo = 1;
        }
        else {
            var existe = false;
            var usu;
            var arreglo = JSON.parse(localStorage.getItem('ARR_USUARIOS'));
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(usuario => {
                    if (usuario.Correo == correo && usuario.Password == password){
                        //ya existe
                        usu = usuario;
                        existe = true;
                    }
                });
            }
            if (existe){
                //vamos a guardar la información del usuario en caso que la necesitemos
                var userInfo = usu;
                localStorage.setItem("USER_INFO", JSON.stringify(userInfo));
                //******************************************************************* */
                retorno.Usuario = usu;
                retorno.Mensaje = 'Usuario Existe, ingresando...';
                retorno.Codigo = 0;
            }
            else {
                retorno.Usuario = retorno;
                retorno.Mensaje = 'Usuario o clave incorrecta';
                retorno.Codigo = 1;
            }

        }
        return retorno;
    }
    restaurantYMesas(){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        var arrRestaurantes = [];
        if(localStorage.getItem('ARR_RESTAURANTES')){
            arrRestaurantes = JSON.parse(localStorage.getItem('ARR_RESTAURANTES'));
            if (arrRestaurantes && arrRestaurantes.length > 0){
                arrRestaurantes.forEach(restaurant => {
                    //todas las mesas
                    restaurant.Mesas = this.mesasPorRestaurant(restaurant.Id).Usuario;
                    //las mesas disponibles
                    restaurant.MesasDisponibles = this.mesasPorRestaurantDisponibles(restaurant.Id).Usuario;
                    //las mesas reservadas
                    restaurant.MesasOcupadas = this.mesasPorRestaurantOcupadas(restaurant.Id).Usuario;
                });
            }
            retorno.Usuario = arrRestaurantes;
            retorno.Mensaje = 'Correcto';
            retorno.Codigo = 0;
      
        }
        else {
            retorno.Usuario = retorno;
            retorno.Mensaje = 'No hay restaurantes';
            retorno.Codigo = 1;
        }
        return retorno;

    }
    mesasPorRestaurant(idRestaurant){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        if (!localStorage.getItem('ARR_MESAS_RESTAURANTES')){
            //NO EXISTE DEVUELVE NO HAY MESAS
            retorno.Usuario = retorno;
            retorno.Mensaje = 'No hay mesas';
            retorno.Codigo = 1;
        }
        else {
            var arreglo = JSON.parse(localStorage.getItem('ARR_MESAS_RESTAURANTES'));
            var arreglodevolver = [];
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(mesa => {
                    if (mesa.IdRestaurant == idRestaurant){
                        var reservadas = this.reservasPorRestaurant(idRestaurant);
                        if (reservadas && reservadas.length > 0){
                            var mesaReservada = false;
                            reservadas.forEach(reserva => {
                                if (reserva.IdMesa == mesa.Id){
                                    //la mesa esta reservada
                                    mesa.Reservada = true;
                                }
                            });
                        }
                        else{
                            mesa.Reservada = false;
                        }
                        //ya existe
                        arreglodevolver.push(mesa);
                    }
                });
            }
            retorno.Usuario = arreglodevolver;
            retorno.Mensaje = 'Correcto';
            retorno.Codigo = 0;
        }
        return retorno;

    }
    mesasPorRestaurantDisponibles(idRestaurant){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        if (!localStorage.getItem('ARR_MESAS_RESTAURANTES')){
            //NO EXISTE DEVUELVE NO HAY MESAS
            retorno.Usuario = retorno;
            retorno.Mensaje = 'No hay mesas';
            retorno.Codigo = 1;
        }
        else {
            var arreglo = JSON.parse(localStorage.getItem('ARR_MESAS_RESTAURANTES'));
            var arreglodevolver = [];
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(mesa => {
                    if (mesa.IdRestaurant == idRestaurant){
                        //ya existe, ahora buscamos si tiene reserva
                        var reservadas = this.reservasPorRestaurant(idRestaurant);
                        if (reservadas && reservadas.length == 0){
                            //solo en el caso que no hayan reservas se agrega
                            arreglodevolver.push(mesa);
                        }
                        
                    }
                });
            }
            retorno.Usuario = arreglodevolver;
            retorno.Mensaje = 'Correcto';
            retorno.Codigo = 0;
        }
        return retorno;
    } 
    mesasPorRestaurantOcupadas(idRestaurant){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        if (!localStorage.getItem('ARR_MESAS_RESTAURANTES')){
            //NO EXISTE DEVUELVE NO HAY MESAS
            retorno.Usuario = retorno;
            retorno.Mensaje = 'No hay mesas';
            retorno.Codigo = 1;
        }
        else {
            var arreglo = JSON.parse(localStorage.getItem('ARR_MESAS_RESTAURANTES'));
            var arreglodevolver = [];
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(mesa => {
                    if (mesa.IdRestaurant == idRestaurant){
                        //ya existe, ahora buscamos si tiene reserva
                        var reservadas = this.reservasPorRestaurant(idRestaurant);
                        if (reservadas && reservadas.length > 0){
                            //solo en el caso que no hayan reservas se agrega
                            arreglodevolver.push(mesa);
                        }
                        
                    }
                });
            }
            retorno.Usuario = arreglodevolver;
            retorno.Mensaje = 'Correcto';
            retorno.Codigo = 0;
        }
        return retorno;
    } 
    insertarReserva(idRestaurant, idMesa){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        var mesaReservar = {
            IdRestaurant: idRestaurant,
            IdMesa: idMesa
        };
        if (!localStorage.getItem('ARR_RESERVAS')){
            //SI NO EXISTE EL OBJETO EN LOCAL STORAGE
            var arrReservas = [];

            arrReservas.push(mesaReservar);
            retorno.Usuario = mesaReservar;
            retorno.Mensaje = 'Reserva creado con éxito';
            retorno.Codigo = 0;
            localStorage.setItem('ARR_RESERVAS', JSON.stringify(arrReservas));
        }
        else{
            //SI EXISTE EL OBJETO EN LOCAL STORAGE
            var existe = false;
            var arreglo = JSON.parse(localStorage.getItem('ARR_RESERVAS'));
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(reserva => {
                    if (reserva.IdRestaurant == idRestaurant && reserva.IdMesa == idMesa){
                        //ya existe
                        existe = true;
                    }
                });
            }
            if (existe){
                retorno.Usuario = mesaReservar;
                retorno.Mensaje = 'La mesa ya esta reservada';
                retorno.Codigo = 1;
            }
            else {
                arreglo.push(mesaReservar);
                retorno.Usuario = mesaReservar;
                retorno.Mensaje = 'Mesa reservada con éxito';
                retorno.Codigo = 0;
                localStorage.setItem('ARR_RESERVAS', JSON.stringify(arreglo));
            }

        }
        return retorno;
    }
    reservasPorRestaurant(idRestaurant){
        var retorno = [];
        if (localStorage.getItem('ARR_RESERVAS')){
            var arreglo = JSON.parse(localStorage.getItem('ARR_RESERVAS'));
            var arreglodevolver = [];
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(reserva => {
                    if (reserva.IdRestaurant == idRestaurant){
                        //ya existe
                        arreglodevolver.push(reserva);
                    }
                });
            }
        }
        return retorno;
    }
    mesaPorId(id){
        var retorno;
        if (localStorage.getItem('ARR_MESAS_RESTAURANTES')){
            var arreglo = JSON.parse(localStorage.getItem('ARR_MESAS_RESTAURANTES'));
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(mesa => {
                    if (mesa.Id == id){
                        //ya existe
                        retorno = mesa;
                    }
                });
            }
        }
        return retorno;
    }  
}
