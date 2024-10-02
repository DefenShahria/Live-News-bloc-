import 'package:flutter/material.dart';
import 'package:news_app/core/app_strings.dart';
import 'package:news_app/screens/widgets/list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const NewsList();
  }
}
