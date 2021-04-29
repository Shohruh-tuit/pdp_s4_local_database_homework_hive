class User {
  String username;
  String password;

  User({this.username, this.password});

  // Stringa o'tkazish uchun standart 2 ta funksiya

  // Jsondan olib oladi Stringa o'tkazadi
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  // String dan olib oladi Jsonga o'tkazadi
  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
