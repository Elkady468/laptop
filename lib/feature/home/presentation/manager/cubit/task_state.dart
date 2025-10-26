part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<ProductModel> products;

  const TaskSuccess({required this.products});
}

final class TaskLoading extends TaskState {}

final class TaskFailure extends TaskState {
  final String errMessage;

  const TaskFailure({required this.errMessage});
}
