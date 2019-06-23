import { Component } from '@angular/core';
import { NavController, NavParams, ModalController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {InicioPage} from "../inicio/inicio";
import {ReservaMesaPage} from "../reserva-mesa/reserva-mesa";
import { GlobalService } from '../../app/services/GlobalService';

/**
 * Generated class for the SeleccionRestaurantPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-seleccion-restaurant',
  templateUrl: 'seleccion-restaurant.html',
})
export class SeleccionRestaurantPage {
  arrRestaurantes = [];
  nombrePersona;
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController
    ) {
    var userInfo = JSON.parse(localStorage.getItem("USER_INFO"));
    this.nombrePersona = userInfo.Nombre;
    this.cargar();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SeleccionRestaurantPage');
  }
  cargar(){
    //este metodo carga la lista de restaurant
    this.arrRestaurantes = [];
    var entidad = this.global.restaurantYMesas();
    this.arrRestaurantes = entidad.Usuario;
    console.log(this.arrRestaurantes);
    /*
    if(localStorage.getItem('ARR_RESTAURANTES')){
      this.arrRestaurantes = JSON.parse(localStorage.getItem('ARR_RESTAURANTES'));

    }
    */
  }
  volver(){
    //this.navCtrl.setRoot(HomePage);
    this.navCtrl.setRoot(InicioPage);
  }
  abrirReserva(item) {

    let modal = this.modalCtrl.create(ReservaMesaPage, { item: item });
    modal.present();
  }

}
