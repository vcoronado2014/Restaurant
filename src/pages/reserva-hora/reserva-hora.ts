import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController, LoadingController, ToastController, AlertController } from 'ionic-angular';
import {HomePage} from "../home/home";
import { GlobalService } from '../../app/services/GlobalService';
import * as moment from 'moment';
import { InicioPage } from '../inicio/inicio';
import { ModalHorasPage } from '../modal-horas/modal-horas';

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
  item;
  arrMenus;
  horaFinalSeleccionada;
  total;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public toastCtrl: ToastController,
    public loading: LoadingController,
    public alertCtrl: AlertController,
    public viewCtrl: ViewController
    ) {
      moment.locale('es');
      this.mesaSeleccionada = this.navParams.get('mesa');
      this.restaurant = this.navParams.get('restaurant');
      this.item = this.navParams.get('item');
      this.arrMenus = this.navParams.get('arrMenus');
      this.total = this.navParams.get('total');
      //console.log(this.arrMenus);
      //console.log(this.mesaSeleccionada);

      
      if (this.mesaSeleccionada.Horas){
        this.mesaSeleccionada.Horas.forEach(hora => {
          var cupos = 0;
          var fechaStr = moment(hora.Fecha);
          hora.FechaStr = fechaStr.format("dddd, DD MMMM YYYY");
          hora.Mostrar = false;
          hora.Segmento.forEach(segmento => {
            var fecha = moment(segmento.Fecha).format("ddd, HH:mm A");
            var fechaCorta = moment(segmento.Fecha).format("HH:mm A");
            var fechaCom = moment(segmento.Fecha).format("dddd, DD MMMM YYYY");
            segmento.FechaStr = fecha;
            segmento.FechaCompleta = fechaCom;
            segmento.FechaCorta = fechaCorta;
            if (segmento.Reservada == true){
              cupos++;
            }  
          });
          hora.CantidadCupos = cupos;
        });
      }
      this.usurioLogueado = JSON.parse(localStorage.getItem('USER_INFO'));
      console.log(this.mesaSeleccionada);
      //console.log(this.restaurant);

  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ReservaHoraPage');
  }
  closeModal(param) {
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
  }
  guardar(){
    if (this.horaFinalSeleccionada){
      let loader = this.loading.create({
        content: 'Reservando...',
      });
  
      loader.present().then(() => {
        //var entidad = this.global.insertarReserva(this.restaurant.Id, this.mesaSeleccionada.Id, this.horaSeleccionada.Id, this.usurioLogueado.Correo, this.horaSeleccionada, this.restaurant);
        var entidad = this.global.insertarReserva(this.restaurant.Id, this.mesaSeleccionada.Id, this.horaFinalSeleccionada.Id, this.usurioLogueado.Correo, this.horaSeleccionada, this.restaurant, this.arrMenus, this.total);
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
  seleccionarHora(hora){
    console.log(hora);
    this.horaFinalSeleccionada = hora;
  }
  showRadio(fecha) {
    let alert = this.alertCtrl.create();
    alert.setTitle('Seleccione Hora');

    fecha.Segmento.forEach(segmento => {
      alert.addInput({
        type: 'radio',
        label: segmento.Fecha,
        value: segmento.Id,
        checked: segmento.Reservada
      });
      
    });
    /*
    alert.addInput({
      type: 'radio',
      label: 'Blue',
      value: 'blue',
      checked: true
    });
    */

    alert.addButton('Cancel');
    alert.addButton({
      text: 'OK',
      handler: data => {
        console.log(data);
        //this.testRadioOpen = false;
        //this.testRadioResult = data;
      }
    });
    alert.present();
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
  marcarDelArreglo(segmentoHora){
    if (this.mesaSeleccionada.Horas){
      this.mesaSeleccionada.Horas.forEach(horas => {
        var cupos = 0;
        horas.Segmento.forEach(segmento => {
          
            if (segmentoHora.Id == segmento.Id){
              horas.Mostrar = true;
              segmento.Reservada = true;
              console.log('Mostrar ' + horas.Fecha);
            }
            else{
              horas.Mostrar = false;
              if (!segmento.Reservada){
                segmento.Reservada = false;
              }
              
            }
            if (segmento.Reservada == true){
              cupos++;
            }
          

          horas.CantidadCupos = cupos; 
        });
        
      });
    }
  }
  
  presentModal(item) {
    this.horaSeleccionada = item;
    this.horaFinalSeleccionada = null;
    if (this.horaSeleccionada != null){
      let modal = this.modalCtrl.create(ModalHorasPage, { horaSeleccionada: this.horaSeleccionada, mesa: this.mesaSeleccionada, restaurant: this.restaurant, item: this.item });
      modal.onDidDismiss(data => {
        // Data is your data from the modal
        if (data != undefined){
          //aca viene la hora final reservada
          this.horaFinalSeleccionada = data;
          //this.horaFinalSeleccionada.Reservada = true;
          //console.log(this.horaFinalSeleccionada);
          //ahora hay que marcar la hora reservada del arreglo
          this.marcarDelArreglo(this.horaFinalSeleccionada);
          console.log(this.horaFinalSeleccionada);

        }
      });
      modal.present();
    }
  }

}
