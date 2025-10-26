import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/feature/home/presentation/manager/cubit/task_cubit.dart';
import 'package:laptop/feature/cart/presentation/views/cart_view.dart';
import 'package:laptop/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:laptop/feature/home/presentation/views/widgets/product_list_view.dart';
import 'package:laptop/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  onTap(int page) {
    currentIndex = page;
    setState(() {});
  }

  List<Widget> views = [HomeViewBody(), favView(), CartView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        onTap: onTap,
        currentIndex: currentIndex,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      backgroundColor: Colors.blueGrey,
      body: views[currentIndex],
    );
  }
}

class favView extends StatelessWidget {
  const favView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskSuccess) {
          return Column(
            children: [
              Expanded(child: ProductListView(products: state.products)),
            ],
          );
        } else if (state is TaskFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
