part of 'theme_bloc.dart';

enum AppThemes {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppThemes appThemes;

  const ThemeState({
    this.appThemes = AppThemes.light,
  });

  @override
  List<Object> get props => [appThemes];

  ThemeState copyWith({
    AppThemes? appThemes,
  }) {
    return ThemeState(
      appThemes: appThemes ?? this.appThemes,
    );
  }

  @override
  String toString() => 'ThemeState(appThemes: $appThemes)';
}
