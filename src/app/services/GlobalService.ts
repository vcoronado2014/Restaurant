import { Injectable, Component } from '@angular/core';
import 'rxjs/add/operator/map';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import * as moment from 'moment';



@Injectable()
export class GlobalService {
    constructor(
    ) {
        moment.locale('es');
    }
    menusRestaurantePeruano(){
        //variable estatica no deberìa cambiar
        var arrMenus = [];
        if(!localStorage.getItem('ARR_MENUS_PERUANO')){
            //SI NO ESTA ENTONCES CREAMOS EL MENU
            //restaurante peruano
            var menu1 = {
                IdRestaurant: 1,
                Nombre: 'Menú ejecutivo',
                Entrada: 'Causa de Atún',
                Fondo: 'Ají de gallina',
                Bebestible: 'Bebida Express, Jugo natural o Copa de vino',
                Postre: 'Crema volteada o Mouse de maracuyá',
                Valor: '$ 6.900',
                ValorInt: 6900
            };
            //restaurante peruano
            var menu2 = {
                IdRestaurant: 1,
                Nombre: 'Menú ejecutivo',
                Entrada: 'Tequeños de lomo',
                Fondo: 'Seco de vacuno',
                Bebestible: 'Bebida Express, Jugo natural o Copa de vino',
                Postre: 'Crema volteada o Mouse de maracuyá',
                Valor: '$ 6.900',
                ValorInt: 6900
            };
            //restaurante peruano
            var menu3 = {
                IdRestaurant: 1,
                Nombre: 'Menú especial',
                Entrada: 'Cebiche de pescado o Ensalada rusa',
                Fondo: 'Lomo Salteado o Arroz chaufa de pollo',
                Bebestible: 'Bebida Express, Jugo natural o Copa de vino',
                Postre: 'Crema volteada o Mouse de maracuyá',
                Valor: '$ 9.900',
                ValorInt: 9900
            };
            arrMenus.push(menu1);
            arrMenus.push(menu2);
            arrMenus.push(menu3);
            localStorage.setItem('ARR_MENUS_PERUANO', JSON.stringify(arrMenus));

        }
        else {
            arrMenus = JSON.parse(localStorage.getItem('ARR_MENUS_PERUANO'));
        }
        return arrMenus;

    }

    menusRestauranteChilena(){
        //variable estatica no deberìa cambiar
        var arrMenus = [];
        if(!localStorage.getItem('ARR_MENUS_CHILENA')){
            //SI NO ESTA ENTONCES CREAMOS EL MENU
            //restaurante chileno
            var menu1 = {
                IdRestaurant: 2,
                Nombre: 'Menú ejecutivo',
                Entrada: 'Ensalada chilena',
                Fondo: 'Porotos con Rienda',
                Bebestible: 'Bebida Express o Copa de vino',
                Postre: 'Duraznos con crema',
                Valor: '$ 5.900',
                ValorInt: 5900
            };
            //restaurante chileno
            var menu2 = {
                IdRestaurant: 2,
                Nombre: 'Menú ejecutivo',
                Entrada: 'Ensalada surtida',
                Fondo: 'Papas cocidas con longaniza',
                Bebestible: 'Bebida Express o Copa de vino',
                Postre: 'Mix de frutas con crema',
                Valor: '$ 5.900',
                ValorInt: 5900
            };
            //restaurante chileno
            var menu3 = {
                IdRestaurant: 2,
                Nombre: 'Menú especial',
                Entrada: 'Empanada de Horno',
                Fondo: 'Lomo Vetado con puré o arroz',
                Bebestible: 'Bebida Express o Copa de vino',
                Postre: 'Mix de frutas con crema',
                Valor: '$ 9.900',
                ValorInt: 9900
            };
            arrMenus.push(menu1);
            arrMenus.push(menu2);
            arrMenus.push(menu3);
            localStorage.setItem('ARR_MENUS_CHILENA', JSON.stringify(arrMenus));

        }
        else {
            arrMenus = JSON.parse(localStorage.getItem('ARR_MENUS_CHILENA'));
        }
        return arrMenus;

    }

