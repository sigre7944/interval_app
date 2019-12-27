// Copyright 2019 By Champions. All rights reserved.

enum Difficulty { easy, normal, difficult, extreme }
enum Size { small, medium, big, large }

class StudyItem {
  final String id;
  final String taskName;
  final DateTime creationDate;
  final DateTime nextStudyDate;
  final Difficulty difficulty;
  final Size size;
  final bool archived;

  StudyItem(this.id, this.taskName, this.creationDate, this.nextStudyDate,
      this.difficulty, this.size, this.archived);
}
