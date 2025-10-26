import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/core/shared.dart';
import 'package:laptop/core/utils/function/show_snak_bar.dart';
import 'package:laptop/feature/auth/presentation/manager/login_cubits/login_cubit.dart';
import 'package:laptop/feature/auth/presentation/manager/login_cubits/login_state.dart';
import 'package:laptop/feature/auth/presentation/views/register_page.dart';
import 'package:laptop/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:laptop/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:laptop/feature/home/presentation/views/home_view.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  String? name, email, phoneNumber, password;

  bool isLoading = false;

  bool isScureText = true;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            //   SvgPicture.asset("assets/photos/foodLogo.svg"),
            Customtextfield(
              hint: "Email",
              icon: Icons.email,
              onChanged: (value) {
                email = value;
              },
            ),
            Customtextfield(
              onTapSuffixIcon: () {
                isScureText = !isScureText;
                setState(() {});
              },
              obscureText: isScureText,
              hint: "Password",
              icon: isScureText ? Icons.visibility_off : Icons.visibility,
              onChanged: (value) {
                password = value;
                Shared.setString(key: "Password", value: value);
              },
            ),
            SizedBox(height: 50),
            SizedBox(height: MediaQuery.sizeOf(context).height * .15),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  if (state.data["status"] == "error") {
                    ShowSnakBar(
                      context,
                      state.data["message"],
                      color: Colors.red,
                    );
                  }
                  if (state.data["status"] == "success") {
                    ShowSnakBar(
                      context,
                      state.data["message"],
                      color: Colors.green,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
                        },
                      ),
                    );
                  }
                }
              },
              builder: (context, state) {
                return CustomButton(
                  label: "Login",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(
                        context,
                      ).LoginUser(email: email!, password: password!);
                    }
                  },
                );
              },
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xff0A2527),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
