import 'package:flutter/material.dart';
import 'package:news_app/core/category_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            child:  TabBar(
              controller: controller,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              unselectedLabelStyle: const TextStyle(
                fontSize: 13.0,
                color: Colors.black
              ),
              labelStyle: const TextStyle(
                fontSize: 14,
                color: Colors.purple
              ),
              labelColor: Colors.white,
              tabs: CategoryList.categoryItems.map((e) => Tab(text: e,)).toList(),
              labelPadding: EdgeInsets.symmetric(horizontal: 3),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
                children: CategoryList.categoryItems.map((e)=> Text(e)).toList()),
          )
        ],
      ),
    );
  }
}
