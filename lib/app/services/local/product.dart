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

  Future<void> saveProduct(Product product) async {
    try {
      final encryptedBox = await Hive.openBox<Product>("products");
      await encryptedBox.add(product);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Product>?> getProducts() async {
    try {
      final officineBox = await Hive.openBox<Product>("products");
      if (officineBox.isNotEmpty) {
        List<Product> temp = officineBox.values.toList();

        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }
}
