import 'package:flutter_redux_boilerplate/middleware/middleware.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  final initialState = await persistor.load();

  return new Store(
    appReducer,
    initialState: initialState ?? AppState(),
    middleware: createMiddleware(),
  );
}
