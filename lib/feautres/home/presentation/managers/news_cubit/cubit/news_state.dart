part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitialState extends NewsState {}
final class NewsChangeIndexState extends NewsState {}
