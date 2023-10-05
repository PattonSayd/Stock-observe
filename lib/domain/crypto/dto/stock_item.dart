import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';
import 'package:stock_observe/service/types/types.dart';

part 'stock_item.g.dart';

/*
{
  "currency": "USD",
  "description": "ENVIRONMENTAL CONTROL CORP",
  "displaySymbol": "EVCC",
  "figi": "BBG000HWWS67",
  "mic": "OOTC",
  "symbol": "EVCC",
  "type": "Common Stock"
}
 */

@immutable
@JsonSerializable()
class StockIItem {
  const StockIItem({
    required this.currency,
    required this.description,
    required this.displaySymbol,
    required this.figi,
    required this.mic,
    required this.symbol,
    required this.type,
  });

  final String currency;
  final String description;
  final String displaySymbol;
  final String figi;
  final String mic;
  final String symbol;
  final String type;

  factory StockIItem.fromJson(Json json) => _$StockIItemFromJson(json);

  Json toJson() => _$StockIItemToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
