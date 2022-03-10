import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/infrastructure/repository/demo_api.dart';
import 'package:riverpod_example/application/notifiers/demo_notifier.dart';
import 'package:riverpod_example/application/states/demostate.dart';

final api = Provider((ref) => DemoModelApi());
final demoProvider = StateNotifierProvider<DemoNotifier, DemoState>(
    (ref) => DemoNotifier(ref.watch(api)));
