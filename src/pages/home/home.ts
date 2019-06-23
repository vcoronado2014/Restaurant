import { Component } from '@angular/core';
import { NavController, NavParams, ToastController, LoadingController } from 'ionic-angular';
import {RegistroPage} from "../registro/registro";
import {InicioPage} from "../inicio/inicio";
import {SeleccionRestaurantPage} from "../seleccion-restaurant/seleccion-restaurant";
import { GlobalService } from '../../app/services/GlobalService';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
correo;
password;
checkRecordar: boolean = false;
nombrePersona: string = '';
  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams,
    public toastCtrl: ToastController,
    public loading: LoadingController,
    public global: GlobalService
  ) {
    //prueba
    //console.log(this.global.agendaDeMesas(1));
    //esta logica es para recordar la contraseña
    var userInfo = JSON.parse(localStorage.getItem("USER_INFO"));
    if (userInfo && userInfo.Correo != '' && userInfo.Password != '') {
      if (localStorage.getItem("AUTOLOGIN") && localStorage.getItem("AUTOLOGIN") != 'undefined'){
        var auto = JSON.parse(localStorage.getItem("AUTOLOGIN"));
        this.checkRecordar = auto;
        
        if (auto){
          //this.autologin(userInfo.usuario, userInfo.password);
          this.correo = userInfo.Correo;
          this.password = userInfo.Password;
        }
        else{
          this.correo = '';
          this.password = '';
        }
      }
    }

  }
  abrirPaginaRegistro(){
    this.navCtrl.setRoot(RegistroPage);
  }
  login(){
    //antes las validaciones
    if (this.correo == undefined || this.correo == null || this.correo == ''){
      let sms = this.presentToast('Correo es requerido', 'top', 3000);
      return;
    }

    if (this.password == undefined || this.password == null || this.password == ''){
      let sms = this.presentToast('Password es requerido', 'top', 3000);
      return;
    }


    let loader = this.loading.create({
      content: 'Registrando...',
    });

    loader.present().then(() => {
      var entidad = this.global.autentificarse(this.correo, this.password);
      let sms = this.presentToast(entidad.Mensaje, 'top', 3000);
      if (entidad.Codigo == 0){
        loader.dismiss();
        //esta correcto, llevarlo a la pagina de restaurantes
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

}
