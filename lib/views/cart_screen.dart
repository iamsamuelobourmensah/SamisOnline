import 'package:ecommerce_4/controllers/cart_controller.dart';
import 'package:ecommerce_4/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Cart',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => SizedBox(
                  height: MediaQuery.sizeOf(context).height * .7,
                  child: ListView.builder(
                    itemCount: cartController.cardScreenList.length,
                    itemBuilder: (context, index) {
                      final Products product =
                          cartController.cardScreenList[index];
                      return CartCard(
                        index: index,
                        image: product.image,
                        title: product.title,
                        price: product.price,
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "GH₵${cartController.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 252, 187, 102)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.sizeOf(context).height * .3,
                              width: MediaQuery.sizeOf(context).width / 1,
                              child: Dialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 248, 212, 224),
                                // elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                // shadowColor:
                                //     const Color.fromARGB(255, 241, 240, 240),

                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .5,
                                  width: MediaQuery.sizeOf(context).width / 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Center(
                                          child: Text(
                                            "Checkout",
                                            style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.w900,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .02,
                                        ),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: "Samuel obour Mensah",
                                            label: Text(
                                              "Name On the Card",
                                              style: TextStyle(
                                                color: Colors.black,
                                                // fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .02,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: "1234567890",
                                              label: const Text(
                                                "Card Number",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  // fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              suffix: Image.asset(
                                                "assets/images/master-removebg-preview.png",
                                                height: 25,
                                                width: 25,
                                              )),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  .3,
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "09/12/2030",
                                                  label: Text(
                                                    "Expiry Date",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      // fontWeight: FontWeight.w900,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  .3,
                                              child: TextFormField(
                                                obscureText: true,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "***",
                                                  label: Text(
                                                    "CVV",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      // fontWeight: FontWeight.w900,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Total:",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                " GH₵${cartController.totalPrice.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .01,
                                        ),
                                        ElevatedButton(
                                          style: const ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                0)))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        255, 252, 187, 102)),
                                          ),
                                          onPressed: () {
                                            
                                          },
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Pay Now",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }));
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const DetailScreen();
                      // }));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard({
    super.key,
    required this.index,
    required this.image,
    required this.title,
    required this.price,
  });
  final int index;
  final String image;
  final String title;
  // final CartController controller;
  // final Category category;
  final double price;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    RxInt cartQuantity = 1.obs;
    // Counter counter = Counter(1);

    return Card(
      elevation: 0.9,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .15,
        width: MediaQuery.sizeOf(context).width / 1,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .15,
                child: Image.network(widget.image)),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 7,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Row(
                    children: [
                      Text(
                        "GH₵ ${widget.price.toStringAsFixed(2)}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .08,
                      ),
                      InkWell(
                          onTap: () {
                            //  final Products cardId =
                            //   cartController.cardScreenList[widget.index];

                            cartController.addCartQuantity(cartQuantity);
                            cartController.cardMultipleir(
                                cartQuantity, widget.price);
                          },
                          child: const Icon(Icons.add)),
                      Expanded(
                        child: Center(
                          child: Obx(
                            () => Text(
                              "$cartQuantity",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            cartController.removeCartQuantity(cartQuantity);
                          },
                          child: const Icon(Icons.remove)),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .01,
                      ),
                      InkWell(
                          onTap: () {
                            final Products cardId =
                                cartController.cardScreenList[widget.index];
                            cartController.deleteCard(cardId);
                          },
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// @HiveType(typeId: 0)
// class Cart extends HiveObject {
//   @HiveField(4)
//   static ValueNotifier<int> quantity = ValueNotifier(1);
// }

class Counter extends ValueNotifier<int> {
  Counter(int value) : super(1);
}
