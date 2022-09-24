// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

class NewsParm extends Equatable {
  final String parmString;

  const NewsParm(this.parmString);

  @override
  List<Object?> get props => [parmString];
}
