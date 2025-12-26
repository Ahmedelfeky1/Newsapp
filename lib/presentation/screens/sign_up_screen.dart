import 'package:flutter/material.dart';
import '../../data/model/cache_user_repo.dart';
import '../../data/model/user_model.dart';
import '../widget/custom_elvat_bt.dart';
import '../widget/custom_row_data.dart';
import '../widget/custom_text_field.dart';
import 'login_screen.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswardController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                SizedBox(height: 100),
                Center(
                  child: Image(image: AssetImage("assets/images/logo_app.png")),
                ),
                SizedBox(height: 50),
                Text(
                  "Welcome to Newts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times",
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: "Email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains("@")) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: "Password",
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: "Confirm Passward",
                  controller: confirmPasswardController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                CustomElvatBt(
                  text: "Sign Up",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      UserModel user = UserModel(
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswardController.text,
                      );
                      CacheUserRepo.saveUser(user);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30),
                CustomRowData(
                  text: "Have an account ?",
                  textButton: "Login",
                  screenName: LoginScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
