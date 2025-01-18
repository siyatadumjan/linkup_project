import 'package:flutter_bloc/flutter_bloc.dart';

class AuthEvent {}

class AuthState {}

class AuthInitial extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Add your event handlers here
  }
}
