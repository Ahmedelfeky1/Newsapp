part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class NewsLoading extends NewsState{}
final class NewsSuccess extends NewsState{}
final class NewsError extends NewsState{
  String message;
  NewsError(this.message);
}
