import 'package:flutter/material.dart';
import 'package:laptop/feature/auth/presentation/views/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RegisterPageBody(),
      ),
    );
  }
}
