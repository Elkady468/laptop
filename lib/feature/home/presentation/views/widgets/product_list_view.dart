import 'package:flutter/material.dart';
import 'package:laptop/feature/home/data/models/product_model.dart';
import 'package:laptop/feature/home/presentation/views/details_view.dart';
import 'package:laptop/feature/home/presentation/views/widgets/product_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductDetailsPage(product: products[index]);
                },
              ),
            );
          },
          product: products[index],
        );
      },
    );
  }
}
