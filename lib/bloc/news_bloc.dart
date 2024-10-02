import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app/data/newsModel.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsModel> news = [];

  NewsBloc() : super(NewsInitial()) {
    on<HomeEvent>((event, emit) async{
      //Loading State
      emit(HomeLoadingState());
      Dio dio = Dio();
      try{
        final response = await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=516b075aac294ca1a8067d805dc7dab0&category=sports");
        if(response.statusCode == 200){
          news = response.data['articles'].map<NewsModel>((news)=> NewsModel.fromJson(news)).toList();
          emit(HomeSuccessState());

          print("Data is ok");
        }
      }on DioException catch (error){
        emit(HomeErrorsState(error: error.toString()));
      }
    });
  }
}
