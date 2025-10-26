import 'package:flutter/material.dart';
import 'package:laptop/core/api_service.dart';
import 'package:laptop/core/shared.dart';
import 'package:laptop/feature/auth/presentation/manager/Register_cubit/register_cubit.dart';
import 'package:laptop/feature/auth/presentation/manager/login_cubits/login_cubit.dart';
import 'package:laptop/feature/auth/presentation/views/login_page.dart';
import 'package:laptop/feature/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:laptop/feature/home/data/repo/home_repo_impl.dart';
import 'package:laptop/feature/home/presentation/manager/cubit/cubit/fav_cubit.dart';
import 'package:laptop/feature/home/presentation/manager/cubit/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:laptop/profile/data/api.dart';
import 'package:laptop/profile/presentation/manager/cubit/profile_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.init();

  runApp(const Laptop());
}

class Laptop extends StatelessWidget {
  const Laptop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductCubit(HomeRepoImpl(apiService: ApiService()))
                ..fetchProduct(),
        ),
        BlocProvider(create: (context) => FavCubit(ApiService())),
        BlocProvider(create: (context) => TaskCubit()..getFav()),
        BlocProvider(create: (context) => LoginCubit(ApiService())),
        BlocProvider(create: (context) => CartCubit()..fetshCart()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ProfileCubit(Api())..getProfile()),
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()),
    );
  }
}
