import 'package:ecommerce_4/models/product_model.dart';
import 'package:ecommerce_4/services/product_repo.dart';

class ProductController {

  Future<List<Products>> fetchProduct() {
    return ProductRepo().fetchProduct();
  }
}
