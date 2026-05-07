import 'package:flutter/foundation.dart';

class VendorDashboardViewModel extends ChangeNotifier {
  final List<String> cactusOptions = const ['🌵', '🌵🌵', '🌵🌸'];
  final List<double> cactusPrices = const [9.99, 19.99, 29.99];

  int? _selectedIndex;
  String? _promotedCactus;

  int? get selectedIndex => _selectedIndex;

  String? get selectedCactus =>
      _selectedIndex == null ? null : cactusOptions[_selectedIndex!];

  double? get selectedPrice =>
      _selectedIndex == null ? null : cactusPrices[_selectedIndex!];

  String? get promotedCactus => _promotedCactus;

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
    notifyListeners();
  }
}
