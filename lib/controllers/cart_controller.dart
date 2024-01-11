import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  final List _list = [].obs;
  List get list => _list;
  addProduct(index) {
    list.add(index);
    Get.snackbar("title", "message");
  }
}
