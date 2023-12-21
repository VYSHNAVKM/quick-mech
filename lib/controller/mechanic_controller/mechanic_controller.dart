import 'package:flutter/material.dart';
import 'package:quickmech/model/mechanic_model.dart';
import 'package:quickmech/utils/database/mechanic_db.dart';

class MechanicController with ChangeNotifier {
  static List saved = [];
  List<MechanicModel> mechanicList = [];
  void getMechanic() async {
    mechanicList = await mechanic.map((e) {
      return MechanicModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
