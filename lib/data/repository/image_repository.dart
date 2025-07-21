import 'package:bartech_app/data/models/image_response.dart';

import '../services/image_service.dart';

class ImageRepository {
  final ImageService _imageService;
  ImageRepository(this._imageService);

  Future<List<ImageResponse>> getImagesByType(String type) async {
    return await _imageService.getImagesByType(type);
  }
}