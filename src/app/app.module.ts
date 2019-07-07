import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { RegistroPage } from '../pages/registro/registro';
import { SeleccionRestaurantPage } from '../pages/seleccion-restaurant/seleccion-restaurant';
import { ReservaMesaPage } from '../pages/reserva-mesa/reserva-mesa';
import { ReservaHoraPage } from '../pages/reserva-hora/reserva-hora';
import { InicioPage } from '../pages/inicio/inicio';
import { MisReservasPage } from '../pages/mis-reservas/mis-reservas';
import { SeleccionMenuPage } from '../pages/seleccion-menu/seleccion-menu';
import { ModalHorasPage } from '../pages/modal-horas/modal-horas';
//servicios
import { GlobalService } from '../app/services/GlobalService';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    RegistroPage,
    ReservaMesaPage,
    ReservaHoraPage,
    InicioPage,
    MisReservasPage,
    SeleccionRestaurantPage,
    ModalHorasPage,
    SeleccionMenuPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    RegistroPage,
    ReservaMesaPage,
    ReservaHoraPage,
    InicioPage,
    MisReservasPage,
    SeleccionRestaurantPage,
    SeleccionMenuPage,
    ModalHorasPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    GlobalService,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
