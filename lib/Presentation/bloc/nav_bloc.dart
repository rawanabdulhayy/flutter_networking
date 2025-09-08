import 'package:bloc/bloc.dart';
import 'nav_event.dart';
import 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState(selectedIndex: 0)) {
    on<NavItemSelected>((event, emit) {
      // emit(NavState(selectedIndex: state.selectedIndex));
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
