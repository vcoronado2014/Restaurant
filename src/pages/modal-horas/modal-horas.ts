import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController, LoadingController, ToastController, AlertController } from 'ionic-angular';
import {HomePage} from "../home/home";
import { GlobalService } from '../../app/services/GlobalService';
import * as moment from 'moment';
import {InicioPage} from "../inicio/inicio";

/**
 * Generated class for the ModalHorasPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-modal-horas',
  templateUrl: 'modal-horas.html',
})
export class ModalHorasPage {
mesaSeleccionada;
restaurant;
item;
horaSeleccionada;
horaFinalSeleccionada;
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public viewCtrl: ViewController
    ) {
      moment.locale('es');
      this.mesaSeleccionada = this.navParams.get('mesa');
      this.restaurant = this.navParams.get('restaurant');
      this.item = this.navParams.get('item');
      this.horaSeleccionada = this.navParams.get('horaSeleccionada');
      console.log(this.mesaSeleccionada);
      console.log(this.restaurant);
      console.log(this.item);
      console.log(this.horaSeleccionada);
      if (this.horaSeleccionada.Segmento){
        this.horaSeleccionada.Segmento.forEach(segmento => {
          var fecha = moment(segmento.Fecha).format("ddd, HH:mm A");
          var fechaCom = moment(segmento.Fecha).format("dddd, DD MMMM YYYY");
          var fechaCorta = moment(segmento.Fecha).format("HH:mm A");
          segmento.FechaStr = fecha;
          segmento.FechaCompleta = fechaCom;  
          segmento.FechaCorta = fechaCorta;
        });
      }
      console.log(this.horaSeleccionada.Segmento);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ModalHorasPage');
  }
  closeModalant(param) {
    
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
  }
  seleccionar(hora){
    //hay que quitar las otras horas reservadas
    
    hora.Reservada = true;
    console.log(hora);
    this.horaFinalSeleccionada = hora;
  }
  closeModal() {

    this.viewCtrl.dismiss(this.horaFinalSeleccionada);

  }
  cerrar() {
    this.horaFinalSeleccionada = null;
    this.viewCtrl.dismiss();

  }

}
