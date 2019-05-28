import { Component } from '@angular/core';
import { NavController, NavParams, ViewController } from 'ionic-angular';

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
  constructor(public navCtrl: NavController, public navParams: NavParams, private viewCtrl: ViewController) {
    this.item = this.navParams.get('item');
    console.log(this.item);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ReservaMesaPage');
  }
  closeModal(param) {
    this.viewCtrl.dismiss();
  }
  guardar(){
    this.closeModal(null);
  }

}
