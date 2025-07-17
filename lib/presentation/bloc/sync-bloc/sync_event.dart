part of 'sync_bloc.dart';

sealed class SyncEvent extends Equatable {
  const SyncEvent();

  @override
  List<Object> get props => [];
}

class SyncProductsEvent extends SyncEvent {}

class SyncCategoriesEvent extends SyncEvent {}

class SyncAllEvent extends SyncEvent {}
