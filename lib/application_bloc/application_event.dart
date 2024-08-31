import 'package:equatable/equatable.dart';

class ApplicationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialiseApplicationEvent extends ApplicationEvent {
  InitialiseApplicationEvent() : super();
}
