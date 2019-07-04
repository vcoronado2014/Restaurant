import { Component } from '@angular/core';
import { NavController, NavParams, ModalController, ViewController } from 'ionic-angular';
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
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public global: GlobalService, 
    public modalCtrl: ModalController,
    public viewCtrl: ViewController
  ) {
    this.item = this.navParams.get('item');
    this.restaurant = this.navParams.get('restaurant');
    this.mesaSeleccionada = this.navParams.get('mesa');
    console.log(this.mesaSeleccionada);
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
  sumarMenu(){
    var retorno = 0;
    var id = 1;
    if (this.arrMenus && this.arrMenus.length > 0){
      this.arrMenus.forEach(menu => {
        retorno = retorno + menu.ValorInt;
        menu.IdUnico = id;
        id++;
      });
    }
    return retorno;
  }
  agregarMenu(){
    if (this.menuSeleccionado){
      if (this.arrMenus.length < this.mesaSeleccionada.Cantidad){
        this.arrMenus.push(this.menuSeleccionado);
      }
      else{
        //enviar mensaje de cantidad excede
      }
    }
    else{
      //enviar mensaje
    }
    this.total = this.sumarMenu();
    console.log(this.arrMenus);
  }
  quitarMenu(item){
    var nuevoArr = [];
    if (this.arrMenus){
      this.arrMenus.forEach(menu => {
        if (menu.IdUnico != item.IdUnico){
          nuevoArr.push(item);
        }
      });
    }
    this.arrMenus = nuevoArr;
    this.total = this.sumarMenu();
  }


}
