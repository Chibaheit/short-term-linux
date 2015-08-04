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
        │     ├─StudentList 学生列表
        │     │
        │     ├─TeacherInfo 教师信息
        │     │
        │     └─LectureName 课程名称
        |
        ├─Student
        │   └─Student ID 学号
        │       ├─Student Name
        │       │
        │       └─LectureInfo 所修课程
        │
        └─Teacher
            └─Teacher ID  教师ID
                ├─TeacherName 教师姓名
                │
                ├─TeacherPwd 教师密码
                │
                └─LectureInfo 所授课程
                    └─Lecture ID 课程ID
