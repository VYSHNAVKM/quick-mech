import 'package:flutter/material.dart';
import 'package:quickmech/utils/database/database_for%20_favourite.dart';

class FavouriterController with ChangeNotifier {
  late FavouriteModel _favouriteModel;

  final List itemid = [];
  FavouriteModel get favouritelist => _favouriteModel;
  set favouritelist(FavouriteModel newList) {
    _favouriteModel = newList;
    notifyListeners();
  }

  List<Item> get favitems =>
      itemid.map((id) => _favouriteModel.getById(id)).toList();

  void add(Item item) {
    itemid.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    itemid.remove(item.id);
    notifyListeners();
  }
}
