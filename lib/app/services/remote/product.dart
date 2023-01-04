import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/product/product.dart' as local_product;
import 'package:beep_mobile/app/services/local/product.dart';
import 'package:beep_mobile/base/services/product.dart';

import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductService extends BaseProductService {
  Future<List<local_product.Product>?> getProducts() async {
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
        List<local_product.Product> products = local_product.Product()
            .getListFromJson(json.decode(response.body)["result"]);
        ProductLocalService().saveProductsSecure(products);
        return products;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<local_product.Product?> getProduct(String barcode) async {
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
        local_product.Product product = local_product.Product()
            .getFromJson(json.decode(response.body)["result"]);

        return product;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  /// request a product from the OpenFoodFacts database
  Future<local_product.Product?> getProductFromAPI(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );
    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      local_product.Product product = local_product.Product();
      product.codeBarre = barcode;
      product.nomFr = result.product!.productName;
      product.nomFr = result.product!.productName;

      return product;
    } else {
      return null;
      // throw Exception('product not found, please insert data for $barcode');
    }
  }
}
