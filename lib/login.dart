import 'package:flutter/material.dart';
import 'admin/home.dart';  // Ensure you have a Home screen defined
import 'signup.dart';  // Ensure you have a SignUp screen defined
import 'forgot_password.dart';  // Ensure you have a ForgotPassword screen defined

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void userLogin() {
    // Check if email and password are valid (replace with your authentication logic)
    // For demonstration purposes, check if both fields are non-empty
    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenSmall()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Invalid Credentials",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/logintitle.gif",
                height: 75,
                width: 200,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter E-mail';
                          }
                          return null;
                        },
                        controller: mailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = mailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF273671),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                );
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xFF8c8e98),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "or LogIn with",
              style: TextStyle(
                color: Color(0xFF273671),
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add your Google login method here
                  },
                  child: Image.asset(
                    "images/google.png",
                    height: 45,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Add your Apple login method here
                //   },
                //   child: Image.asset(
                //     "images/apple1.png",
                //     height: 50,
                //     width: 50,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0xFF8c8e98),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Color(0xFF273671),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
