import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // eşyaların listesi
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avokado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Muz", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Tavuk", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Su", "1.00", "lib/images/water.png", Colors.blue],
    [
      "Yumurta",
      "5.00",
      "lib/images/egg1.png",
      Color.fromARGB(255, 223, 202, 172)
    ],
    ["Peynir", "10", "lib/images/cheese1.png", Colors.orange],
    ["Domates", "4.00", "lib/images/tomato1.png", Colors.redAccent],
    ["Çilek", "7.00", "lib/images/strawberry1.png", Colors.pink],
  ];

  // sepet öğelerinin listesi
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // ürünü sepete ekle
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // ürünü sepetten kaldır
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // toplam fiyatı hesaplama
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
