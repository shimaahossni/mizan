class Notes{
  final int? id;
  final String month;
  final String timedeliver;
  final String typeNote;
  Notes({ this.id,required this.month,required this.timedeliver,required this.typeNote});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'month': month,
      'timedeliver': timedeliver,
      'typeNote':typeNote,
    };
  }
}