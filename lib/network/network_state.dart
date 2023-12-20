part of 'network_cubit.dart';

@immutable
abstract class NetworkState {}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

class NetworkLoading extends NetworkState {
  @override
  List<Object> get props => [];
}

class NetworkSuccess extends NetworkState {
  late final List<Post>list;

  NetworkSuccess(this.list);

  @override
  List<Object> get props => [];
}

class NetworkErorr extends NetworkState {
 final String massenge;


 NetworkErorr(this.massenge);

  @override
  List<Object> get props => [];
}
