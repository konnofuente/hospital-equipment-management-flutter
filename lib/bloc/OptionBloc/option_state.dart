import 'package:equatable/equatable.dart';
import '../../models/Option.dart';

class OptionState extends Equatable {
  final List<Option> allOptions;
  const OptionState(
  {this.allOptions = const <Option>[],});

  @override
  List<Object> get props => [allOptions];
}

