# Enter the homeworksystem

function teacherCheck() {
  echo "Homework System:"
  read -p "> Enter teacher ID: " readID
  read -p "> Enter teacher password: " readPwd
  login="n"
  # Check the entered account is a teacher account or not
  echo "$readID"
  if [ -e "teacher/$readID" ]; then
    checkPwd=`cat teacher/$readID/pwd`
    if [ "${readPwd}" = "$checkPwd" ]; then
      login="y"
    fi
  fi

  # If the account isn't a teacher account exit.
  if [ $login = "n" ]; then
    echo "ERROR: "
    echo "    Invalid teacher id or teacher password!"
    exit 1
  fi
}

#check student
function checkStudent() {
  while [ "" = "" ]
  do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # list the feature
    echo "> 0: Create a new student's account"
    echo "> 1: Modify a student's account"
    echo "> 2: Delete a student's account"
    echo "> 3: List a student's information"
    echo "> 4: Exit"
    read -p "> Please input your choice [0-4]: " choice

    case "$choice" in
      0) # 0: Create a new student's account
        read -p "> Please input the student's ID: " studentID
        # If exist
        if [ -e "student/$studentID" ]; then
          echo "ERROR:"
          echo "    Exist student's ID"
          continue
        fi
        mkdir "student/$studentID"
        read -p "> Please input the student's name:  " studentName
        read -p "> Please input the password you want: " studentPwd
        echo $studentName > "student/$studentID/name"
        echo $studentPwd > "student/$studentID/pwd"
        mkdir "student/$studentID/lecture"
        ;;
      1) # 1: Modify a student's account
        read -p "> Please input the student's ID: " studentID
        # If not exist
        if [ ! -e "student/$studentID" ]; then
          echo "The student's ID doesn't exists"
          continue
        fi
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "Please choose the attribute you want to modify"
        echo "> 0: ID"
        echo "> 1: Name"
        echo "> 2: Password"
        echo "> 3: Exit"
        read -p "> Please input your choice [0-3]: " choiceStudent
        case "$choiceStudent" in
          0) # ID
            read -p "> Please input new ID: " newID
            mv -f "student/$studentID" "student/$newID"
            ;;
          1) # Name
            read -p "> Please input new name: " newName
            echo $newName > "student/$studentID/name"
            ;;
          2) # Password
            read -p "> Please input new password: " newPwd
            echo $newPwd > "student/$studentID/pwd"
            ;;
          3) # Exit
            continue
            ;;
          *) # Others
            echo "EROOR: "
            echo "    Invalid input"
            continue
            ;;
        esac
        ;;
      2) # 2: Delete a student's account
        read -p "> Please input the student's ID: " studentID
        if [ ! -e "student/$studentID" ]; then
          echo "ERROR: "
          echo "    The student's ID doesn't exist"
          continue
        fi
        rm -rf "student/$studentID"
        ;;
      3) # 3: List a student's infomation
        read -p "> Please input the student's ID: " studentID
        if [ ! -e "student/$studentID" ]; then
          echo "ERROR:"
          echo "    The student's ID doesn't exist"
          continue
        fi
        read studentName < "student/$studentID/name"
        echo "ID: $studentID"
        echo "Name: $studentName"
        ;;
      4) # 4: Exit
        return
        ;;
      *) # Others
        echo "ERROR: "
        echo "    Invalid input"
        continue
        ;;
    esac
  done
}

