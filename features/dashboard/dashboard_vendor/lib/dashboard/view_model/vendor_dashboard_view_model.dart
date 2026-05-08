import 'package:database/database.dart';
import 'package:flutter/foundation.dart';

class VendorDashboardViewModel extends ChangeNotifier {
  VendorDashboardViewModel({Database? database})
    : _database = database ?? Database.instance;

  final Database _database;

  final List<String> cactusOptions = const ['🌵', '🌵🌵', '🌵🌸'];
  final List<double> cactusPrices = const [9.99, 19.99, 29.99];

  int? _selectedIndex;
  String? _promotedCactus;
  double? _promotedPrice;

  int? get selectedIndex => _selectedIndex;

  String? get selectedCactus =>
      _selectedIndex == null ? null : cactusOptions[_selectedIndex!];

  double? get selectedPrice =>
      _selectedIndex == null ? null : cactusPrices[_selectedIndex!];

  String? get promotedCactus => _promotedCactus;
  double? get promotedPrice => _promotedPrice;

  void selectCactus(int index) {
    if (index < 0 || index >= cactusOptions.length || index == _selectedIndex) {
      return;
    }

    _selectedIndex = index;
    notifyListeners();
  }

  void promoteSelectedCactus() {
    if (selectedCactus == null) {
      return;
    }

    _promotedCactus = selectedCactus;
    _promotedPrice = selectedPrice;
    _database.savePromotion(
      Promotion(cactus: _promotedCactus!, price: _promotedPrice!),
    );
    notifyListeners();
  }
}
