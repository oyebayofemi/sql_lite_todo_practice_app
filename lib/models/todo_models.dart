class TodoModel {
  int? id;
  String title;
  bool isChecked;
  DateTime creationDate;

  TodoModel(
      {required this.title,
      required this.isChecked,
      this.id,
      required this.creationDate});

  //Converting it into a Map so we can store it in the database

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked ? 1 : 0, //because sqllite doesnt support boolean
      'creationDate': creationDate
          .toString(), //sqlite doesnt support datetime function in the database
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return 'TodoModel(id:$id, title:$title,isChecked:$isChecked,creationDate:$creationDate)';
  }
}
