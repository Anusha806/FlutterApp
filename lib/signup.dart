import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registration() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Use SingleChildScrollView to avoid overflow
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('images/signup.png'),
                height: 75,
                width: 200,
              ),
              // Image.asset(
              //   "assets/google.png", // Use local image
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
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
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
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
                    SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = mailController.text;
                            name = nameController.text;
                            password = passwordController.text;
                          });
                          registration();
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
                            "Sign Up",
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
            SizedBox(height: 40.0),
            Text(
              "or LogIn with",
              style: TextStyle(
                color: Color(0xFF273671),
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/googleicon1.png", // Use local image
                  height: 65,
                  width: 75,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30.0),
                Image.asset(
                  "images/fbicon.jpg", // Use local image
                  height: 70,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xFF8c8e98),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to the login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  child: Text(
                    "LogIn",
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
