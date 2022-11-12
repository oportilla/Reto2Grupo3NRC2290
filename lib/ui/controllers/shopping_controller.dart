import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
    
  }

  void calcularTotal() {
    int newTotal = 0;
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    for (int i=0;i<entries.length;i++){
      
      newTotal= newTotal + (entries[i].price*entries[i].quantity);

    }
    total.value = newTotal;
    
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado
    Product posicionIc= entries.firstWhere((item) => item.id==id);
    posicionIc.quantity = posicionIc.quantity +1;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero
    Product posicionId= entries.firstWhere((item) => item.id==id);
    if (posicionId.quantity==0){
     print('La cantidad no puede ser menor que cero');
    }
    else {
      posicionId.quantity = posicionId.quantity-1;
      } 
      
    calcularTotal();
  }
}
