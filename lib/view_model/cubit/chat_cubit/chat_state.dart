abstract class ChatMainState {}

class ChatInitialState extends ChatMainState{}


class GetChatLoadingState extends ChatMainState{}
class GetChatSuccessState extends ChatMainState{}

class GetChatErrorState extends ChatMainState{
  final  error;

  GetChatErrorState(this.error);
}
class AddMessageLoadingState extends ChatMainState{}
class AddMessageSuccessState extends ChatMainState{}

class AddMessageErrorState extends ChatMainState{
  final  error;

  AddMessageErrorState(this.error);
}
class GetMessageLoadingState extends ChatMainState{}
class GetMessageSuccessState extends ChatMainState{}

class GetMessageErrorState extends ChatMainState{
  final  error;

  GetMessageErrorState(this.error);
}