function checkLecture() {
  while [ "" = "" ]
  do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # list the feature
    echo "> 0: Create a new lecture"
    echo "> 1: Modify a lecture"
    echo "> 2: Delete a lecture"
    echo "> 3: List a lecture"
    echo "> 4: Exit"
    read -p "> Please input your choice [0-4]: " choice
    case "$choice" in
      0) # 0: Create a new lecture
        read -p "> Please input the lecture's ID: " lectureID
        # If exist
        if [ -e "lecture/$lectureID" ]; then
          echo "Exist lecture's ID"
          continue
        fi
        mkdir "lecture/$lectureID"
        mkdir "lecture/$lectureID/homework"
        read -p "> Please input the lecture's name: " lectureName
        echo $lectureName > "lecture/$lectureID/name"
        echo $readID > "lecture/$lectureID/teacher"
        touch "teacher/$readID/lecture/$lectureID"
        ;;
      1) # 1: Modify a lecture
        read -p "> Please input the lecture's ID: " lectureID
        # If not exist
        if [ ! -e "lecture/$lectureID" ]; then
          echo "ERROR: "
          echo "    The lecture doesn't exists"
          continue
        fi
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "Please choose the attribute you want to modify"
        echo "> 0: ID"
        echo "> 1: Name"
        echo "> 2: Exit"
        read -p "> Please input your choice [0-2]: " choiceLecture

        case "$choiceLecture" in
          0) # ID
            read -p "> Please input new ID: " newID
            mv -f "lecture/$lectureID" "lecture/$newID"
            ;;
          1) # Name
            read -p "> Please input new name: " newName
            echo $newName > "lecture/$lectureID/name"
            ;;
          2) # Exit
            continue
            ;;
          *) # Others
            echo "ERROR: "
            echo "    Invalid input"
            continue
            ;;
        esac
        ;;
      2) # 2: Delete a lecture
        read -p "> Please input the lecture's ID: " teacherID
        if [ ! -e "lecture/$lectureID" ]; then
          echo "ERROR "
          echo "    The lecture doesn't exist"
          continue
        fi
        rm -rf "lecture/$lectureID"
        ;;
      3) # 3: List a lecture
        read -p "> Please input the lecture's ID: " teacherID
        if [ ! -e "lecture/$lectureID" ]; then
          echo "ERROR: "
          echo "    The lecture doesn't exist"
          continue
        fi
        read lectureName < "lecture/$lectureID/name"
        read teacherName < "teacher/$readID/name"
        echo "Lecture Name: $lectureName"
        echo "Teacher Name: $teacherName"
        ;;
      4) # 4: Exit
        return
        ;;
      *) # Others
        echo "ERROR:"
        echo "    Invalid input"
        continue
        ;;
    esac
  done
}

function checkHomework() {
  # select the lecture
  read -p "> Please input the lecture's ID: " lectureID
  # If not exist
  if [ ! -e "lecture/$lectureID" ]; then
    echo "ERROR: "
    echo "    The lecture doesn't exists"
    continue
  fi
  echo "Lecture $lectureID: "
  while [ "" = "" ]
  do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # list the homework
    echo "> 0: Create a new homework"
    echo "> 1: Modify a homework"
    echo "> 2: Delete a homework"
    echo "> 3: List a homework"
    echo "> 4: Exit"
    read -p "> Please input your choice [0-4]: " choice
    case "$choice" in
      0) # 0: Create a new homework
        read -p "> Please input the homework's ID: " homeworkID
        # If exist
        if [ -e "lecture/$lectureID/homework/$homeworkID" ]; then
          echo "ERROR: "
          echo "    Exist homework's ID"
          continue
        fi
        mkdir "lecture/$lectureID/homework/$homeworkID"
        read -p "> Please input the homework's info: " homeworkInfo
        echo $homeworkInfo > "lecture/$lectureID/homework/$homeworkID/info"
        mkdir "lecture/$lectureID/homework/$homeworkID/student"
        ;;
      1) # 1: Modify a homework
        read -p "> Please input the homework's ID: " homeworkID
        # If exist
        if [ ! -e "lecture/$lectureID/homework/$homeworkID" ]; then
          echo "ERROR: "
          echo "    Not exist homework's ID"
          continue
        fi
        echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        echo "Please choose the attribute you want to modify"
        echo "> 0: ID"
        echo "> 1: Info"
        echo "> 2: Exit"
        read -p "> Please input your choice [0-2]: " choiceHomework

        case "$choiceHomework" in
          0) # ID
            read -p "> Please input new ID: " newID
            mv -f "lecture/$lectureID/homework/$homeworkID" "lecture/$lectureID/homework/$newID"
            ;;
          1) # Name
            read -p "> Please input new name: " newName
            echo $newName > "lecture/$lectureID/homework/$homeworkID/name"
            ;;
          2) # Exit
            continue
            ;;
          *) # Others
            echo "ERROR: "
            echo "    Invalid input"
            continue
            ;;
        esac
        ;;
      2) # 2: Delete homework
        read -p "> Please input the homework's ID: " homeworkID
        if [ ! -e "lecture/$lectureID/homework/$homeworkID" ]; then
          echo "The homework doesn't exist"
          continue
        fi
        rm -rf "lecture/$lectureID/homework/$homeworkID"
        ;;
      3) # 3: List a homework
        read -p "> Please input the homework's ID: " homeworkID
        if [ ! -e "lecture/$lectureID/homework/$homeworkID" ]; then
          echo "The homework doesn't exist"
          continue
        fi
        read homeworkInfo < "lecture/$lectureID/homework/$homeworkID/info"
        echo "Information: $homeworkInfo"
        ;;
      4) # 4: Exit
        return
        ;;
      *) # Others
        echo "ERROR: "
        echo "    Invalid input"
        continue
        ;;
    esac
  done
}

