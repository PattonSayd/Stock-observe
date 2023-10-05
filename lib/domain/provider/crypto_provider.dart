import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../crypto/dto/item_prices.dart';
import '../crypto/dto/stock_item.dart';

part 'crypto_provider.g.dart';

@RestApi(baseUrl: 'https://finnhub.io/api/v1/')
abstract class CryptoProvider {
  factory CryptoProvider(Dio dio, {String? baseUrl}) = _CryptoProvider;

  @GET('stock/symbol')
  Future<List<StockItem>> fetchListOfStocks({
    @Query('token') required String token,
    @Query('exchange') required String exchange,
  });

  @GET('/quote')
  Future<ItemPrices> fetchStockItemPrices({
    @Query('token') required String token,
    @Query('symbol') required String symbol,
  });
}
