part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeOnTemp extends ThemeEvent {
  final double temp;

  const ThemeOnTemp({
    required this.temp,
  });

  @override
  List<Object> get props => [temp];
}
