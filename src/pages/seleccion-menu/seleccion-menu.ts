import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController, ToastController, AlertController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {InicioPage} from "../inicio/inicio";
import {ReservaHoraPage} from "../reserva-hora/reserva-hora";
import { GlobalService } from '../../app/services/GlobalService';

@Component({
  selector: 'page-seleccion-menu',
  templateUrl: 'seleccion-menu.html',
})
export class SeleccionMenuPage {
  total;
  item;
  arrMenus = [];
  menuAgregar;
  menuSeleccionado;
  restaurant;
  mesaSeleccionada;
  faltan = 0;
  totalCompletar = 0;
  
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService,
    public toastCtrl: ToastController, 
    public modalCtrl: ModalController,
    public alertCtrl: AlertController,
    public viewCtrl: ViewController

  ) {
    this.item = this.navParams.get('item');
    this.restaurant = this.navParams.get('restaurant');
    this.mesaSeleccionada = this.navParams.get('mesa');
    if (this.mesaSeleccionada){
      this.totalCompletar = this.mesaSeleccionada.Cantidad;
    }
    console.log(this.mesaSeleccionada);
  }
  /**
  * generate a random integer between min and max
  * @param {Number} min 
  * @param {Number} max
  * @return {Number} random generated integer 
  */
  randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
  ionViewDidLoad() {
    console.log('ionViewDidLoad SeleccionMenuPage');
  }
  closeModal(param) {
    //this.viewCtrl.dismiss();
    this.navCtrl.setRoot(InicioPage);
  }
  seleccionarMenu(menu){

    this.menuSeleccionado = menu;
    
    console.log(menu);
  }

  indexar(){
    var id = 1;
    if (this.arrMenus && this.arrMenus.length > 0){
      for(var i=0; i<this.arrMenus.length; i++){
        this.arrMenus[i].IdUnico = id;
        
        id++;
        if (i!=0){
          id = this.arrMenus[i].IdUnico + 1;
        }
        
      }
      /*
      this.arrMenus.forEach(menu => {
        menu.IdUnico = id;
        id++;
      });
      */
    }
    console.log(this.arrMenus);
  }
  sumarMenu(){
    var retorno = 0;
    var id = 1;
    if (this.arrMenus && this.arrMenus.length > 0){
      this.arrMenus.forEach(menu => {
        retorno = retorno + menu.ValorInt;
      });
    }
    if (this.mesaSeleccionada){
      this.faltan = this.mesaSeleccionada.Cantidad - this.arrMenus.length;
      console.log(this.faltan);
    }
    
    return retorno;
  }
  agregarMenu(){

    if (this.menuSeleccionado){
          //aca deberíamos crear un nuevo indice a este elemento
      //var ultimoId = this.randomInt(0,10000);

      if (this.arrMenus.length < this.mesaSeleccionada.Cantidad){
        //this.menuSeleccionado.IDD = ultimoId;
        var entidad = {
          Bebestible: this.menuSeleccionado.Bebestible,
          Entrada: this.menuSeleccionado.Entrada,
          Fondo: this.menuSeleccionado.Fondo,
          Id: this.menuSeleccionado.Id,
          IdRestaurant: this.menuSeleccionado.IdRestaurant,
          Nombre: this.menuSeleccionado.Nombre,
          Postre: this.menuSeleccionado.Postre,
          Valor: this.menuSeleccionado.Valor,
          ValorInt: this.menuSeleccionado.ValorInt,
          IDD: this.randomInt(0,10000)
        };
        this.arrMenus.push(entidad);
      }
      else{
        //enviar mensaje de cantidad excede
        let sms = this.presentToast('Ya tiene todos sus menus completados', 'bottom', 3000);
      }
      //this.menuSeleccionado = null;
    }
    else{
      //enviar mensaje
      let sms = this.presentToast('No hay menú seleccionado', 'bottom', 3000);
    }
    //this.indexar();
    this.total = this.sumarMenu();
    console.log(this.arrMenus);
  }
  quitarMenu(item){
    var nuevoArr = [];
    if (this.arrMenus){
      this.arrMenus.forEach(menu => {
        if (menu.IDD != item.IDD){
          nuevoArr.push(item);
        }
      });
    }
    this.arrMenus = nuevoArr;
    //this.indexar();
    this.total = this.sumarMenu();
  }
  abrirReserva() {
    //la seleccion de menus debe ir
    if (this.faltan == 0 && this.arrMenus.length > 0){

      let modal = this.modalCtrl.create(ReservaHoraPage, { item: this.item, mesa: this.mesaSeleccionada, restaurant: this.restaurant, arrMenus: this.arrMenus, total: this.total  });
      modal.present();
    }
    else{
      let sms = this.presentToast('No ha completado su reserva', 'bottom', 3000);
    }

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
