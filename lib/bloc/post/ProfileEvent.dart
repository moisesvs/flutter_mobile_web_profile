import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent() : super();
}

class LoadingPostEvent extends ProfileEvent {
  @override
  String toString() => 'LoadingPost';

  @override
  List<String> get props => ['LoadingPost'];
}