part of 'news_bloc.dart';

abstract class NewsState{}

class NewsInitial extends NewsState {}

class HomeSuccessState extends NewsState{}

class HomeLoadingState extends NewsState{}

class HomeErrorsState extends NewsState{
  final String error;
  HomeErrorsState({required this.error});
}

