import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/homeLayout/home_layout.dart';


class AppRouter{
  Route onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_)=> BlocProvider(create: (BuildContext context) => NewsBloc()..add(HomeEvent()),
        child: const HomeLayout()));
      // case AppStrings.secondScreen:
      //   return MaterialPageRoute(builder: (_)=> const Secondscreen());

      default:
        return MaterialPageRoute(builder: (_)=> Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  "${AppStrings.noRoutes} ${settings.name}",
                ))
          ],
        )
      ));
    }
  }
}