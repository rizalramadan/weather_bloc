import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../constants/constans.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeOnTemp>(_themeOnTemp);
  }

  void _themeOnTemp(ThemeOnTemp event, Emitter<ThemeState> emit) {
    if (event.temp > kHotOrNot) {
      emit(state.copyWith(appThemes: AppThemes.light));
    } else {
      emit(state.copyWith(appThemes: AppThemes.dark));
    }
  }
}
