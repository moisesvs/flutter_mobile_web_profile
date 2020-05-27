import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterMobileWeb/repository/ProfileRepository.dart';
import 'package:meta/meta.dart';

import 'ProfileEvent.dart';
import 'ProfileState.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({@required ProfileRepository profileRepository})
      : assert(profileRepository != null),
        _profileRepository = profileRepository;

  @override
  ProfileState get initialState => ProfileLoading();

  Stream<ProfileState> _loadToState() async* {
    try {
      final profile = await _profileRepository.fetchProfile();
      if (profile != null) {
        yield ProfileLoaded(profile);
      } else {
        yield ProfileError("Error al recuperar el perfil del usuario");
      }
    } catch (_) {
      yield ProfileError("Error al recuperar el perfil del usuario");
    }
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event)  async* {
    if (event is LoadingPostEvent) {
      yield ProfileLoading();
      yield* _loadToState();
    }
  }
}