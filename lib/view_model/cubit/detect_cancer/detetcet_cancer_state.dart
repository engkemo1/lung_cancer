abstract class DetcetCancerMainState {}

class DetcetCancerInitialState extends DetcetCancerMainState{}


class DetcetCancerLoadingState extends DetcetCancerMainState{}
class DetcetCancerSuccessState extends DetcetCancerMainState{}

class DetcetCancerErrorState extends DetcetCancerMainState{
  final  error;

  DetcetCancerErrorState(this.error);
}
