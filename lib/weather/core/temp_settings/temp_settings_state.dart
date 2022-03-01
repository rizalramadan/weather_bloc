part of 'temp_settings_cubit.dart';

class TempSettingsState extends Equatable {
  final bool isFarenheit;
  const TempSettingsState({
    this.isFarenheit = false,
  });

  @override
  List<Object> get props => [isFarenheit];

  TempSettingsState copyWith({
    bool? isFarenheit,
  }) {
    return TempSettingsState(
      isFarenheit: isFarenheit ?? this.isFarenheit,
    );
  }

  @override
  String toString() => 'TempSettingsState(isCelcius: $isFarenheit)';
}
