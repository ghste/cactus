import 'package:flutter/foundation.dart';

class VendorDashboardViewModel extends ChangeNotifier {
  final List<String> cactusOptions = const ['🌵', '🌵🌵', '🌵🌸'];

  int? _selectedIndex;
  String? _promotedCactus;

  int? get selectedIndex => _selectedIndex;

  String? get selectedCactus =>
      _selectedIndex == null ? null : cactusOptions[_selectedIndex!];

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
