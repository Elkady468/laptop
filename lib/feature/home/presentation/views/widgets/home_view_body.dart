import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/feature/home/presentation/manager/cubit/product_cubit.dart';
import 'package:laptop/feature/home/presentation/views/widgets/product_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return Column(
            children: [
              Expanded(child: ProductListView(products: state.products)),
            ],
          );
        } else if (state is ProductFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
