import 'package:flutter/foundation.dart';

@immutable
class Promotion {
  const Promotion({required this.cactus, required this.price});

  final String cactus;
  final double price;
}

class Database {
  Database._();

  static final Database instance = Database._();

  final ValueNotifier<Promotion?> promotion = ValueNotifier<Promotion?>(null);

  void savePromotion(Promotion value) {
    promotion.value = value;
  }
}
