import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katana/application_bloc/application_event.dart';
import 'package:katana/application_bloc/application_repo.dart';
import 'package:katana/application_bloc/application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepo applicationRepo;

  ApplicationBloc({required this.applicationRepo})
      : super(const ApplicationState()) {
    on<InitialiseApplicationEvent>(_mapInitialiseApplicationEventToState);
  }

  void _mapInitialiseApplicationEventToState(
    InitialiseApplicationEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    emit(state.copyWith(
      status: ApplicationStatus.loading,
    ));
    bool internetConnected = await applicationRepo.checkConnectivity();
    if (internetConnected) {
      add(FetchUserLocationEvent());
    } else {
      emit(state.copyWith(
        status: ApplicationStatus.error,
        applicationError: ApplicationErrorType.no_internet,
      ));
    }
  }
}
