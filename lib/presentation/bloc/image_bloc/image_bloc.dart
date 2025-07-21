import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bartech_app/data/models/image_response.dart';
import 'package:bartech_app/data/repository/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository;
  Map<String, List<ImageResponse>> _imagesByType = {};

  ImageBloc(this.imageRepository) : super(ImageInitial()) {
    on<LoadImagesEvent>((event, emit) async {
      emit(ImageLoading(event.type));
      try {
        final images = await imageRepository.getImagesByType(event.type);
        _imagesByType[event.type] = images;
        print('Images loaded for type ${event.type}: $images');
        emit(ImageLoaded(Map.from(_imagesByType)));
      } catch (e) {
        print('Error loading images for type ${event.type}: $e');
        emit(ImageError(e.toString(), event.type));
      }
    });

    on<ClearImagesEvent>((event, emit) {
      _imagesByType.remove(event.type);
      if (_imagesByType.isEmpty) {
        emit(ImageInitial());
      } else {
        emit(ImageLoaded(Map.from(_imagesByType)));
      }
    });
  }
}
