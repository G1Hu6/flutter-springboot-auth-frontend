import 'package:complete_auth/features/auth/screens/signup_screen.dart';
import 'package:complete_auth/features/auth/widgets/custom_text_field.dart';
import 'package:complete_auth/features/auth/widgets/sign_footer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _enteredEmail = '';
  String _enteredPassword = '';
  final bool _isAuthnticate = false;

  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
     
    }
  }


  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 140),
              Text("Sign in now", style: myStyle.headlineLarge),
              const SizedBox(height: 10),
              Text(
                "Please sign in to continue our app",
                style: myStyle.titleSmall,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextField(
                  hintText: "www.xyz@gmail.com",
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter valid email';
                    }

                    return null;
                  },
                  onSaved: (value) => _enteredEmail = value!.trim(),
                ),
              ),
              CustomTextField(
                hintText: "Enter Password",
                isHiddenPassword: true,
                validator: (value) {
                  if (value == null || value.trim().length < 6) {
                    return 'Password must be 6 characters long';
                  }

                  return null;
                },
                onSaved: (value) => _enteredPassword = value!.trim(),
                icon: Icon(Icons.remove_red_eye_outlined,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(160, 10, 0, 40),
                child: GestureDetector(
                  onTap: _isAuthnticate
                      ? null
                      : () {
                         
                        },
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.right,
                    style: myStyle.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _isAuthnticate ? null : _onSubmit,
                child: _isAuthnticate
                    ? const CircularProgressIndicator()
                    : Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don’t have an account?",
                  style: myStyle.bodyLarge!.copyWith(
                    color: const Color.fromRGBO(112, 123, 129, 1),
                  ),
                  children: [
                    TextSpan(
                      text: " Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = _isAuthnticate
                            ? null
                            : () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SignupScreen();
                                    },
                                  ),
                                );
                              },
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const TextSpan(text: "\n\nOr connect"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: _isAuthnticate
                    ? const CircularProgressIndicator()
                    : const SignFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
