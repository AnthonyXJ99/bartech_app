
class ImageResponse {
  final String imageCode;
  final String imageTitle;
  final String imageType;
  final String description;
  final String fileName;
  final String filePath;
  final String publicUrl;
  final String originalFileName;
  final int fileSize;
  final String contentType;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool isActive;
  final int? displayOrder;
  final String? altText;
  final String tags;

  ImageResponse({
    required this.imageCode,
    required this.imageTitle,
    required this.imageType,
    required this.description,
    required this.fileName,
    required this.filePath,
    required this.publicUrl,
    required this.originalFileName,
    required this.fileSize,
    required this.contentType,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.isActive,
    this.displayOrder,
    this.altText,
    required this.tags,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(
      imageCode: json['imageCode'],
      imageTitle: json['imageTitle'],
      imageType: json['imageType'],
      description: json['description'],
      fileName: json['fileName'],
      filePath: json['filePath'],
      publicUrl: json['publicUrl'],
      originalFileName: json['originalFileName'],
      fileSize: json['fileSize'],
      contentType: json['contentType'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      isActive: json['isActive'],
      displayOrder: json['displayOrder'],
      altText: json['altText'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageCode': imageCode,
      'imageTitle': imageTitle,
      'imageType': imageType,
      'description': description,
      'fileName': fileName,
      'filePath': filePath,
      'publicUrl': publicUrl,
      'originalFileName': originalFileName,
      'fileSize': fileSize,
      'contentType': contentType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'isActive': isActive,
      'displayOrder': displayOrder,
      'altText': altText,
      'tags': tags,
    };
  }
}