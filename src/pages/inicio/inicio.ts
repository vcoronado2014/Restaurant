import { Component } from '@angular/core';
import { NavController, NavParams, ToastController, LoadingController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {SeleccionRestaurantPage} from "../seleccion-restaurant/seleccion-restaurant";
import {MisReservasPage} from "../mis-reservas/mis-reservas";
//servicios
import { GlobalService } from '../../app/services/GlobalService';
import 'rxjs/add/operator/map';

@Component({
  selector: 'page-inicio',
  templateUrl: 'inicio.html',
})
export class InicioPage {

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams,
    public toastCtrl: ToastController,
    public loading: LoadingController,
    public global: GlobalService
  ) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad InicioPage');
  }
  abrirSeleccionRestaurant(){
    this.navCtrl.setRoot(SeleccionRestaurantPage);
  }
  abrirMisReservas(){
    this.navCtrl.setRoot(MisReservasPage);
  }
  salir(){
    this.navCtrl.setRoot(HomePage);
  }

}
