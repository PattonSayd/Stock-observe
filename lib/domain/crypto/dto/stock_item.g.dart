// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockIItem _$StockIItemFromJson(Map<String, dynamic> json) => StockIItem(
      currency: json['currency'] as String,
      description: json['description'] as String,
      displaySymbol: json['displaySymbol'] as String,
      figi: json['figi'] as String,
      mic: json['mic'] as String,
      symbol: json['symbol'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$StockIItemToJson(StockIItem instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'description': instance.description,
      'displaySymbol': instance.displaySymbol,
      'figi': instance.figi,
      'mic': instance.mic,
      'symbol': instance.symbol,
      'type': instance.type,
    };
