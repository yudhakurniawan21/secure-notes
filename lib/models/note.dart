class Note {
  int? id;
  String title;
  String content;
  String date;
  int userId;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
      'user_id': userId,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: map['date'],
      userId: map['user_id'],
    );
  }
}
