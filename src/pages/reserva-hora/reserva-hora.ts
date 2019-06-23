import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController, LoadingController, ToastController } from 'ionic-angular';
import {HomePage} from "../home/home";
import { GlobalService } from '../../app/services/GlobalService';
import * as moment from 'moment';
import { InicioPage } from '../inicio/inicio';

/**
 * Generated class for the ReservaHoraPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-reserva-hora',
  templateUrl: 'reserva-hora.html',
})
export class ReservaHoraPage {
  restaurant;
  mesaSeleccionada;
  horaSeleccionada;
  usurioLogueado;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public toastCtrl: ToastController,
    public loading: LoadingController,
    public viewCtrl: ViewController
    ) {
      moment.locale('es');
      this.mesaSeleccionada = this.navParams.get('item');
      this.restaurant = this.navParams.get('restaurant');
      if (this.mesaSeleccionada.Horas){
        this.mesaSeleccionada.Horas.forEach(hora => {
          var fechaStr = moment(hora.Fecha);
          hora.FechaStr = fechaStr.format("dddd, DD MMMM YYYY");
        });
      }
      this.usurioLogueado = JSON.parse(localStorage.getItem('USER_INFO'));
      console.log(this.mesaSeleccionada);
      console.log(this.restaurant);

  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ReservaHoraPage');
  }
  closeModal(param) {
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
  }
  guardar(){
    if (this.horaSeleccionada){
      let loader = this.loading.create({
        content: 'Reservando...',
      });
  
      loader.present().then(() => {
        var entidad = this.global.insertarReserva(this.restaurant.Id, this.mesaSeleccionada.Id, this.horaSeleccionada.Id, this.usurioLogueado.Correo, this.horaSeleccionada, this.restaurant);
        let sms = this.presentToast(entidad.Mensaje, 'top', 3000);
        if (entidad.Codigo == 0){
          //acá lo enviamos a la seleccion de restaurantes directo
          loader.dismiss();
          //acá debemos redirigir a la pàgina principal

          this.navCtrl.setRoot(InicioPage);
        }
        else {
          //hubo un error
          loader.dismiss();
        }
  
      });
    }
  }
  seleccionar(hora){
    console.log(hora);
    this.horaSeleccionada = hora;
  }
  presentToast = function(mensaje, posicion, duracion) {
    let toast = this.toastCtrl.create({
      message: mensaje,
      duration: duracion,
      position: posicion
    });

    toast.onDidDismiss(() => {
      console.log('Dismissed toast');
    });

    toast.present();
  }

}