function checkGrade() {
  while [ "" = "" ]
  do
    # select the lecture
    read -p "> Please input the lecture's ID: " lectureID
    # If not exist
    if [ ! -e "lecture/$lectureID" ]; then
      echo "ERROR: "
      echo "    The lecture doesn't exists"
      continue
    fi
    echo "Lecture $lectureID: "
    while [ "" = "" ]
    do
      # select the homework
      read -p "> Please input the homework's ID: " homeworkID
      # If not exist
      if [ ! -e "lecture/$lectureID/homework/$homeworkID" ]; then
        echo "ERROR: "
        echo "    The homework doesn't exists"
        continue
      fi
      echo "Homework $homeworkID: "
      echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      # list the homework
      echo "> 0: List a selected student's homework"
      echo "> 1: List all homework"
      echo "> 2: Exit"
      read -p "> Please input your choice [0-2]: " choice
      case "$choice" in
        0) # 0: List a selected student's homework
          read -p "> Please input the student's ID: " studentID
          # If exist
          if [ ! -e "lecture/$lectureID/homework/$homeworkID/student/$studentID" ]; then
            echo "ERROR: "
            echo "    Not exist's ID"
            continue
          fi
          read studentInfo < "lecture/$lectureID/homework/$homeworkID/student/$studentID"
          echo "ID: $studentID"
          echo "Content: $studentInfo"
          ;;
        1) # 1: List all homework
          tmpPath="lecture/$lectureID/homework/$homeworkID/student"
          for studentID in $tmpPath/*
          do
            echo "$studentID"
            read studentInfo < "$studentID"
            echo "ID: $studentID"
            echo "Content: $studentInfo"
          done
          ;;
        2) # 4: Exit
          return
          ;;
        *) # Others
          echo "ERROR: "
          echo "    Invalid input"
          continue
          ;;
      esac
    done
  done
}

# List the feature
function listFeature() {
  while [ "" = "" ]
  do
    # Description about the feature
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "Please choose the materials you want to check"
    echo "> 0: Student"
    echo "> 1: Lecture"
    echo "> 2: Homework"
    echo "> 3: Grade"
    echo "> 4: Exit"
    read -p "> Please input your choice [0-4]: " choice

    case "$choice" in
      0) # Student
        checkStudent
        ;;
      1) # Lecture
        checkLecture
        ;;
      2) # Homework
        checkHomework
        ;;
      3) # Grade
        checkGrade
        ;;
      4) # Exit
        return
        ;;
      *) # Others
        echo "Invalid input"
        continue
        ;;
    esac
  done
}
# Check the admin
teacherCheck
# Show the feature
listFeature
