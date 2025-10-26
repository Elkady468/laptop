import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptop/core/utils/function/show_snak_bar.dart';
import 'package:laptop/feature/auth/presentation/manager/Register_cubit/register_cubit.dart';
import 'package:laptop/feature/auth/presentation/views/login_page.dart';
import 'package:laptop/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:laptop/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:laptop/feature/home/presentation/views/home_view.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  String? name, email, phoneNumber, password, image, id, gender;
  ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  addImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    imageFile = File(image!.path);
    setState(() {});
  }

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
            SizedBox(height: 100),
            imageFile == null
                ? Text("data")
                : SizedBox(height: 300, child: Image.file(imageFile!)),
            Center(
              child: IconButton(
                onPressed: addImage,
                icon: Icon(Icons.photo, size: 30),
              ),
            ),
            //   SvgPicture.asset("assets/photos/foodLogo.svg"),
            Customtextfield(
              hint: "Full Name",
              icon: Icons.person,
              onChanged: (value) {
                name = value;
              },
            ),
            Customtextfield(
              hint: "Valied Email",
              icon: Icons.email,
              onChanged: (value) {
                email = value;
              },
            ),
            Customtextfield(
              maxLength: true,
              hint: "Phone Number",
              maxlength: 11,
              icon: Icons.phone_iphone_outlined,
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            Customtextfield(
              maxLength: true,
              maxlength: 14,
              hint: "National Id",
              icon: Icons.phone_iphone_outlined,
              onChanged: (value) {
                id = value;
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
              },
            ),
            // Customtextfield(
            //   hint: "Image",
            //   icon: Icons.person,
            //   onChanged: (value) {
            //     image = value;
            //   },
            // ),
            Customtextfield(
              hint: "Gender",
              icon: Icons.person,
              onChanged: (value) {
                gender = value;
              },
            ),

            SizedBox(height: 50),
            BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  if (state.message == "Email already registered") {
                    ShowSnakBar(context, state.message, color: Colors.green);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  } else if (state.message == "User registered successfully") {
                    ShowSnakBar(context, state.message, color: Colors.green);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  } else {
                    ShowSnakBar(context, state.message, color: Colors.red);
                  }
                }
              },
              child: CustomButton(
                label: "Register",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context).RegisterUser(
                      email: email!,
                      password: password!,
                      name: name!,
                      phoneNumber: phoneNumber!,
                      image: imageFile!.path,
                      id: id!,
                      gender: gender!,
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member ",
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
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login",
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

  //   Future<void> RegisterUser() async {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );
}

String defaultImage =
    "data:image/jpeg;base64,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";
