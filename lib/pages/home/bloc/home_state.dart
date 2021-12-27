import 'package:green_notes/models/app_models.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSucceful extends HomeState {
  final Future<List<GreenContent>> folders;

  HomeLoadingSucceful({
    required this.folders,
  });


}

class HomeLoadingFailed extends HomeState {
  final Error err;
  HomeLoadingFailed({required this.err});
}
