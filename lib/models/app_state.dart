import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final AuthState auth;

  AppState({AuthState auth}) : auth = auth ?? new AuthState();

  static AppState rehydrationJSON(dynamic json) => json != null
      ? new AppState(auth: new AuthState.fromJSON(json['auth']))
      : new AppState(auth: new AuthState());

  Map<String, dynamic> toJson() => {'auth': auth.toJSON()};

  AppState copyWith({
    bool rehydrated,
    AuthState auth,
  }) {
    return new AppState(auth: auth ?? this.auth);
  }

  @override
  String toString() {
    return '''AppState{
            auth: $auth,
        }''';
  }
}
