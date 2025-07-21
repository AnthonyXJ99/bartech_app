part of 'image_bloc.dart';

sealed class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class LoadImagesEvent extends ImageEvent {
  final String type;

  const LoadImagesEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class ClearImagesEvent extends ImageEvent {
  final String type;

  const ClearImagesEvent({required this.type});

  @override
  List<Object> get props => [type];
}
