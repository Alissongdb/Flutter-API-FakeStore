import 'package:fake_store_api/views/product_view.dart';
import 'package:flutter/material.dart';

class AppFakeStoreAPI extends StatefulWidget {
  const AppFakeStoreAPI({super.key});

  @override
  State<AppFakeStoreAPI> createState() => _AppFakeStoreAPIState();
}

class _AppFakeStoreAPIState extends State<AppFakeStoreAPI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(),
    );
  }
}
