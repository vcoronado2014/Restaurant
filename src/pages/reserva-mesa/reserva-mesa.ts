import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {InicioPage} from "../inicio/inicio";
import {ReservaHoraPage} from "../reserva-hora/reserva-hora";
import {SeleccionMenuPage} from "../seleccion-menu/seleccion-menu";
import { GlobalService } from '../../app/services/GlobalService';

/**
 * Generated class for the ReservaMesaPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-reserva-mesa',
  templateUrl: 'reserva-mesa.html',
})
export class ReservaMesaPage {
item;
mesaSeleccionada;
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public viewCtrl: ViewController
  ) {
    this.item = this.navParams.get('item');
    console.log(this.item);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ReservaMesaPage');
  }
  closeModal(param) {
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
  }
  seleccionar(mesa){
    console.log(mesa);
    this.mesaSeleccionada = mesa;
  }
  guardar(){
    //this.closeModal(null);
    if (this.mesaSeleccionada != null){
      let modal = this.modalCtrl.create(SeleccionMenuPage, { item: this.item, mesa: this.mesaSeleccionada, restaurant: this.item });
      modal.present();
    }

  }

}
