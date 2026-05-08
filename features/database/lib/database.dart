import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class Promotion {
  const Promotion({required this.cactus, required this.price});

  final String cactus;
  final double price;
}

class Database {
  Database._();

  static final Database instance = Database._();

  static const _cactusKey = 'promotion.cactus';
  static const _priceKey = 'promotion.price';

  final ValueNotifier<Promotion?> promotion = ValueNotifier<Promotion?>(null);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final cactus = prefs.getString(_cactusKey);
    final price = prefs.getDouble(_priceKey);
    if (cactus != null && price != null) {
      promotion.value = Promotion(cactus: cactus, price: price);
    }
  }

  Future<void> savePromotion(Promotion value) async {
    promotion.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cactusKey, value.cactus);
    await prefs.setDouble(_priceKey, value.price);
  }
}
