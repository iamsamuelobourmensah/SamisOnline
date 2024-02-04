import 'package:ecommerce_4/models/product_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final wishlist = <Products>[].obs;

  void addToWishlist(Products cardId) {
    if (!wishlist.contains(cardId)) {
      wishlist.add(cardId);
    } else {
      wishlist.remove(cardId);
    }
  }

void deleteCard(Products cardId) {
    wishlist.remove(cardId);
  }

}
