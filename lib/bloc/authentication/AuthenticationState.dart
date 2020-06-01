import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

  abstract class AuthenticationState extends Equatable {
    AuthenticationState([List props = const []]) : super();
  }

  @immutable
  class Uninitialized extends AuthenticationState {
    @override
    String toString() => 'Uninitialized';

    @override
    List<Object> get props => throw UnimplementedError();
  }

  @immutable
  class AuthenticationLoading extends AuthenticationState {
    @override
    String toString() => 'Authentication Loading';

    @override
    List<Object> get props => ['Authentication Loading'];
  }

  class Authenticated extends AuthenticationState {

    FirebaseUser user;

    Authenticated(this.user) : super([user]);

    @override
    String toString() => 'Authenticated { displayName: ${user.displayName}}';

    @override
    List<Object> get props => [user.displayName];
  }

  @immutable
  class Unauthenticated extends AuthenticationState {
    @override
    String toString() => 'Unauthenticated';

    @override
    List<Object> get props => ['Unauthenticated'];

  }