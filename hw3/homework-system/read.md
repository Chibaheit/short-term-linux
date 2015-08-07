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
        │     ├─Student 学生列表
        │     │   └─Student ID 学生所交作业文件
        │     │
        │     ├─Teacher Info 教师信息
        │     │
        │     └─Lecture Name 课程名称
        |
        ├─Student
        │   └─Student ID 学号
        │       ├─Student Name  姓名
        │       │
        │       ├─Student Password  密码
        │       │
        │       └─LectureInfo 所修课程
        │
        └─Teacher
            └─Teacher ID  教师ID
                ├─Teacher Name 教师姓名
                │
                ├─Teacher Password 教师密码
                │
                └─LectureInfo 所授课程
                    └─Lecture ID 课程ID
## admin.sh
1. 通过bash admin.sh进入管理员界面,默认管理员ID,密码都是chiba,可以朝admininfo里添加ID,密码设定管理员
2. 根据提示来完成想要执行的操作,比如:
    创建、修改、删除、显示（list）教师帐号；
      教师帐户包括教师工号、教师姓名，教师用户以教师工号登录。
    创建、修改、删除课程；
      绑定（包括添加、删除）课程与教师用户。课程名称以简单的中文或英文命名。

## teacher.sh
1. 可以通过admin.sh生成教师账号, ID和密码作为登入关键字
2. 通过 bash teacher.sh登入后可以执行下列操作:
    对某门课程，创建或导入、修改、删除学生帐户，根据学号查找学生帐号；学生帐号的基本信息包括学号和姓名，学生使用学号登录。
    发布课程信息。包括新建、编辑、删除、显示（list）课程信息等功能。
    布置作业或实验。包括新建、编辑、删除、显示（list）作业或实验等功能。
    查找、打印所有学生的完成作业情况。

## student.sh
1. 通过student.sh可以生成学生账号,其中ID,密码作为登入关键字
2. 通过 bash student.sh登入系统后可以进行操作:
    在教师添加学生账户后，学生就可以登录系统，并完成作业和实验。
    基本功能：新建、编辑作业或实验功能；查询作业或实验完成情况。
