import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_failure.freezed.dart';

@freezed
class RestaurantFailure with _$RestaurantFailure {
  const factory RestaurantFailure.serverError(String error) = ServerError;
}
