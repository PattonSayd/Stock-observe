// {
//   "c": 261.74,
//   "h": 263.31,
//   "l": 260.68,
//   "o": 261.07,
//   "pc": 259.45,
//   "t": 1582641000
// }

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';

import '../../../service/types/types.dart';

part 'item_prices.g.dart';

@immutable
@JsonSerializable()
class ItemPrices {
  const ItemPrices({
    required this.price,
    required this.diff1h,
    required this.diff24h,
  });

  factory ItemPrices.fromJson(Json json) => _$ItemPricesFromJson(json);

  final double price;

  @JsonKey(name: 'percent_change_1h')
  final double diff1h;

  @JsonKey(name: 'percent_change_24h')
  final double diff24h;

  Json toJson() => _$ItemPricesToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
