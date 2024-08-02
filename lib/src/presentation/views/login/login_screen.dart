import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/theme.dart';
import 'package:mvvm_demo/src/presentation/view_models/login_provider.dart';
import 'package:mvvm_demo/src/presentation/views/common_widgets/appbar.dart';
import 'package:mvvm_demo/src/presentation/views/common_widgets/toast_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final Map loginData;
  const LoginScreen({super.key, required this.loginData});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _loginProvider = Provider.of<LoginProvider>(context);

    _userNameController.text = "eve.holt@reqres.in";
    _passwordController.text = "cityslicka";
    return Scaffold(
      appBar: appHeaders("Login"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Username"),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor))),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Password"),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor))),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () {
                    if (_userNameController.text.isEmpty) {
                      showCommonToast("Provide username");
                    } else if (_passwordController.text.isEmpty) {
                      showCommonToast("Provide password");
                    } else {
                      _loginProvider.handleUserLogin(_userNameController.text,
                          _passwordController.text, context);
                    }
                  },
                  child: _loginProvider.isLoading
                      ? const SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: CircularProgressIndicator(
                              color: Colors.purple))
                      : const Text("Login")),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
