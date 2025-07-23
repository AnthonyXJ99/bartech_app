part of 'image_bloc.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {
  final String type;
  const ImageLoading(this.type);

  @override
  List<Object> get props => [type];
}

class ImageLoaded extends ImageState {
  final Map<String, List<ImageResponse>> imagesByType;
  const ImageLoaded(this.imagesByType);

  List<ImageResponse> getImagesByType(String type) {
    print(type);
    return imagesByType[type] ?? [];
  }

  @override
  List<Object> get props => [imagesByType];
}

class ImageError extends ImageState {
  final String message;
  final String type;
  const ImageError(this.message, this.type);

  @override
  List<Object> get props => [message, type];
}
