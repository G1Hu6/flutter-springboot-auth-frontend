import 'dart:io';

import 'package:complete_auth/features/auth/widgets/custom_text_field.dart';
import 'package:complete_auth/features/auth/widgets/sign_footer.dart';
import 'package:complete_auth/features/auth/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _enteredName = '';
  String _enteredEmail = '';
  String _enteredPassword = '';
  File? _pickedImage;
  final bool _isAuthnticate = false;

  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate() && _pickedImage != null) {
      _formKey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
      print(_enteredName);
      
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
              Text("Sign up now", style: myStyle.headlineLarge),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                "Please fill the details and create account",
                style: myStyle.titleSmall,
              ),
              const SizedBox(height: 20),
              UserImagePicker(
                onPickImage: (image) {
                  _pickedImage = image!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter valid name';
                    }

                    return null;
                  },
                  onSaved: (value) => _enteredName = value!,
                  hintText: "Leonardo Smith",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomTextField(
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter valid email';
                    }

                    return null;
                  },
                  onSaved: (value) => _enteredEmail = value!,
                  hintText: "www.xyz@gmail.com",
                ),
              ),
              CustomTextField(
                hintText: "Enter Pasword",
                validator: (value) {
                  if (value == null || value.trim().length < 6) {
                    return 'Password must be 6 characters long';
                  }

                  return null;
                },
                onSaved: (value) => _enteredPassword = value!,
                isHiddenPassword: true,
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              if (_isAuthnticate) const CircularProgressIndicator(),
              if (!_isAuthnticate)
                ElevatedButton(
                  onPressed: _onSubmit,
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              Text(
                "\n\nOr connect",
                style: myStyle.bodyLarge!.copyWith(
                  color: const Color.fromRGBO(112, 123, 129, 1),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: SignFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
