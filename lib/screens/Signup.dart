import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  Future<void> handleSignUp() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage("All fields are required");
      return;
    }

    if (password.length < 8) {
      _showMessage("Password must be at least 8 characters long");
      return;
    }

    RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      _showMessage("Password must include at least one letter and one number");
      return;
    }

    RegExp emailRegex = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
    if (!emailRegex.hasMatch(email)) {
      _showMessage("Invalid email format");
      return;
    }

    if (password != confirmPassword) {
      _showMessage("Passwords do not match");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse('http://192.168.100.8:3000/registerUser'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "email": email, "password": password}),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _showMessage("User registered successfully!");
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Navigator.pushReplacementNamed(context, '/homepage');
      } else {
        _showMessage(data['message'] ?? "Something went wrong");
      }
    } catch (error) {
      _showMessage("Failed to connect to the server");
    }

    setState(() {
      isLoading = false;
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(usernameController, "Username", Icons.person),
                SizedBox(height: 20),
                _buildTextField(emailController, "Email", Icons.email, keyboardType: TextInputType.emailAddress),
                SizedBox(height: 20),
                _buildTextField(passwordController, "Password", Icons.lock, isPassword: true),
                SizedBox(height: 20),
                _buildTextField(confirmPasswordController, "Confirm Password", Icons.lock, isPassword: true),
                SizedBox(height: 30),
                isLoading ? CircularProgressIndicator(color: Colors.amberAccent) : _buildSignUpButton(),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/login'),
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon, {bool isPassword = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: handleSignUp,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amberAccent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
      ),
      child: Text(
        "Sign Up",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
