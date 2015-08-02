# Enter the homeworksystem

# Read admin config
function readConfig() {
  adminCnt=0
# Every odd line is name
# Every even line is password
  while read LINE
  do
    adminName[$adminCnt]=$LINE
    read LINE
    adminPwd[$adminCnt]=$LINE
    adminCnt=$(($adminCnt+1))
  done < admininfo
}

function adminCheck() {
# Read the entered name and password
  read -p "> Enter admin name: " readName
  read -p "> Enter admin password: " readPwd
  login="n"
# Check the entered account is a admin account or not
  for i in $(seq 0 $(($adminCnt-1)))
  do
    if [ ${adminName[$i]]} = $readName ]; then
      if [ ${adminPwd[$i]]} = $readPwd ]; then
        login="y"
      fi
    fi
  done
# If the account isn't a admin account exit.
  if [ $login = "n" ]; then
    echo "Invalid admin name or admin password!"
    exit 1
  fi
}

# List the feature
function listFeature() {
  while [ "" = "" ]
  do
    # Description about the feature
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "Please check the feature you want and enter the number"
    echo "> 0: Create a new teacher's account"
    echo "> 1: Modify a teacher's account"
    echo "> 2: Delete a teacher's account"
    echo "> 3: List all teacher's account"
    echo "> 4: Create a new lecture"
    echo "> 5: Modify a lecture"
    echo "> 6: Delete a lecture"
    read -p "> Please input your choice [0-6]: " choice

    case "$choice" in
    0) # 0: Create a new teacher's account
      read -p "> Please input the teacher's ID: " teacherID
      # If exist
      if [ -e "teacher/$teacherID" ]; then
        echo "Exist teacher's ID"
        continue
      fi
      mkdir "teacher/$teacherID"
      read -p "> Please input the teacher's name:  " teacherName
      read -p "> Please input the password you want: " teacherPwd
      echo $teacherName > "teacher/$teacherID/name"
      echo $teacherPwd > "teacher/$teacherID/pwd"
      mkdir "teacher/$teacherID/lecture"
      ;;
    1) # 1: Modify a teacher's account
      read -p "> Please input the teacher's ID: " teacherID
      # If not exist
      if [ ! -e "teacher/$teacherID" ]; then
        echo "The teacher's ID doesn't exists"
        continue
      fi
      echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      echo "Please choose the attribute you want to modify"
      echo "> 0: ID"
      echo "> 1: Name"
      echo "> 2: Password"
      echo "> 3: Exit"
      read -p "> Please input your choice [0-3]: " choiceTeacher
      case "$choiceTeacher" in
      0) # ID
        read -p "> Please input new ID: " newID
        mv -f "teacher/$teacherID" "teacher/$newID"
        ;;
      1) # Name
        read -p "> Please input new name: " newName
        echo $newName > "teacher/$teacherID/name"
        ;;
      2) # Password
        read -p "> Please input new password: " newPwd
        echo $newPwd > "teacher/$teacherID/pwd"
        ;;
      3) # Exit
        continue
        ;;
      *) # Others
        echo "Invalid input"
        continue
        ;;
      esac
      ;;
    2) # 2: Delete a teacher's account
      read -p "> Please input the teacher's ID: " teacherID
      if [ ! -e "teacher/$teacherID" ]; then
        echo "The teacher's ID doesn't exist"
        continue
      fi
      rm -rf "teacher/$teacherID"
      ;;
    3) # 3: List all teacher's account
      echo ">>>>>>>>>>>>Account<<<<<<<<<<<<"
      ls -1 teacher
      echo ">>>>>>>>>>>>>>End<<<<<<<<<<<<<<"
      ;;
    4) # 4: Create a new lecture
      read -p "> Please input the lecture's ID: " lectureID
      # If exist
      if [ -e "lecture/$lectureID" ]; then
        echo "Exist lecture's ID"
        continue
      fi
      mkdir "lecture/$lectureID"
      read -p "> Please input the lecture's name: " lectureName
      read -p "> Please input the teacher's ID: " teacherID
      echo $lectureName > "lecture/$lectureID/name"
      echo $teacherID > "lecture/$lectureID/teacher"
      mkdir "lecture/$lectureID/student"
      ;;
    5) # 5: Modify a lecture
      read -p "> Please input the lecture's ID: " lectureID
      # If not exist
      if [ ! -e "lecture/$lectureID" ]; then
        echo "The lecture doesn't exists"
        continue
      fi
      echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      echo "Please choose the attribute you want to modify"
      echo "> 0: ID"
      echo "> 1: Name"
      echo "> 2: TeacherID"
      echo "> 3: Exit"
      read -p "> Please input your choice [0-3]: " choiceLecture
      case "$choiceLecture" in
      0) # ID
        read -p "> Please input new ID: " newID
        mv -f "lecture/$lectureID" "lecture/$newID"
        ;;
      1) # Name
        read -p "> Please input new name: " newName
        echo $newName > "lecture/$lectureID/name"
        ;;
      2) # TeacherID
        read -p "> Please input new teacher's ID: " newTeacher
        echo $newTeacher > "lecture/$lectureID/teacher"
        ;;
      3) # Exit
        continue
        ;;
      *) # Others
        echo "Invalid input"
        continue
        ;;
      esac
      ;;
    6) # 6: Delete a lecture
      read -p "> Please input the lecture's ID: " teacherID
      if [ ! -e "lecture/$lectureID" ]; then
        echo "The lecture doesn't exist"
        continue
      fi
      rm -rf "lecture/$lectureID"
      ;;
    *) # Others
      echo "Invalid input"
      continue
      ;;
    esac
  done
}

echo "Homework System:"
# Read the admin config
readConfig
# Check the admin
adminCheck
# Show the feature
while [ "" = "" ]; do
  listFeature
done
