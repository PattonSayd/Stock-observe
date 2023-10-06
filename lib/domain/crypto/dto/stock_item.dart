import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stock_observe/domain/provider/coin_market_cap_ids.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';
import 'package:stock_observe/service/types/types.dart';

part 'stock_item.g.dart';
/*
[
  {
        "id": "bitcoin",
        "symbol": "btc",
        "name": "Bitcoin",
        "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        "current_price": 27948,
        "market_cap": 539374701137,
        "market_cap_rank": 1,
        "fully_diluted_valuation": 580693653908,
        "total_volume": 13676376750,
        "high_24h": 28013,
        "low_24h": 27243,
        "price_change_24h": 329.05,
        "price_change_percentage_24h": 1.1914,
        "market_cap_change_24h": -2833189082.1949463,
        "market_cap_change_percentage_24h": -0.52253,
        "circulating_supply": 19505756.0,
        "total_supply": 21000000.0,
        "max_supply": 21000000.0,
        "ath": 69045,
        "ath_change_percentage": -59.56428,
        "ath_date": "2021-11-10T14:24:11.849Z",
        "atl": 67.81,
        "atl_change_percentage": 41072.62972,
        "atl_date": "2013-07-06T00:00:00.000Z",
        "roi": null,
        "last_updated": "2023-10-06T16:01:27.096Z",
        "price_change_percentage_24h_in_currency": 1.1914036595603459
    },
]

*/

@immutable
@JsonSerializable()
class StockItem {
  const StockItem({
    required this.name,
    required this.symbol,
    required this.price,
    required this.priceDiffInPercents,
  });

  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String symbol;
  @JsonKey(name: 'current_price', defaultValue: 0)
  final double price;
  @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
  final double priceDiffInPercents;

  bool get isValid =>
      name != '' && symbol != '' && price != 0 && priceDiffInPercents != 0;

  String imageUrl(int size) {
    assert(size > 0 && size < 250);
    final int id = coinMarketCapIds[symbol.toUpperCase()] ?? 1;
    return 'https://s2.coinmarketcap.com/static/img/coins/${size}x$size/$id.png';
  }

  factory StockItem.fromJson(Json json) => _$StockItemFromJson(json);

  Json toJson() => _$StockItemToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
