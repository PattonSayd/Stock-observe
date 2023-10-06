import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../crypto/dto/stock_item.dart';

part 'crypto_provider.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3/')
abstract class CryptoProvider {
  factory CryptoProvider(Dio dio, {String? baseUrl}) = _CryptoProvider;

  @GET('coins/markets')
  Future<List<StockItem>> fetchLatestData({
    @Query('vs_currency') String currency = 'usd',
    @Query('order') String order = 'market_cap_desc',
    @Query('per_page') int perPage = 1000,
    @Query('page') int page = 1,
    @Query('price_change_percentage') String priceChangePercentage = '24h',
  });
}
