// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:app_demo_bloc_cubit/data/model/weather.dart';
import 'package:app_demo_bloc_cubit/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(
    this._weatherRepository,
  ) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      try {
        yield(WeatherLoading());
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield(WeatherLoaded(weather));
      } on NetworkException {
        yield(WeatherError("Couldn't fetch weather. Is the device online?"));
      }
    }
  }
}
