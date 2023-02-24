part of 'dialog_bloc.dart';

abstract class DialogEvent {
  const DialogEvent();
}

class ShowDialog extends DialogEvent {
  const ShowDialog(this.title, this.message);

  final String title;
  final String message;
}

class HideDialog extends DialogEvent {}
