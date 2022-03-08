class PingTime {
  String? ip;
  Duration? time;

  PingTime({this.ip, this.time});

  PingTime.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ip'] = ip;
    data['time'] = time;
    return data;
  }
}
