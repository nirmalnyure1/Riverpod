import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/infrastructure/repository/demo_api.dart';
import 'package:riverpod_example/application/states/demostate.dart';

class DemoNotifier extends StateNotifier<DemoState> {
  final DemoModelApi _apiojb;
  DemoNotifier(this._apiojb) : super(DemoInitial());

  Future<void> getData() async {
    try {
      state = DemoLoading();
      final demoData = await _apiojb.getApi();
      debugPrint("heu");
      state = DemoLoaded(demoData);
    } on DemoError {
      state = DemoError("error here");
      debugPrint(state.toString());
    }
  }
}
