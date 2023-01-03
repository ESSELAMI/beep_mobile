import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/product/product.dart';
import 'package:beep_mobile/app/services/local/product.dart';
import 'package:beep_mobile/base/services/product.dart';

import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class ProductService extends BaseProductService {
  Future<List<Product>?> getProducts() async {
    // Token? token = await TokenService().getToken();
    final url = "${ProductApi.products}?size=80000";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          // 'Authorization': "Bearer " + token!.accessToken!,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode.toString() == "200") {
        List<Product> products =
            Product().getListFromJson(json.decode(response.body)["result"]);
        ProductLocalService().saveProductsSecure(products);
        return products;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<Product?> getProduct(String barcode) async {
    // Token? token = await TokenService().getToken();
    final url = "${ProductApi.findProducts}/$barcode";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          // 'Authorization': "Bearer " + token!.accessToken!,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode.toString() == "200") {
        print(response.body);
        Product product =
            Product().getFromJson(json.decode(response.body)["result"]);

        return product;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
