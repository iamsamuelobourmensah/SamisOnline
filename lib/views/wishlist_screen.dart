import 'package:ecommerce_4/controllers/cart_controller.dart';
import 'package:ecommerce_4/controllers/wishlist_controller.dart';
import 'package:ecommerce_4/models/product_model.dart';
import 'package:ecommerce_4/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistController wishlistController = Get.find();
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        actions: [
          Stack(
            children: [
              Obx(
                () => Text(
                  " ${cartController.cardScreenList.length}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 252, 187, 102),
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => ListView.builder(
            itemCount: wishlistController.wishlist.length,
            itemBuilder: (context, index) {
              final Products cardId = wishlistController.wishlist[index];
              // Build your card widget using the cardId
              return WishlistCard(
                image: cardId.image,
                index: index,
                title: cardId.title,
                price: cardId.price,
              );
            },
          ),
        ),
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    this.image,
    required this.index,
    required this.title,
    required this.price,
    //this.onTap,
  });
  final double price;
  final String title;
  final int index;
  final String? image;
  //final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.put(WishlistController());
    final CartController cartController = Get.put(CartController());
    return Card(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .15,
        width: MediaQuery.sizeOf(context).width / 1,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 5.5,
                    height: MediaQuery.sizeOf(context).height * .14,
                    child: Image.network(image!)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                      Text(
                        "GH₵ ${price.toStringAsFixed(2)}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .06,
              ),
              InkWell(
                  onTap: () {
                    // showSnackBar(context, "content");
                    final Products cardId = wishlistController.wishlist[index];
                    cartController.addToCardScreen(cardId);
                    cartController.calculateTotalPrice(cardId.price);
                  },
                  child: const Icon(Icons.add_circle)),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String content) {
  final snackBar = SnackBar(
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 600.0),
    dismissDirection: DismissDirection.none,
    backgroundColor: Colors.green,
    content: Text(content),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
