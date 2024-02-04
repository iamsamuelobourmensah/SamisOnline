import 'package:ecommerce_4/controllers/cart_controller.dart';
import 'package:ecommerce_4/controllers/wishlist_controller.dart';
import 'package:ecommerce_4/models/product_model.dart';
import 'package:ecommerce_4/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  final Rating rating;
  final int index;
  const DetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.index,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final CartController cartController = Get.put(CartController());
  final WishlistController wishlistController = Get.put(WishlistController());
  // void addToCardScreen() {
  //   // Products( title: widget.title, price: widget.price, description: widget.description, image: widget.image, rating: widget.rating, id: widget.index);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Product details",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .38,
                child: Center(
                    child: Image.network(
                  widget.image,
                ))),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .12,
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            Text(
              "GH₵${widget.price.toString()}",
              style: const TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            RatingBarWidget(rating: widget.rating),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .14,
              child: SingleChildScrollView(
                child: Text(
                  widget.description,
                  style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .01,
            ),
            const Text(
              "Select Size",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.sizeOf(context).height * .00,
            // ),
            Row(
              children: [
                const SizeCard(
                  size: "20",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
                const SizeCard(
                  size: "36",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
                const SizeCard(
                  size: "40",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
                const SizeCard(
                  size: "10",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
                const SizeCard(
                  size: "25",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .01,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .015,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 252, 187, 102))),
                  onPressed: () {
                   // cartController.addToCardScreen(widget.index);
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class SizeCard extends StatefulWidget {
  const SizeCard({
    super.key,
    required this.size,
  });
  final String size;

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  bool chosen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          chosen = !chosen;
        });
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * .05,
        width: MediaQuery.sizeOf(context).width * .1,
        decoration: ShapeDecoration(
          color:
              chosen ? const Color.fromARGB(255, 252, 187, 102) : Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(
            widget.size,
            style: TextStyle(
              color: chosen ? Colors.white : Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
