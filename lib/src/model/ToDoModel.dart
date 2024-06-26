class ToDoModel {
  final int? id;
  final bool isImportant;
  final String title;
  final String describtion;
  ToDoModel(
      {required this.title,
        this.id,
        required this.describtion,
        required this.isImportant});

  factory ToDoModel.fromJson(Map<String, dynamic> map) {
    return ToDoModel(
      title: map['title'],
      id: map['id'],
      describtion: map['describtion'],
      isImportant: map['isImportant'] == 1,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'describtion': describtion,
      'isImportant': isImportant == true ? 1 : 0,
    };
  }

  ToDoModel copyWith({
    int? id,
    bool? isImportant,
    String? title,
    String? describtion,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      title: title ?? this.title,
      describtion: describtion ?? this.describtion,
    );
  }
}