part of 'register_cubit.dart';

abstract class RegisterCubitState {}

class RegisterInitial extends RegisterCubitState {}

class RegisterLoading extends RegisterCubitState {}

class RegisterSuccess extends RegisterCubitState {}

class RegisterFailure extends RegisterCubitState {
  String errMessage;
  RegisterFailure({required this.errMessage});
}
