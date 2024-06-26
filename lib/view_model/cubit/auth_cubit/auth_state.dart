abstract class AuthMainState {}

class AuthMainInitialState extends AuthMainState{}


class LoginLoadingState extends AuthMainState{}
class LoginSuccessState extends AuthMainState{}

class LoginErrorState extends AuthMainState{
  final  error;

  LoginErrorState(this.error);
}
class RegisterLoadingState extends AuthMainState{}
class RegisterSuccessState extends AuthMainState{}

class RegisterErrorState extends AuthMainState{
  final  error;

  RegisterErrorState(this.error);
}