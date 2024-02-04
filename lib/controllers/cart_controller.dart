import 'package:ecommerce_4/controllers/wishlist_controller.dart';
import 'package:ecommerce_4/models/product_model.dart';
import 'package:get/get.dart';

final WishlistController wishlistController = Get.put(WishlistController());

class CartController extends GetxController {
  final cardScreenList = <Products>[].obs;
  //double totalPrice = 0.0;
  // RxInt quantity = 1.obs;
  Rx<double> totalPrice = 0.0.obs;

  calculateTotalPrice(price) {
    totalPrice += price;
    return totalPrice;
  }

  // reduceTotalPrice() {
  //   for (var item in cardScreenList) {
  //     totalPrice -= item.price;
  //   }
  //   return totalPrice;
  // }

  void addToCardScreen(Products cardId) {
    wishlistController.wishlist.remove(cardId);
    cardScreenList.add(cardId);
  }

  void addCartQuantity(RxInt cartQuantity) {
    cartQuantity++;
  }

  void cardMultipleir(cartQuantity, price) {
    totalPrice = cartQuantity * price;
  }

  void removeCartQuantity(RxInt cartQuantity) {
    if (cartQuantity > 1) {
      cartQuantity -= 1;
    }
  }
   void deleteCard(Products cardId) {
    cardScreenList.remove(cardId);
    if (cardId.price >= 1) {
      totalPrice - cardId.price;
    }
  }

//   void snack(index) {
//     Get.snackbar(
//   'Title',
//   'This is a snackbar message',
//   snackPosition: SnackPosition.BOTTOM, // Set the position of the snackbar
//   duration: const Duration(seconds: 3), // Set the duration for which the snackbar will be visible
//   backgroundColor: Colors.grey[800], // Set the background color of the snackbar
//   colorText: Colors.white, // Set the text color of the snackbar
//   borderRadius: 10.0, // Set the border radius of the snackbar
//   margin: const EdgeInsets.all(10.0), // Set the margin around the snackbar
//   padding: const EdgeInsets.all(20.0), // Set the padding inside the snackbar
// );
//   }
  // copied
  // double _totalPrice = 0.0;
  // double get totalPrice => _totalPrice;
  // Box<Products> get cartBox => Hive.box<Products>('myCarts');

  // void addToCart(Products cart,key) async {
  //   await cartBox.put(key,cart);

  // }

  // void emptyList() {
  //   cartBox.deleteAll(cartBox.keys);
  //   _totalPrice = 0;
  // }

  // void removeFromCart(int cartIndex) {
  //   cartBox.deleteAt(cartIndex);
  // }

  // void setToZero() {
  //   _totalPrice = 0;
  // }

  // void addTotalPrice(int productPrice) {
  //   _totalPrice = _totalPrice + productPrice;
  // }

  // void reduceTotalPrice(int productPrice) {
  //   _totalPrice = _totalPrice - productPrice;
  // }

//   final box = Hive.box<int>('cartQuantity');

//   getCartQuantity(cartQuantity) => {
//       cartQuantity = (box.get('cartQuantity')??0)
//       };

//  void counterAdd(cartQuantity) {
//     cartQuantity++;
//     box.put('cartQuantity', cartQuantity );

//   }

//   void setToZero(cartQuantity) {
//     cartQuantity = 0 ;
//     box.put('cartQuantity', cartQuantity );

//   }

//  void counterReduce(cartQuantity) {
//     cartQuantity > 0 ? cartQuantity-- : null;
//     box.put('cartQuantity', cartQuantity );

//   } NOT USING CURRENTLY

 
}
