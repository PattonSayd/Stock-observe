// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPrices _$ItemPricesFromJson(Map<String, dynamic> json) => ItemPrices(
      currentPrice: (json['c'] as num?)?.toDouble(),
      change: (json['d'] as num?)?.toDouble(),
      percentChange: (json['dp'] as num?)?.toDouble(),
      highestPriceOfTheDay: (json['h'] as num?)?.toDouble(),
      lowestPriceOfTheDay: (json['l'] as num?)?.toDouble(),
      openPriceOfTheDay: (json['o'] as num?)?.toDouble(),
      previousDayClosePrice: (json['pc'] as num?)?.toDouble(),
      timestamp: json['t'] as int?,
    );

Map<String, dynamic> _$ItemPricesToJson(ItemPrices instance) =>
    <String, dynamic>{
      'c': instance.currentPrice,
      'd': instance.change,
      'dp': instance.percentChange,
      'h': instance.highestPriceOfTheDay,
      'l': instance.lowestPriceOfTheDay,
      'o': instance.openPriceOfTheDay,
      'pc': instance.previousDayClosePrice,
      't': instance.timestamp,
    };
