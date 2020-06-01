import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterMobileWeb/repository/AuthRepository.dart';
import 'package:meta/meta.dart';

import 'AuthenticationEvent.dart';
import 'AuthenticationState.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;
  FirebaseUser user;

  AuthenticationBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  Stream<AuthenticationState> _loginEvent({
    String email,
    String password,
  }) async* {
    yield AuthenticationLoading();
    try {
      _authRepository.app ?? await _authRepository.configure();
      AuthResult result = await _authRepository.signInWithCredentials(email: email, 
                                                                      password: password);

      this.user = await _authRepository.getUser();
      if (user.displayName == null) {
        await _authRepository.updateProfile();
      }
      yield Authenticated(result.user);
    } catch (_) {
      yield Unauthenticated();
    }
  }
  
  Stream<AuthenticationState> _logoutEvent() async* {
    yield Unauthenticated();
    _authRepository.signOut();
  }

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event)  async* {
    if (event is LoggedIn) {
      print("Login: ${event.email} y ${event.password}");
      yield* _loginEvent(email : event.email,
                                      password: event.password);
    } else if (event is LoggedOut) {
      yield* _logoutEvent();
    }
  }

}