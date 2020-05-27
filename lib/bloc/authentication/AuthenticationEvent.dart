import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent() : super();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<String> get props => ['AppStarted'];
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';

  @override
  List<String> get props => ['LoggedIn'];
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
  
  @override
  List<String> get props => ['LoggedOut'];
}