    menusRestauranteSushy(){
        //variable estatica no deberìa cambiar
        var arrMenus = [];
        if(!localStorage.getItem('ARR_MENUS_SUSHY')){
            //SI NO ESTA ENTONCES CREAMOS EL MENU
            //restaurante chileno
            var menu1 = {
                IdRestaurant: 3,
                Nombre: 'Menú California',
                Entrada: 'Gyozas (pollo o cerdo) 3 Unidades',
                Fondo: 'California Rolls 3 Unidades, California Sake 3 Unidades',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 6.500',
                ValorInt: 6500
            };
            //restaurante chileno
            var menu2 = {
                IdRestaurant: 3,
                Nombre: 'Menú avocado',
                Entrada: 'Gyozas (pollo o cerdo) 3 Unidades',
                Fondo: 'Avocado Rolls 3 Unidades, Avocado Tori 3 Unidades',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 6.500',
                ValorInt: 6500
            };
            //restaurante chileno
            var menu3 = {
                IdRestaurant: 1,
                Nombre: 'Menú especial',
                Entrada: 'Ceviche de salmón o Ceviche Roll',
                Fondo: 'Tempura Rolls 3 Unidades, Futomaki apanado 3 Unidades',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 8.900',
                ValorInt: 8900
            };
            arrMenus.push(menu1);
            arrMenus.push(menu2);
            arrMenus.push(menu3);
            localStorage.setItem('ARR_MENUS_SUSHY', JSON.stringify(arrMenus));

        }
        else {
            arrMenus = JSON.parse(localStorage.getItem('ARR_MENUS_SUSHY'));
        }
        return arrMenus;

    }

