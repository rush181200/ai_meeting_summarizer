class MeetingItem {
  final int? id;
  final String filePath;
  final String transcript;
  final String summary;

  MeetingItem({
    this.id,
    required this.filePath,
    required this.transcript,
    required this.summary,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filePath': filePath,
      'transcript': transcript,
      'summary': summary,
    };
  }

  factory MeetingItem.fromMap(Map<String, dynamic> map) {
    return MeetingItem(
      id: map['id'],
      filePath: map['filePath'],
      transcript: map['transcript'],
      summary: map['summary'],
    );
  }
}
