
import 'package:ecommerce_4/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<Products>> fetchProduct() async {
    final client = http.Client();
    final url = Uri.parse("http://fakestoreapi.com/products");
    final response = await client.get(url);
    if (response.statusCode != 200) {
      print(response.body);
    }
    print(response.body);
    return productsFromJson(response.body);
  }
}
