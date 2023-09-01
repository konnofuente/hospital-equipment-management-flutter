
import 'package:equatable/equatable.dart';

import '../../models/Option.dart';

abstract class OptionEvent extends Equatable {
  const OptionEvent();

  @override
  List<Object> get props => [];
}

class AddOptions extends OptionEvent {
  final Option Options;
  const AddOptions({
    required this.Options,
  });
  @override
  List<Object> get props => [Options];
}



class UpdateOptions extends OptionEvent {
  final Option Options;
  const UpdateOptions({
    required this.Options,
  });
  @override
  List<Object> get props => [Options];
}



class DeleteOptions extends OptionEvent {
  final Option Options;
  const DeleteOptions({
    required this.Options,
  });
  @override
  List<Object> get props => [Options];
}


class FetchOptions extends OptionEvent {

}


