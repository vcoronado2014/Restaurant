import { Component } from '@angular/core';
import { NavController, NavParams, ToastController, LoadingController } from 'ionic-angular';
import {HomePage} from "../home/home";
import {SeleccionRestaurantPage} from "../seleccion-restaurant/seleccion-restaurant";
import {InicioPage} from "../inicio/inicio";
//servicios
import { GlobalService } from '../../app/services/GlobalService';
import 'rxjs/add/operator/map';
/**
 * Generated class for the RegistroPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-registro',
  templateUrl: 'registro.html',
})
export class RegistroPage {
  checkCondiciones: boolean = true;
  correo;
  nombre;
  password;
  repitaPassword;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams,
    public toastCtrl: ToastController,
    public loading: LoadingController,
    public global: GlobalService
  ) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegistroPage');
  }
  volver(){
    this.navCtrl.setRoot(HomePage);
  }
  registrarse(){
    //antes las validaciones
    if (this.correo == undefined || this.correo == null || this.correo == ''){
      let sms = this.presentToast('Correo es requerido', 'top', 3000);
      return;
    }
    if (this.nombre == undefined || this.nombre == null || this.nombre == ''){
      let sms = this.presentToast('Nombre es requerido', 'top', 3000);
      return;
    }
    if (this.password == undefined || this.password == null || this.password == ''){
      let sms = this.presentToast('Password es requerido', 'top', 3000);
      return;
    }
    if (this.repitaPassword == undefined || this.repitaPassword == null || this.repitaPassword == ''){
      let sms = this.presentToast('Repita password es requerido', 'top', 3000);
      return;
    }
    if (this.repitaPassword != this.password){
      let sms = this.presentToast('Las contraseñas deben coincidir', 'top', 3000);
      return;
    }
    if (this.validaEmail(this.correo) == false){
      let sms = this.presentToast('El correo electrónico es inválido', 'top', 3000);
      return;
    }

    let loader = this.loading.create({
      content: 'Registrando...',
    });

    loader.present().then(() => {
      var entidad = this.global.insertarUsuario(this.correo, this.nombre, this.password);
      let sms = this.presentToast(entidad.Mensaje, 'top', 3000);
      if (entidad.Codigo == 0){
        //acá lo enviamos a la seleccion de restaurantes directo
        loader.dismiss();
        //this.navCtrl.setRoot(SeleccionRestaurantPage);
        this.navCtrl.setRoot(InicioPage);
      }
      else {
        //hubo un error
        loader.dismiss();
      }

    });

  }
  guardarPreferencia(check){
    localStorage.setItem('AUTOLOGIN', check);
    if (check == false){
      this.correo = '';
      this.password = '';
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
  validaEmail(correo){
    var retorno = false;
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(correo);
    if (re){
      retorno = true;
    }
    return retorno;
  }

}
