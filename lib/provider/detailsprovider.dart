import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivewithprovider/database/details.dart';

class DetailsProvider extends ChangeNotifier {
  static const String _boxName = 'details';

  List<Details> _details = [];

  void getDetails() async {
    var box = await Hive.openBox<Details>(_boxName);
    _details = box.values.toList();
    notifyListeners();
  }

  Details getDetail(index) {
    return _details[index];
  }

  void addItem(Details detail) async {
    var box = await Hive.openBox<Details>(_boxName);
    await box.add(detail);
    _details = box.values.toList();
    notifyListeners();
  }

  // void deleteItem() {}
  // void editItem() {}
}
