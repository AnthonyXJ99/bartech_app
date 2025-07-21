import 'package:dio/dio.dart';
import '../models/image_response.dart';

class ImageService {
  final Dio _dio;

  ImageService(this._dio);

  //GET /api/Images/by-type/{type}
  Future<List<ImageResponse>> getImagesByType(String type) async {
    final res = await _dio.get('api/Images/by-type/$type');
    return (res.data as List).map((e) => ImageResponse.fromJson(e)).toList();
  }
}
