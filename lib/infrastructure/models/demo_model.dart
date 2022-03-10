class DemoModel {
  DemoModel({
    required this.message,
    required this.status,
  });
  late final String message;
  late final String status;

  DemoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}
