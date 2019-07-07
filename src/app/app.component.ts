import { Component } from '@angular/core';
import { Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import * as moment from 'moment';

import { HomePage } from '../pages/home/home';
import { daysInMonth } from 'ionic-angular/umd/util/datetime-util';
@Component({
  templateUrl: 'app.html'
})
export class MyApp {
  rootPage:any = HomePage;

  constructor(platform: Platform, statusBar: StatusBar, splashScreen: SplashScreen) {
    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      //ahora guardamos todos los datos
      this.guardarDatosRestaurant();
      statusBar.styleDefault();
      splashScreen.hide();
    });
  }
  guardarDatosRestaurant(){
    if (!localStorage.getItem('FECHA_INICIO')){

      var fechaInicio = moment().add(1, 'days').toDate();
      fechaInicio.setHours(10);
      fechaInicio.setMinutes(0);
      fechaInicio.setSeconds(0);
      fechaInicio.setMilliseconds(0);
      localStorage.setItem('FECHA_INICIO', moment(fechaInicio).format());
    }
    else{
      var fechaConfigurada = localStorage.getItem('FECHA_INICIO');
      if (moment(fechaConfigurada) < moment()){
        var fechaInicio = moment().add(1, 'days').toDate();
        fechaInicio.setHours(10);
        fechaInicio.setMinutes(0);
        fechaInicio.setSeconds(0);
        fechaInicio.setMilliseconds(0);
        localStorage.setItem('FECHA_INICIO', moment(fechaInicio).format());
      }
    }
    //estos son datos estaticos
    //COMUNAS
    if (!localStorage.getItem('ARR_COMUNAS')){
      var arrComunas = [];
      var comuna1 = {
        Nombre: 'Puente Alto'
      };
      var comuna2 = {
        Nombre: 'La Florida'
      };
      arrComunas.push(comuna1);
      arrComunas.push(comuna2);
      localStorage.setItem('ARR_COMUNAS', JSON.stringify(arrComunas));
    }
    //TIPOS DE RESTAURANTES
    if (!localStorage.getItem('ARR_TIPOS_RESTAURANTES')){
      var arrTipos = [];
      var tipo1 = {
        Nombre: 'Peruano'
      };
      var tipo2 = {
        Nombre: 'Típica Chilena'
      };
      var tipo3 = {
        Nombre: 'Sushy'
      };
      var tipo4 = {
        Nombre: 'China'
      };
      arrTipos.push(tipo1);
      arrTipos.push(tipo2);
      arrTipos.push(tipo3);
      arrTipos.push(tipo4);
      localStorage.setItem('ARR_TIPOS_RESTAURANTES', JSON.stringify(arrTipos));
    }
    
    if (!localStorage.getItem('ARR_RESTAURANTES')){
      //SI NO ESTA LOS AGREGAMOS
      var arrRestaurantes = [];
      var restoran1 = {
        Id: 1,
        Nombre: 'Puerto Esmeralda',
        Tipo: 'Peruano',
        Direccion: 'Avda. Concha y Toro 959',
        Comuna: 'Puente Alto',
        Ciudad: 'Santiago',
        Foto: '../assets/imgs/peruana.jpg'
      };
      var restoran2 = {
        Id: 2,
        Nombre: 'La Comilona',
        Tipo: 'Típica Chilena',
        Direccion: 'Avda. La Florida 126',
        Comuna: 'La Florida',
        Ciudad: 'Santiago',
        Foto: '../assets/imgs/chilena.jpg'
      };
      var restoran3 = {
        Id: 3,
        Nombre: 'Sushi Kay',
        Tipo: 'Sushy',
        Direccion: 'Departamental 354',
        Comuna: 'La Florida',
        Ciudad: 'Santiago',
        Foto: '../assets/imgs/sushi.jpg'
      };
      var restoran4 = {
        Id: 4,
        Nombre: 'China Oriental',
        Tipo: 'China',
        Direccion: 'Las Industrias 1432',
        Comuna: 'Puente Alto',
        Ciudad: 'Santiago',
        Foto: '../assets/imgs/china.jpg'
      };
      arrRestaurantes.push(restoran1);
      arrRestaurantes.push(restoran2);
      arrRestaurantes.push(restoran3);
      arrRestaurantes.push(restoran4);
      localStorage.setItem('ARR_RESTAURANTES', JSON.stringify(arrRestaurantes));

    }
    const mesaParaUno = 1;
    const mesaParaDos = 2;
    const mesaParaTres = 3;
    const mesaParaCuatro = 4;
    const mesaParaCinco = 5;
    const mesaParaSeis = 6;
    const mesaParaSiete = 7;
    const mesaParaOcho = 8;

    //MESAS GENERALES
    if (!localStorage.getItem('ARR_MESAS_RESTAURANTES')){
      var arrMesas = [];
      //MESAS PARA EL RESTAURANT 1
      var mesa1 = {
        Id: 1,
        Nombre: 'Mesa 1',
        Cantidad: mesaParaDos,
        IdRestaurant: 1
      };
      var mesa2 = {
        Id: 2,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaCinco,
        IdRestaurant: 1
      };
      var mesa3 = {
        Id: 3,
        Nombre: 'Mesa 2',
        Cantidad: mesaParaTres,
        IdRestaurant: 1
      };
      var mesa4 = {
        Id: 4,
        Nombre: 'Mesa 3',
        Cantidad: mesaParaCuatro,
        IdRestaurant: 1
      };
      var mesa5 = {
        Id: 5,
        Nombre: 'Mesa 4',
        Cantidad: mesaParaCuatro,
        IdRestaurant: 1
      };

      arrMesas.push(mesa1);
      arrMesas.push(mesa2);
      arrMesas.push(mesa3);
      arrMesas.push(mesa4);
      arrMesas.push(mesa5);

      //MESAS PARA EL RESTAURANT 2
      var mesa6 = {
        Id: 6,
        Nombre: 'Mesa 1',
        Cantidad: mesaParaDos,
        IdRestaurant: 2
      };
      var mesa7 = {
        Id: 7,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaCinco,
        IdRestaurant: 2
      };
      var mesa8 = {
        Id: 8,
        Nombre: 'Mesa 2',
        Cantidad: mesaParaTres,
        IdRestaurant: 2
      };
      var mesa9 = {
        Id: 9,
        Nombre: 'Mesa 3 Grande',
        Cantidad: mesaParaOcho,
        IdRestaurant: 2
      };
      var mesa10 = {
        Id: 10,
        Nombre: 'Mesa 4',
        Cantidad: mesaParaCuatro,
        IdRestaurant: 2
      };

      arrMesas.push(mesa6);
      arrMesas.push(mesa7);
      arrMesas.push(mesa8);
      arrMesas.push(mesa9);
      arrMesas.push(mesa10);

      //MESAS PARA EL RESTAURANT 3
      var mesa11 = {
        Id: 11,
        Nombre: 'Mesa 1',
        Cantidad: mesaParaTres,
        IdRestaurant: 3
      };
      var mesa12 = {
        Id: 12,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaCuatro,
        IdRestaurant: 3
      };
      var mesa13 = {
        Id: 13,
        Nombre: 'Mesa 2',
        Cantidad: mesaParaTres,
        IdRestaurant: 3
      };
      var mesa14 = {
        Id: 14,
        Nombre: 'Mesa 3 Grande',
        Cantidad: mesaParaOcho,
        IdRestaurant: 3
      };
      var mesa15 = {
        Id: 15,
        Nombre: 'Mesa 4',
        Cantidad: mesaParaDos,
        IdRestaurant: 3
      };

      arrMesas.push(mesa11);
      arrMesas.push(mesa12);
      arrMesas.push(mesa13);
      arrMesas.push(mesa14);
      arrMesas.push(mesa15);

      //MESAS PARA EL RESTAURANT 4
      var mesa16 = {
        Id: 16,
        Nombre: 'Mesa 1',
        Cantidad: mesaParaTres,
        IdRestaurant: 4
      };
      var mesa17 = {
        Id: 17,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaCuatro,
        IdRestaurant: 4
      };
      var mesa18 = {
        Id: 18,
        Nombre: 'Mesa 2',
        Cantidad: mesaParaSeis,
        IdRestaurant: 4
      };
      var mesa19 = {
        Id: 19,
        Nombre: 'Mesa 3',
        Cantidad: mesaParaOcho,
        IdRestaurant: 4
      };
      var mesa20 = {
        Id: 20,
        Nombre: 'Mesa 4',
        Cantidad: mesaParaTres,
        IdRestaurant: 4
      };

      arrMesas.push(mesa16);
      arrMesas.push(mesa17);
      arrMesas.push(mesa18);
      arrMesas.push(mesa19);
      arrMesas.push(mesa20);
      //nuevas mesas para uno
      var mesa21 = {
        Id: 21,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaUno,
        IdRestaurant: 1
      };
      var mesa22 = {
        Id: 22,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaUno,
        IdRestaurant: 2
      };
      var mesa23 = {
        Id: 23,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaUno,
        IdRestaurant: 3
      };
      var mesa24 = {
        Id: 24,
        Nombre: 'Mesa 5',
        Cantidad: mesaParaUno,
        IdRestaurant: 4
      };
      arrMesas.push(mesa21);
      arrMesas.push(mesa22);
      arrMesas.push(mesa23);
      arrMesas.push(mesa24);

      localStorage.setItem('ARR_MESAS_RESTAURANTES', JSON.stringify(arrMesas));
    }

    //horas y dias disponibles para las mesas
    //estas hay que procesarlas desde la fecha hora actual agregando un dia
    if (!localStorage.getItem('ARR_HORAS_MESAS')){
      //var fechaIni = moment().add(1, 'days');
      var fechaIni = moment(localStorage.getItem('FECHA_INICIO'));
      //var fechaTermino = moment().add(1, 'days'); las mesas ids van desde la 1 a la 20
      var arrHorasMesas = [];
      var contador = 1;
      var contadorHoras = 1;
      for(var i = 0; i <= 7; i++){
        var contadorMesas = 1;
        var fechaAgendar = fechaIni.add(1, 'days').toDate();
        fechaAgendar.setHours(10);
        fechaAgendar.setMinutes(0);
        fechaAgendar.setSeconds(0);
        fechaAgendar.setMilliseconds(0);
        //20 veces la misma fecha
        for (var j=1; j< 25; j++){
          /*
          fechaAgendar.setHours(10);
          fechaAgendar.setMinutes(0);
          fechaAgendar.setSeconds(0);
          fechaAgendar.setMilliseconds(0);
          */

          var entidad = {
            Fecha: moment(fechaAgendar).format(),
            Id: contador,
            MesaId: j,
            Reservada: false,
            Segmento: []
          };
          var horas = [];
          //this.agregarHoras(fechaAgendar, horas);
          var fechaHora = moment(fechaAgendar).toDate();
          fechaHora.setHours(11);
          fechaHora.setMinutes(30);
          fechaHora.setSeconds(0);
          fechaHora.setMilliseconds(0);
          for (var s=0; s<4; s++){
            var nuevaFecha = moment(fechaHora).add(90, 'minutes');
            //var fechaHora = moment(fechaAgendar).add(2, 'hours');

            var horita = {
              Fecha: moment(fechaHora).format(),
              Id: contadorHoras,
              Reservada: false
            };
            horas.push(horita);

            if (s >= 0) {
              fechaHora = nuevaFecha.toDate();
            }
            contadorHoras++;

          }
          entidad.Segmento = horas;
          arrHorasMesas.push(entidad);
          contador++;
        }
        //hay que setear la fecha inicio a las 10 am
        //fechaIni = moment(fechaAgendar);

      }

      localStorage.setItem('ARR_HORAS_MESAS', JSON.stringify(arrHorasMesas));

    }

  }
  agregarHoras(fecha, arrHoras){
    var fechaHora = moment(fecha).toDate();
    fechaHora.setHours(10);
    fechaHora.setMinutes(0);
    fechaHora.setSeconds(0);
    fechaHora.setMilliseconds(0);
    for (var s=0; s<4; s++){
      var nuevaFecha = moment(fechaHora).add(2, 'hours');
      //console.log(nuevaFecha);

      if (s >= 0) {
        fechaHora = nuevaFecha.toDate();
      }

    }
  }
}

