import 'package:bloc/bloc.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogStateInitial()) {
    on<ShowDialog>((event, emit) {
      emit(DialogStateVisible(event.title, event.message));
    });
    on<HideDialog>((event, emit) {
      emit(DialogStateHidden());
    });
  }
}
