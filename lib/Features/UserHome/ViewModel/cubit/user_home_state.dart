part of 'user_home_cubit.dart';

@immutable
sealed class UserHomeState {}

final class UserHomeInitial extends UserHomeState {}

final class GetCurrentLocationSussesState extends UserHomeState {}

final class SearchLocationSussesState extends UserHomeState {}

final class SearchLocationErrorState extends UserHomeState {}

final class SetDestinationSussesState extends UserHomeState {}

final class GetDirectionSussesState extends UserHomeState {}

final class GetDirectionErrorState extends UserHomeState {}

final class SetPriceSussesState extends UserHomeState {}

final class AddRequestSussesState extends UserHomeState {
  final String rideRequestId;
  final RideRequestModel requestModel;
  AddRequestSussesState(
      {required this.rideRequestId, required this.requestModel});
}

final class AddRequestErrorState extends UserHomeState {}
