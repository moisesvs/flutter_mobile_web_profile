import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent() : super();
}

class LoggedIn extends AuthenticationEvent {

  String email;
  String password;

  LoggedIn (this.email, this.password);

  @override
  String toString() => 'LoggedIn: $email y $password';

  @override
  List<String> get props => ['LoggedIn'];
}

@immutable
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
  
  @override
  List<String> get props => ['LoggedOut'];
}