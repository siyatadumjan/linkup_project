import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) {
      emit(LoginLoading());
      // Simulating login process
      Future.delayed(Duration(seconds: 2), () {
        if (event.username == 'admin' && event.password == 'password') {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: 'Invalid username or password'));
        }
      });
    });
  }
}
