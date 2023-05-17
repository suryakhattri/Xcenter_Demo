import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcenter_demo/Model/cart_model.dart';
import 'package:xcenter_demo/Model/sport_model.dart';
import 'package:xcenter_demo/UI/Sport/cart_page.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<CartModel>();
              cart.add(item);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item Added To Cart Successfully.')));
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED', color: Colors.green,)
          : const Text('Add to Cart', style: TextStyle(fontSize: 17),),
    );
  }
}

// Appbar
class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            });
      }),
      backgroundColor: const Color.fromARGB(255, 65, 74, 109),
      title: Text('Sport', style: TextStyle(color: Colors.white)),
      floating: true,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new MyCart()));
          },
        ),
      ],
    );
  }
}

//List of items
class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
          maxHeight: 60,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  child: item.imageData,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(item.name, style: textTheme),
              ),
              const SizedBox(width: 24),
              _AddButton(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
