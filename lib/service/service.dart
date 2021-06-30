import 'package:http/http.dart' as http;
import '../model/product.dart';

class Service {
  static const String url =
      "http://165.227.69.207/rehmat-e-sheree/public/api/products/hashlob/web-data/products/get/all/auth";
  static Future<List<Datum>> getProducts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Datum> product = productFromJson(response.body).data;
        return product;
      } else {
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }
}
