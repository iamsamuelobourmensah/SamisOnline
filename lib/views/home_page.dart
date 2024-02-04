import 'package:ecommerce_4/controllers/cart_controller.dart';
import 'package:ecommerce_4/controllers/product_controller.dart';
import 'package:ecommerce_4/controllers/wishlist_controller.dart';
import 'package:ecommerce_4/models/product_model.dart';
import 'package:ecommerce_4/views/cart_screen.dart';
import 'package:ecommerce_4/views/details_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ProductController().fetchProduct();
  }

  final CartController cartController = Get.put(CartController());
  final WishlistController wishlistController = Get.put(WishlistController());

  int isSelected = 0;
  int isSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   currentIndex: isSelectedIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //       backgroundColor: Color.fromARGB(255, 248, 212, 224),
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite_outline_outlined), label: "WishList"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person_2_outlined), label: "Profile"),
      //   ],
      //   landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      //   onTap: (int index) {
      //     _navigateToPage(context, index);
      //   },
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      // ),
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              Obx(
                () => Text(
                  " ${cartController.cardScreenList.length}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 252, 187, 102),
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
        title: const Text(
          "StylePoint.",
          style: TextStyle(
              color: Color.fromARGB(255, 252, 187, 102),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: const Color.fromARGB(255, 248, 212, 224),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), // Adjust the radius as needed
            bottomRight: Radius.circular(10), // Adjust the radius as needed
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Container(
              //       width: MediaQuery.sizeOf(context).width / 1,
              //       height: MediaQuery.sizeOf(context).height * .09,
              //       decoration: const BoxDecoration(
              //         color: Color.fromARGB(255, 248, 212, 224),
              //         borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(15),
              //             bottomRight: Radius.circular(15)),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         // Pink container
              //         children: [
              //           IconButton(
              //               onPressed: () {}, icon: const Icon(Icons.menu)),
              //           // SizedBox(
              //           //   width: MediaQuery.sizeOf(context).width / 6.5,
              //           // ),
              //           const Text(
              //             "StylePoint.",
              //             style: TextStyle(
              //                 color: Color.fromARGB(255, 252, 187, 102),
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           // SizedBox(
              //           //   width: MediaQuery.sizeOf(context).width * .15,
              //           // ),
              //           // IconButton(
              //           //     onPressed: () {},
              //           //     icon: const Icon(Icons.notifications_none_outlined)),
              //           Stack(
              //             children: [
              //               Obx(
              //                 () => Text(
              //                   " ${cartController.cardScreenList.length}",
              //                   style: const TextStyle(
              //                     fontSize: 16,
              //                     color: Color.fromARGB(255, 252, 187, 102),
              //                   ),
              //                 ),
              //               ),
              //               IconButton(
              //                   onPressed: () {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) =>
              //                               const CartScreen()),
              //                     );
              //                   },
              //                   icon: const Icon(Icons.shopping_cart_outlined)),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ), // END OF PINK CONTAINER
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .07,
                      width: MediaQuery.sizeOf(context).width / 1,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Color.fromARGB(255, 233, 228, 228),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            style: BorderStyle.none,
                            color: Colors.grey,
                          )),
                          // focusColor: Colors.black,
                          isDense: true,

                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: 25.0,
                          ),
                          hintText: "Search Product",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    // ORANGE CONTAINER
                    Stack(
                      // clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * .25,
                          width: MediaQuery.sizeOf(context).width / 1,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 248, 212, 224),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SALE",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 252, 187, 102),
                                  ),
                                ),
                                const Text(
                                  "UPTO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "25% ",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 252, 187, 102),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("OFF",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.sizeOf(context).height * .02,
                                // ),
                                const Text("Summer dress",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .03,
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 252, 187, 102)),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) {
                                      //   return const DetailScreen();
                                      // }));
                                    },
                                    child: const Text(
                                      "Order Now",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 1,
                            child: Image.asset("assets/images/girl.png")),
                      ],
                    ),
                    // SizedBox(
                    //   height: MediaQuery.sizeOf(context).height * .00,
                    // ),
                    const Text(
                      "Featured",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    FutureBuilder(
                        future: ProductController().fetchProduct(),
                        builder: (context, snaphot) {
                          print(snaphot.data);
                          final data = snaphot.data;
                          if (snaphot.connectionState == ConnectionState.none) {
                            return const Center(
                                child: Text(
                              "under progress",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ));
                          } else if (snaphot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snaphot.data == null) {
                            return const Center(
                                child: Text(
                              "Turn on your mobile data or wifi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ));
                          }

                          return SizedBox(
                              height: MediaQuery.sizeOf(context).height * .42,
                              child: GridView.builder(
                                  itemCount: data!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          mainAxisExtent: 212,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 0),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    image: data[index].image,
                                                    title: data[index].title,
                                                    price: data[index].price,
                                                    rating: data[index].rating,
                                                    description:
                                                        data[index].description,
                                                    index: index,
                                                  )),
                                        );
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                2.5,
                                        child: Card(
                                          color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        .18,
                                                    // width: MediaQuery.sizeOf(
                                                    //             context)
                                                    //         .width /
                                                    //     2.5,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.white),
                                                    child: Center(
                                                      child: Image.network(
                                                        data[index].image,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      right: -1,
                                                      child: Obx(
                                                        () => IconButton(
                                                          onPressed: () {
                                                            final Products
                                                                cardId =
                                                                data[index];
                                                            wishlistController
                                                                .addToWishlist(
                                                                    cardId);
                                                          },
                                                          icon: const Icon(
                                                              Icons.favorite),
                                                          color: wishlistController
                                                                  .wishlist
                                                                  .contains(data[
                                                                      index])
                                                              ? const Color
                                                                  .fromARGB(255,
                                                                  252, 187, 102)
                                                              : Colors.grey,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              Text(
                                                data[index].title,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              // SizedBox(
                                              //   height:
                                              //       MediaQuery.sizeOf(context)
                                              //               .height *
                                              //           .001,
                                              // ),
                                              Text(
                                                "GH₵${data[index].price}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10),
                                              ),
                                              SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        .01,
                                              ),
                                              RatingBarWidget(
                                                  rating: data[index].rating),
                                              // SizedBox(
                                              //   height:
                                              //       MediaQuery.sizeOf(context)
                                              //               .height *
                                              //           .01,
                                              // ),
                                              // Text(
                                              //   " ${data[index].}",
                                              //   style: const TextStyle(
                                              //       color: Colors.black,
                                              //       fontSize: 10),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }));
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// void _navigateToPage(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//       break;
//     case 1:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const WishListScreen()),
//       );
//       break;
//     case 2:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const CartScreen()),
//       );
//       break;
//   }
// }

class RatingBarWidget extends StatelessWidget {
  final Rating rating;

  const RatingBarWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 15.0,
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
