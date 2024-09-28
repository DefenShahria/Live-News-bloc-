import 'package:bloc/bloc.dart';
import 'package:news_app/core/cache_data.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/homeLayout/home_layout_cubit/home_layout_state.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutState>{
  HomeLayoutCubit():super(HomeLayoutInitialState());

  bool isDark = ShareData.getData(key: AppStrings.appTheme) ?? false;

  void ChangeThemeMode(){
    isDark = ! isDark;
    ShareData.saveData(key: AppStrings.appTheme, value: isDark);
    emit(ChangeThemeModeState());
  }

  int currentIndex = 0;
  void changeNavBar({required int index}){

    currentIndex = index;
    emit(ChangeNavbarState());
  }

}