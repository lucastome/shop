import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid(this.showFavoriteOnly, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProductos =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProductos.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedProductos[i],
          key: ValueKey(loadedProductos[i].id),
          child: const ProductGridItem(),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
