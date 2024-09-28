import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_router.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/core/cache_data.dart';
import 'package:news_app/screens/homeLayout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_app/screens/homeLayout/home_layout_cubit/home_layout_state.dart';
import 'core/observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ShareData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context,state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: context.watch<HomeLayoutCubit>().isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              onGenerateRoute: AppRouter().onGenerateRoute,
            initialRoute: AppStrings.layout,

          );
        },
      ),
    );
  }
}
