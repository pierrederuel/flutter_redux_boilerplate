import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/actions/auth_actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/user.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAuthMiddleware() => <Middleware<AppState>>[
      new TypedMiddleware<AppState, UserLoginRequest>(logIn),
    ];

final logIn = _login();

Middleware<AppState> _login() {
  return (Store store, action, NextDispatcher next) async {
    if (action is UserLoginRequest) {
      if (action.username == 'asd' && action.password == 'asd') {
        store.dispatch(new UserLoginSuccess(
            new User('placeholder_token', 'placeholder_id')));
        Navigator.of(action.context)
            .pushNamedAndRemoveUntil('/main', (_) => false);
      } else {
        store.dispatch(
            new UserLoginFailure('Username or password were incorrect.'));
      }
    }

    next(action);
  };
}
