// Copyright 2019 By Champions. All rights reserved.
import 'study_item.dart';

class PhotoItem extends StudyItem {
  PhotoItem(String id, String taskName, DateTime creationDate,
      DateTime nextStudyDate, Difficulty difficulty, Size size, bool archived)
      : super(id, taskName, creationDate, nextStudyDate, difficulty, size,
            archived);
}
