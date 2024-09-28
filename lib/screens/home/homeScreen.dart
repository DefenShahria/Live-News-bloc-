import 'package:flutter/material.dart';
import 'package:news_app/core/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.height *0.3,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(image: NetworkImage(AppStrings.newsImage),
                fit: BoxFit.cover
                )
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.7)
                  ),
                  child: Text("Title${index}",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          );
        });
  }
}
