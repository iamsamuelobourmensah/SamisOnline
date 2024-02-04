import 'package:ecommerce_4/views/cart_screen.dart';
import 'package:ecommerce_4/views/home_page.dart';
import 'package:ecommerce_4/views/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final Authentication auth = Authentication();
  // @override
  // void initState() {
  //   auth.context = context;
  //   super.initState();
  //   CartCounterProvider().getCartQuantity();
  // }

  List<Widget> pages = const [
    HomePage(),
    WishListScreen(),
    CartScreen(),
  ];
  OnTap onTap = OnTap();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: onTap,
      builder: (context, value, child) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: value,
              children: pages,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 248, 212, 224),
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: value,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              onTap: (index) => onTap.whenTapped(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(255, 248, 212, 224),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
              ]),
        );
      },
    );
  }
}

class OnTap extends ValueNotifier<int> {
  OnTap._sharedInference() : super(0);
  static final OnTap _shared = OnTap._sharedInference();
  factory OnTap() => _shared;
  void whenTapped(int index) {
    value = index;
    notifyListeners();
  }
}
