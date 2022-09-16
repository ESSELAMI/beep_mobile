import 'package:beep_mobile/app/models/product/product.dart';
import 'package:hive/hive.dart';

class ProductLocalService {
  clearProduct() async {
    try {
      final productBox = await Hive.openBox<Product>("products");
      productBox.clear();
    } on Exception {
      throw Exception();
    }
  }

  Future<bool> saveProduct(Product product) async {
    try {
      final productsBox = await Hive.openBox<Product>("products");
      print("-------------");
      var p = productsBox.values
          .where((element) => product.codeBarre == element.codeBarre);
      if (p.isEmpty) {
        await productsBox.add(product);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Product>?> getProducts() async {
    try {
      final productsBox = await Hive.openBox<Product>("products");
      if (productsBox.isNotEmpty) {
        List<Product> temp = productsBox.values.toList().cast<Product>();

        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }
}
