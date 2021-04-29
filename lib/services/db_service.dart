import 'package:hive/hive.dart';
import 'package:pdp_s4_homework2_local_database/models/user_model.dart';

class HiveDB {
  var box = Hive.box("static_online");

  // For User object
  // User degan obyektni boxga saqlab beradi
  void storeUser(User user) async {
    box.put("user", user.toJson());
  }

  // Userni database dan qayta o'qib olish
  User loadUser(User user) {
    var user = new User.fromJson(box.get("user"));

    return user;
  }

  void removeUser() {
    box.delete("user");
  }

  // For Account object
  void storeAccount(User user) async {
    box.put("user", user.toJson());
  }

  // Userni database dan qayta o'qib olish
  User loadAccount(User user) {
    var user = new User.fromJson(box.get("user"));

    return user;
  }

  void removeAccount() {
    box.delete("user");
  }
}
