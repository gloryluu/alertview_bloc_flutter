part of 'dialog_bloc.dart';

abstract class DialogState {
  const DialogState();
}

class DialogStateInitial extends DialogState {}

class DialogStateHidden extends DialogState {}

class DialogStateVisible extends DialogState {
  const DialogStateVisible(this.title, this.message);

  final String title;
  final String message;
}
