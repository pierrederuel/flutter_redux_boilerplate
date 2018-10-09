import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/auth_state.dart';
import 'package:redux/redux.dart';

class NewsTab extends StatelessWidget {
  NewsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
      _ViewModel vm = _ViewModel.fromStore(store);
      return vm;
    }, builder: (BuildContext context, vm) {
      return new Center(
        child: new Text('isAuthenticated: ' + vm.auth.user.token),
      );
    });
  }
}

class _ViewModel {
  final AuthState auth;

  _ViewModel({
    @required this.auth,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(auth: store.state.auth);
  }
}
