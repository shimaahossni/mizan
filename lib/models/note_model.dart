class NoteModel {
  final int? id;
  String title;
  String description;

  NoteModel({
    this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
