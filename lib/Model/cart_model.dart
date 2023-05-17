import 'package:flutter/foundation.dart';
import 'package:xcenter_demo/Model/sport_model.dart';

class CartModel extends ChangeNotifier {

  // The private field backing [Sport].
  late CatalogModel _catalog;

  // Internal, private state of the cart.
  final List<int> _itemIds = [];

  // The current Sport.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  // List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Adds [item] to cart.
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  // Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}