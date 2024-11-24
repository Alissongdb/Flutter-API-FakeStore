import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductController {
  // URL do endpoint da Fake Store API
  final String url = 'https://fakestoreapi.com/products';

  // Método para buscar os produtos
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      //CONVERTE CADA ITEM DO JSON EM UM OBJETO PRODUCTMODEL
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar produtos');
    }
  }
}
