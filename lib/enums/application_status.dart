enum ApplicationStatus { initial, error, loading, success }

extension ApplicationStatusX on ApplicationStatus {
  bool get isInitial => this == ApplicationStatus.initial;
  bool get isSuccess => this == ApplicationStatus.success;
  bool get isError => this == ApplicationStatus.error;
  bool get isLoading => this == ApplicationStatus.loading;
}
