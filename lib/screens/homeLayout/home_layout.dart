import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/category/category.dart';
import 'package:news_app/screens/home/homeScreen.dart';
import 'package:news_app/screens/homeLayout/home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News App"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<HomeLayoutCubit>(context).ChangeThemeMode();
              }, icon: context.watch<HomeLayoutCubit>().isDark
              ? const Icon(Icons.light_mode_outlined) : const Icon(Icons.nightlight_outlined))
        ],
      ),
      body: PageView(
        controller: pageController ,
        onPageChanged: (int index){
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
        },
        children: const [
          HomeScreen(),
          CategoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        currentIndex: context.watch<HomeLayoutCubit>().currentIndex,
        onTap: (int index){
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: AppStrings.home,tooltip: AppStrings.home,activeIcon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: AppStrings.category,tooltip: AppStrings.category,activeIcon: Icon(Icons.category_outlined)),
        ],
      ),
    );
  }
}
