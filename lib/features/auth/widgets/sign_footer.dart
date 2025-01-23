import 'package:flutter/material.dart';

class SignFooter extends StatelessWidget {
  const SignFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
           
          },
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Image.asset("assets/images/google.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Image.asset("assets/images/apple.png"),
        ),
      ],
    );
  }
}
