class Message {
  String? username;
  String? msg;

  Message({this.username, this.msg});

  Message.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['msg'] = this.msg;
    return data;
  }
}