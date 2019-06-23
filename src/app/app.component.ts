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

      localStorage.setItem('ARR_MESAS_RESTAURANTES', JSON.stringify(arrMesas));
    }

    //horas y dias disponibles para las mesas
    //estas hay que procesarlas desde la fecha hora actual agregando un dia
    if (!localStorage.getItem('ARR_HORAS_MESAS')){
      var fechaInicio = moment().add(1, 'days');
      //var fechaTermino = moment().add(1, 'days'); las mesas ids van desde la 1 a la 20
      var arrHorasMesas = [];
      var contador = 1;
      for(var i = 0; i <= 7; i++){
        var contadorMesas = 1;
        var fechaAgendar = fechaInicio.add(1, 'days');
        //20 veces la misma fecha
        for (var j=1; j< 21; j++){

          var entidad = {
            Fecha: fechaAgendar.format(),
            Id: contador,
            MesaId: j,
            Reservada: false
          };
  
          arrHorasMesas.push(entidad);
          contador++;
        }

      }

      localStorage.setItem('ARR_HORAS_MESAS', JSON.stringify(arrHorasMesas));

    }

  }
}

