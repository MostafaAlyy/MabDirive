part of 'ride_request_cubit.dart';

@immutable
abstract class RideRequestState {}

class RideRequestInitial extends RideRequestState {}

class RideRequestLoading extends RideRequestState {}

class RideRequestSuccess extends RideRequestState {
  final List<RideRequestModel> requests;

  RideRequestSuccess(this.requests);
}

class SwitchIsOfflineState extends RideRequestState {}

class YourOfferAcceptedState extends RideRequestState {
  RideRequestModel requestModel;
  YourOfferAcceptedState({required this.requestModel});
}
