import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController, LoadingController, ToastController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {InicioPage} from "../inicio/inicio";
import {ReservaMesaPage} from "../reserva-mesa/reserva-mesa";
import { GlobalService } from '../../app/services/GlobalService';

@Component({
  selector: 'page-mis-reservas',
  templateUrl: 'mis-reservas.html',
})
export class MisReservasPage {
  arrReservas;
  usurioLogueado;
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public loading: LoadingController,
    public toastCtrl: ToastController,
    public viewCtrl: ViewController
  ) {
    this.usurioLogueado = JSON.parse(localStorage.getItem('USER_INFO'));
    this.cargar();

  }
  cargar(){
    this.arrReservas = [];
    let loader = this.loading.create({
      content: 'Buscando Reservas...',
    });

    loader.present().then(() => {
      this.arrReservas = this.global.listarReservas(this.usurioLogueado.Correo);
      console.log(this.arrReservas);
      loader.dismiss();
    });
  }
  eliminar(item){
    let loader = this.loading.create({
      content: 'Eliminando...',
    });

    loader.present().then(() => {
      var entidad = this.global.eliminarReserva(item);
      let sms = this.presentToast(entidad.Mensaje, 'top', 3000);
      if (entidad.Codigo == 0){
        this.cargar();
        loader.dismiss();
        //this.navCtrl.setRoot(InicioPage);
      }
      else {
        //hubo un error
        loader.dismiss();
      }

    });
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MisReservasPage');
  }
  
  closeModal(param) {
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
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
