import 'package:hive/hive.dart';

part 'template.g.dart';

@HiveType(typeId: Template.typeId)
class Template extends HiveObject {
  Template({
    required this.nameRaw,
    required this.isCurrencySelectedRaw,
    required this.addressRaw,
    required this.cryptoCurrencyRaw,
    required this.amountRaw,
    required this.fiatCurrencyRaw,
    required this.amountFiatRaw});

  static const typeId = 6;
  static const boxName = 'Template';

  @HiveField(0)
  String? nameRaw;

  @HiveField(1)
  String? addressRaw;

  @HiveField(2)
  String? cryptoCurrencyRaw;

  @HiveField(3)
  String? amountRaw;

  @HiveField(4)
  String? fiatCurrencyRaw;

  @HiveField(5)
  bool? isCurrencySelectedRaw;

  @HiveField(6)
  String? amountFiatRaw;

  bool get isCurrencySelected => isCurrencySelectedRaw ?? false;

  String get fiatCurrency => fiatCurrencyRaw ?? '';

  String get amountFiat => amountFiatRaw ?? '';

  String get name => nameRaw ?? '';

  String get address => addressRaw ?? '';

  String get cryptoCurrency => cryptoCurrencyRaw ?? '';

  String get amount => amountRaw ?? '';
}

