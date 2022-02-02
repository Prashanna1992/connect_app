class ChatModel {
  final String? name;
  final String? icon;
  final bool? isGroup;
  final String? time;
  final String? status;
  final String? currentMessage;
  bool select = false;
  ChatModel(
      {this.name,
      this.icon,
      this.isGroup,
      this.time,
      this.status,
      this.currentMessage,
      this.select = false});
}
