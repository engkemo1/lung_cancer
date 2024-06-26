abstract class HomeMainState {}

class HomeMainInitialState extends HomeMainState{}


class DoctorLoadingState extends HomeMainState{}
class DoctorSuccessState extends HomeMainState{}

class DoctorErrorState extends HomeMainState{
  final  error;

  DoctorErrorState(this.error);
}
