import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdp_s4_homework2_local_database/models/user_model.dart';
import 'package:pdp_s4_homework2_local_database/pages/account_page.dart';
import 'package:pdp_s4_homework2_local_database/services/db_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String username = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User(username: username, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser(user);

    print(user2.username);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // to'liq ekran qilish uchun
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.teal[800], Colors.teal[700], Colors.teal[300]],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage("assets/images/user1.jpg"),
                ),
              ),
            ),

            // #login, #welcome
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  ),
                  Text(
                    "Sing In",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        // #email, #password
                        // ****************************************************************
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                hintText: " enter e-mail",
                                hintStyle: TextStyle(color: Colors.grey[300]),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: "Enter assword",
                                hintStyle: TextStyle(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ****************************************************************
                        SizedBox(height: 30),
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 30),

                        // #login
                        GestureDetector(
                          onTap: _doLogin,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.teal[500],
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.grey[400],
                              height: 1,
                              width: 150,
                            ),
                            Text(
                              " OR ",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[400]),
                            ),
                            Container(
                              color: Colors.grey[400],
                              height: 1,
                              width: 150,
                            ),
                          ],
                        ),

                        SizedBox(height: 50),

                        // # Facebook, #twitter  instagram
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesome.facebook,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 40),
                            Icon(
                              FontAwesome.twitter,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 40),
                            Icon(
                              FontAwesome.instagram,
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AccountPage.id);
                              },
                              child: Text(
                                " SignUp",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
