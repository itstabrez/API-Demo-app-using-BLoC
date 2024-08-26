import 'package:flutter/material.dart';
import 'package:flutter_api_using_bloc_1/home/ui/home_page.dart';
import 'package:flutter_api_using_bloc_1/login/bloc/login_bloc.dart';
import 'package:flutter_api_using_bloc_1/navigation/routes_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginBloc
        .close(); // Don't forget to close the bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // Navigate to the home page on success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login Success")),
          );
          Navigator.pushNamed(context, Routes.screenHomePage);
        } else if (state is LoginFailureState) {
          // Show a snackbar or dialog on failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    loginBloc.add(LoginEmailTrackerEvent(email: value));
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    loginBloc.add(LoginPasswordTrackerEvent(password: value));
                  },
                ),
                const SizedBox(height: 20),
                if (state is LoginLoadingState)
                  const CircularProgressIndicator() // Show the loading indicator instead of the button
                else
                  ElevatedButton(
                    onPressed: () {
                      loginBloc.add(LoginApiEvent()); // Trigger the login event
                    },
                    child: const Text("Login Now"),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
