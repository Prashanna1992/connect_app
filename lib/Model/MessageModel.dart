class MessageModel {
  String type;
  String message;
  String time;
  String? filePath;
  MessageModel(
      {required this.type,
      required this.message,
      required this.time,
      this.filePath});
}
