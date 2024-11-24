import 'package:fake_store_api/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductController controller = ProductController();
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    controller.fetchProducts().then((fetchedProducts) {
      setState(() {
        products = fetchedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Produtos da Fake Store API',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: products.map((product) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem do produto
                  Center(
                    child: Image.network(
                      product.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Nome do produto
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Preço do produto
                  Text(
                    'Preço: R\$ ${product.price}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Categoria do produto
                  Text(
                    'Categoria: ${product.category}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
