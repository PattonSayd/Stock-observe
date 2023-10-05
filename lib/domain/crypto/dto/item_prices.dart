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
    this.currentPrice,
    this.change,
    this.percentChange,
    this.highestPriceOfTheDay,
    this.lowestPriceOfTheDay,
    this.openPriceOfTheDay,
    this.previousDayClosePrice,
    this.timestamp,
  });

  @JsonKey(name: 'c')
  final double? currentPrice;

  @JsonKey(name: 'd')
  final double? change;

  @JsonKey(name: 'dp')
  final double? percentChange;

  @JsonKey(name: 'h')
  final double? highestPriceOfTheDay;

  @JsonKey(name: 'l')
  final double? lowestPriceOfTheDay;

  @JsonKey(name: 'o')
  final double? openPriceOfTheDay;

  @JsonKey(name: 'pc')
  final double? previousDayClosePrice;

  @JsonKey(name: 't')
  final int? timestamp;

  factory ItemPrices.fromJson(Json json) => _$ItemPricesFromJson(json);

  Json toJson() => _$ItemPricesToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