    menusRestauranteChino(){
        //variable estatica no deberìa cambiar
        var arrMenus = [];
        if(!localStorage.getItem('ARR_MENUS_CHINO')){
            //SI NO ESTA ENTONCES CREAMOS EL MENU
            //restaurante chileno
            var menu1 = {
                IdRestaurant: 4,
                Nombre: 'Menú Uno',
                Entrada: 'Arrollado primavera o Wantan',
                Fondo: 'Chapsui de carne o de pollo',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 4.500',
                ValorInt: 4500
            };
            //restaurante chileno
            var menu2 = {
                IdRestaurant: 4,
                Nombre: 'Menú Dos',
                Entrada: 'Arrollado primavera o Wantan',
                Fondo: 'Carne o pollo mongoliano',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 4.800',
                ValorInt: 4800
            };
            //restaurante chileno
            var menu3 = {
                IdRestaurant: 1,
                Nombre: 'Menú Tres',
                Entrada: 'Arrollado primavera o Wantan',
                Fondo: 'Carne Chapiñón o Parrillada china',
                Bebestible: 'Bebida Express',
                Postre: '',
                Valor: '$ 5.900',
                ValorInt: 5900
            };
            arrMenus.push(menu1);
            arrMenus.push(menu2);
            arrMenus.push(menu3);
            localStorage.setItem('ARR_MENUS_CHINO', JSON.stringify(arrMenus));

        }
        else {
            arrMenus = JSON.parse(localStorage.getItem('ARR_MENUS_CHINO'));
        }
        return arrMenus;

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
                    var horasDisponibles = 0
                    var horasReservadas = 0;
                    if (restaurant.Mesas) {
                        restaurant.Mesas.forEach(mesa => {
                            if (mesa.Horas) {
                                mesa.Horas.forEach(hora => {
                                    if (hora.Reservada) {
                                        horasReservadas++;
                                    }
                                    else {
                                        horasDisponibles++;
                                    }
                                });
                            }
                        });

                    }
                    //agregamos los menus
                    if (restaurant.Id == 1){
                        restaurant.Menus = this.menusRestaurantePeruano();
                    }
                    if (restaurant.Id == 2){
                        restaurant.Menus = this.menusRestauranteChilena();
                    }
                    if (restaurant.Id == 3){
                        restaurant.Menus = this.menusRestauranteSushy();
                    }
                    if (restaurant.Id == 4){
                        restaurant.Menus = this.menusRestauranteChino();
                    }
                    restaurant.HorasReservadas = horasReservadas;
                    restaurant.HorasDisponibles = horasDisponibles;
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
                        //var totalHoras = 0;
                        //var horasReservadas = 0;
                        //aca vamos a entregar los horarios de las mesas
                        mesa.Horas = this.agendaDeMesas(mesa.Id);
                        //sacamos las horas disponibles

                        //lo comentamos por nueva implementaciòn
                        /*
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
                        */
                       //mesa.HorasDisponibles = totalHoras;
                       //mesa.HorasReservadas = horasReservadas;
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
                        //aca vamos a entregar los horarios de las mesas
                        mesa.Horas = this.agendaDeMesas(mesa.Id);
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
    listarReservas(correo){
        var retorno = [];
        if (localStorage.getItem('ARR_RESERVAS')){
            var arr = JSON.parse(localStorage.getItem('ARR_RESERVAS'));
            arr.forEach(reserva => {
                if (reserva.Correo == correo){
                    retorno.push(reserva);
                }
                
            });
        }
        return retorno;
    }
    contarReservasDelUsuario(correo, fechaStr){
        var contador = 0;
        var fechaActual = fechaStr;
        if (localStorage.getItem('ARR_RESERVAS')){
            var arrReservas = JSON.parse(localStorage.getItem('ARR_RESERVAS'));
            arrReservas.forEach(reserva => {
                if (correo == reserva.Correo && fechaActual == reserva.Hora.FechaStr){
                    contador++;
                }
                
            });

        }
        return contador;
    }
    eliminarReserva(item){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        if (localStorage.getItem('ARR_RESERVAS')){
            //SI NO EXISTE EL OBJETO EN LOCAL STORAGE
            var arrNuevo = [];
            var arrReservas = JSON.parse(localStorage.getItem('ARR_RESERVAS'));
            arrReservas.forEach(reserva => {
                if (reserva.Correo == item.Correo && reserva.IdHora == item.IdHora && reserva.IdMesa == item.IdMesa && reserva.IdRestaurant == item.IdRestaurant){
                    //esta es la que hay que eliminar, asi que no debe agregarse al elemento

                }
                else{
                    //agregar
                    arrNuevo.push(reserva);
                }
            });

            //ahora la desmarcamos de reservada
            this.marcarReservaEliminada(item.IdHora);
            retorno.Usuario = item;
            retorno.Mensaje = 'Reserva eliminada con éxito';
            retorno.Codigo = 0;
            localStorage.setItem('ARR_RESERVAS', JSON.stringify(arrNuevo));
        }
        return retorno;
    } 
    insertarReserva(idRestaurant, idMesa, idHora, correo, horaCompleta, restaurant){
        var retorno = {
            Usuario: null,
            Mensaje: null,
            Codigo: 0
        };
        var mesaReservar = {
            IdRestaurant: idRestaurant,
            IdMesa: idMesa,
            IdHora: idHora,
            Correo: correo,
            Hora: horaCompleta,
            Restaurant: restaurant
        };
        //contaremos las reservas del usuario
        var cantidadReservas = this.contarReservasDelUsuario(correo, horaCompleta.FechaStr);
        if (cantidadReservas > 0){
            retorno.Usuario = mesaReservar;
            retorno.Mensaje = 'Usted ya tiene una reserva para ese día';
            retorno.Codigo = 1;
        }
        else {
            if (!localStorage.getItem('ARR_RESERVAS')){
                //SI NO EXISTE EL OBJETO EN LOCAL STORAGE
                var arrReservas = [];
                this.marcarReserva(idHora);
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
                        if (reserva.IdHora == idHora){
                            //ya existe
                            existe = true;
                        }
                    });
                }
                if (existe){
                    retorno.Usuario = mesaReservar;
                    retorno.Mensaje = 'La mesa ya esta reservada para ese día';
                    retorno.Codigo = 1;
                }
                else {
                    //acá hay que modificar el elemento de hora para marcarlo reservado
                    this.marcarReserva(idHora);
                    arreglo.push(mesaReservar);
                    retorno.Usuario = mesaReservar;
                    retorno.Mensaje = 'Mesa reservada con éxito';
                    retorno.Codigo = 0;
                    localStorage.setItem('ARR_RESERVAS', JSON.stringify(arreglo));
                }
    
            }
        }
        return retorno;
    }
    marcarReserva(idHora) {
        if (localStorage.getItem('ARR_HORAS_MESAS')) {
            var arreglo = JSON.parse(localStorage.getItem('ARR_HORAS_MESAS'));
            arreglo.forEach(hora => {
                if (hora.Id == idHora){
                    hora.Reservada = true;
                }
            });
            localStorage.setItem('ARR_HORAS_MESAS', JSON.stringify(arreglo));
        }
    }
    marcarReservaEliminada(idHora) {
        if (localStorage.getItem('ARR_HORAS_MESAS')) {
            var arreglo = JSON.parse(localStorage.getItem('ARR_HORAS_MESAS'));
            arreglo.forEach(hora => {
                if (hora.Id == idHora){
                    hora.Reservada = false;
                }
            });
            localStorage.setItem('ARR_HORAS_MESAS', JSON.stringify(arreglo));
        }
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
    agendaDeMesas(idMesa){
        var retorno = [];
        if (localStorage.getItem('ARR_HORAS_MESAS')){
            var arreglo = JSON.parse(localStorage.getItem('ARR_HORAS_MESAS'));
            //var arreglodevolver = [];
            if (arreglo && arreglo.length > 0){
                arreglo.forEach(reserva => {
                    if (reserva.MesaId == idMesa){
                        //ya existe
                        retorno.push(reserva);
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
