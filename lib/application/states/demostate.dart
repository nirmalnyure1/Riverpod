import 'package:riverpod_example/infrastructure/models/demo_model.dart';

abstract class DemoState {
  const DemoState();
}

class DemoInitial extends DemoState {
  const DemoInitial();
}

class DemoLoading extends DemoState {
  const DemoLoading();
}

class DemoLoaded extends DemoState {
  final DemoModel demoObj;
  final String username = "nirmal";
  final String email = "nirmal@gmail.com";
  DemoLoaded(this.demoObj);
  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  //
  //   return o is DemoLoaded && o.demoObj == demoObj;
  // }
  //
  // @override
  // int get hashCode => demoObj.hashCode;
}

class DemoError extends DemoState {
  final String message;
  DemoError(this.message);
  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  //   return o is DemoError && o.message == message;
  // }
  //
  // @override
  // // TODO: implement hashCode
  // int get hashCode => message.hashCode;
}
