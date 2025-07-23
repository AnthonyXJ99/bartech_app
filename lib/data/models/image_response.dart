class ImageResponse {
  final String? imageCode; // 🔄 Cambiado a nullable
  final String? imageTitle; // 🔄 Cambiado a nullable
  final String? imageType; // 🔄 Cambiado a nullable
  final String? description; // 🔄 Cambiado a nullable
  final String? fileName; // 🔄 Cambiado a nullable
  final String? filePath; // 🔄 Cambiado a nullable
  final String? publicUrl; // 🔄 Cambiado a nullable
  final String? originalFileName; // 🔄 Cambiado a nullable
  final int? fileSize; // 🔄 Cambiado a nullable
  final String? contentType; // 🔄 Cambiado a nullable
  final DateTime? createdAt; // 🔄 Cambiado a nullable
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool? isActive; // 🔄 Cambiado a nullable
  final int? displayOrder;
  final String? altText;
  final String? deviceCode;
  final String? tags; // 🔄 Cambiado a nullable

  // Constructor actualizado
  ImageResponse({
    this.imageCode,
    this.imageTitle,
    this.imageType,
    this.description,
    this.fileName,
    this.filePath,
    this.publicUrl,
    this.originalFileName,
    this.fileSize,
    this.contentType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isActive,
    this.displayOrder,
    this.altText,
    this.deviceCode,
    this.tags,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(
      imageCode: json['imageCode'] ?? '',
      imageTitle: json['imageTitle'] ?? '',
      imageType: json['imageType'] ?? '',
      description: json['description'] ?? '',
      fileName: json['fileName'] ?? '',
      filePath: json['relativePath'] ?? '', // ✅ Fix principal
      publicUrl: json['publicUrl'] ?? '',
      originalFileName: json['originalFileName'] ?? '',
      fileSize: json['fileSize'] ?? 0,
      contentType: json['contentType'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'])
          : null,
      isActive: json['isActive'] ?? true,
      displayOrder: json['displayOrder'],
      altText: json['altText'],
      deviceCode: json['deviceCode'], // ✅ Ya está bien
      tags: json['tags'] ?? '',
    );
  }
  // Helper method para parsear fechas
  static DateTime? _parseDateTime(dynamic dateStr) {
    if (dateStr == null) return null;
    try {
      return DateTime.parse(dateStr.toString());
    } catch (e) {
      print('Error parsing date: $dateStr');
      return null;
    }
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'isActive': isActive,
      'displayOrder': displayOrder,
      'altText': altText,
      'deviceCode': deviceCode,
      'tags': tags,
    };
  }
}
