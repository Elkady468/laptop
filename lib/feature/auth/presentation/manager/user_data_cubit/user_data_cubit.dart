// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:laptop/feature/auth/data/model/user_data_model.dart';

// part 'user_data_state.dart';

// class UserDataCubit extends Cubit<UserDataState> {
//   UserDataCubit() : super(UserDataInitial());
//   late UserDataModel userDataModel;
//   Future<void> getUserData() async {
//     emit(UserDataLoading());
//     try {
//       String uid = FirebaseAuth.instance.currentUser!.uid;

//       DocumentSnapshot<Map<String, dynamic>> userData =
//           await FirebaseFirestore.instance.collection("users").doc(uid).get();
//       userDataModel = UserDataModel.fromJson(userData);
//       emit(UserDataSuccess(userDataModel: userDataModel));
//     } catch (e) {
//       emit(UserDataFailure(errMessage: "Error getting user data: $e"));
//     }
//   }
// }
