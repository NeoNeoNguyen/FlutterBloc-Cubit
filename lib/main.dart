// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import, use_key_in_widget_constructors

import 'package:app_demo_bloc_cubit/bloc/weather_bloc.dart';
import 'package:app_demo_bloc_cubit/cubit/weather_cubit.dart';
import 'package:app_demo_bloc_cubit/data/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      home: BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}





