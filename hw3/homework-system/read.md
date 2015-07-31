homework-system
===================

##Directory

        ├─main.sh  顶层模块
        │
        │─admin.sh  管理员模块
        │
        │─teacher.sh  教师模块
        │
        │─student.sh  学生模块
        │
        │─AdminInfo  管理员信息
        │
        ├─Lecture
        │  └─Lecture ID 课程ID
        │     ├─Homework ID 作业ID
        │     │   ├─HomeworkInfo  作业内容
        │     │   │
        │     │   └─Student ID 学生所交作业文件
        │     │
        │     ├─Experiment ID 作业ID
        │     │   ├─ExperimentInfo 实验内容
        │     │   │
        │     │   └─Student ID 学生所交实验文件
        │     │
        │     ├─StudentList 学生列表
        │     │
        │     ├─TeacherInfo 教师信息
        │     │
        │     └─LectureInfoList 学生列表
        |
        ├─Student
        │   └─Student ID 学号
        │       ├─Student Name
        │       │
        │       └─LectureInfo 所修课程
        │
        └─Teacher
            └─Teacher ID  教师ID
                ├─TeacherInfo 教师信息
                │
                └─LectureInfo 所授课程
