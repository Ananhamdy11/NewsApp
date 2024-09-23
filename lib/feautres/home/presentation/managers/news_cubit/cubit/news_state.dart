part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitialState extends NewsState {}
final class NewsChangeIndexState extends NewsState {}
final class NewsLoadingBusinessState extends NewsState {}
final class NewsSuccessBusinessState extends NewsState {
 final List<NewsModel> news;
 NewsSuccessBusinessState(this.news);
}
final class NewsFailureBussinessState extends NewsState {
  final String error;
  NewsFailureBussinessState(this.error);
}

final class NewsSuccessEntertainState extends NewsState {
 final List<NewsModel> news;
 NewsSuccessEntertainState(this.news);
}
final class NewsFailureEntertainState extends NewsState {
  final String error;
  NewsFailureEntertainState(this.error);
}

final class NewsLoadingEntertainState extends NewsState {}


final class NewsSuccessSportsState extends NewsState {
 final List<NewsModel> news;
 NewsSuccessSportsState(this.news);
}
final class NewsFailureSportsState extends NewsState {
  final String error;
  NewsFailureSportsState(this.error);
}

final class NewsLoadingSportsState extends NewsState {}

final class NewsAppModeState extends NewsState {}
