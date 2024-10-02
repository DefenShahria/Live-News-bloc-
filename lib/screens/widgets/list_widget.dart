import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';


class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
  builder: (context, state) {
    final news = context.watch<NewsBloc>().news;
    if(state is HomeLoadingState){
      return const Center(child: CircularProgressIndicator(),);
    }else if(state is HomeErrorsState){
      return Center(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(state.error,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),);
    }
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.height *0.3,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage("${news[index].urlToImage}"),
                      fit: BoxFit.cover
                  )
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.7)
                  ),
                  child: Text("${news[index].title}",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          );
        });
  },
);
  }
}
