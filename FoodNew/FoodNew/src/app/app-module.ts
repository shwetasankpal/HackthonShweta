import { NgModule, provideBrowserGlobalErrorListeners, provideZonelessChangeDetection } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing-module';
import { App } from './app';
import { Components } from './components/components';
import { Orders } from './orders/orders';
import { Cart } from './cart/cart';
import { Login } from './components/login/login';
import { Menu } from './components/menu/menu';
import { Navbar } from './components/navbar/navbar';
import { RestaurantLis } from './restaurant-lis/restaurant-lis';
import { RestaurantList } from './restaurant-list/restaurant-list';
import { AuthService } from './services/auth.service/auth.service';
import { CartService } from './services/cart.service/cart.service';
import { Services } from './components/services/services';
import { Order } from './services/order/order';
import { ResturantList } from './component/resturant-list/resturant-list';

@NgModule({
  declarations: [
    App,
    Components,
    Orders,
    Cart,
    Login,
    Menu,
    Navbar,
    RestaurantLis,
    RestaurantList,
    AuthService,
    CartService,
    Services,
    Order,
    ResturantList
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZonelessChangeDetection()
  ],
  bootstrap: [App]
})
export class AppModule { }
