// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i9;
import 'application/restaurant/restaurant_bloc.dart' as _i7;
import 'application/settings/settings_bloc.dart' as _i8;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'domain/restaurant/I_restaurant_facade.dart' as _i5;
import 'infrastructure/auth/auth_facade.dart' as _i4;
import 'infrastructure/restaurant/restaurant_facade.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade());
  gh.lazySingleton<_i5.IRestaurantFacade>(() => _i6.RestaurantFacade());
  gh.factory<_i7.RestaurantBloc>(
      () => _i7.RestaurantBloc(get<_i5.IRestaurantFacade>()));
  gh.factory<_i8.SettingsBloc>(() => _i8.SettingsBloc());
  gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(get<_i3.IAuthFacade>()));
  return get;
}
