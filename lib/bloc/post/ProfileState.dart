import 'package:equatable/equatable.dart';
import 'package:flutterMobileWeb/data/Profile.dart';
import 'package:meta/meta.dart';

  @immutable
  abstract class ProfileState extends Equatable {
    ProfileState([List props = const []]) : super();
  }

  class ProfileLoading extends ProfileState {
    @override
    String toString() => 'Profile Loading';

    @override
    List<Object> get props => ['Profile Loading'];
  }

  class ProfileLoaded extends ProfileState {
    final Profile profile;

    ProfileLoaded(this.profile) : super([profile]);

    @override
    String toString() => 'Profile { profile: $profile}';

    @override
    List<Object> get props => [profile];
  }

  class ProfileError extends ProfileState {
    final String error;

    ProfileError(this.error) : super([error]);

    @override
    String toString() => 'Profile Error{ error: $error}';

    @override
    List<Object> get props => [error];
  }