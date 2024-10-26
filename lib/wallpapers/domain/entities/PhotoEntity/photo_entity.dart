class PhotoEntity {
  final int? photoid;
  final String? photourl, photoDocId;

  PhotoEntity({
    this.photoDocId,
    required this.photoid,
    required this.photourl,
  });
  factory PhotoEntity.fromFirestore(Map<String, dynamic> data, String? docId) {
    return PhotoEntity(
        photoid: data['id'] ?? 0,
        photourl: data['url'] ?? '',
        photoDocId: docId);
  }
}
