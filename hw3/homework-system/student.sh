# Enter the homeworksystem

function studentCheck() {
  echo "Homework System:"
  read -p "> Enter student ID: " readID
  read -p "> Enter student password: " readPwd
  login="n"
  # Check the entered account is a teacher account or not
  echo "$readID"
  if [ -e "student/$readID" ]; then
    checkPwd=`cat student/$readID/pwd`
    if [ "${readPwd}" = "$checkPwd" ]; then
      login="y"
    fi
  fi
  # If the account isn't a teacher account exit.
  if [ $login = "n" ]; then
    echo "ERROR: "
    echo "    Invalid student id or student password!"
    exit 1
  fi
}

# Edit Homwork
function editHomework() {
  while [ "" = "" ]
  do
    read -p "> Please input the lecture's ID: " lectureID
    # If not exist
    if [ ! -e "lecture/$lectureID" ]; then
      echo "ERROR: "
      echo "    Not exist lecture's ID"
      continue
    fi
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    # list the feature
    echo "> 0: Make a new homework"
    echo "> 1: Edit a homework"
    echo "> 2: Exit"
    read -p "> Please input your choice [0-2]: " choice

    case "$choice" in
      0) # 0: Create a new student's homework
        read -p "> Please input the homework's ID: " homeworkID
        # If exist
        if [ -e "lecture/$lectureID/homework/$homeworkID/student/$readID" ]; then
          echo "ERROR: "
          echo "  Exist homework's ID"
          continue
        fi
        read -p "> Please input your answer: " answer
        echo $answer > "lecture/$lectureID/homework/$homeworkID/student/$readID"
        ;;
      1) # 1: Edit a homework
        read -p "> Please input the homework's ID: " homeworkID
        # If not exist
        if [ ! -e "lecture/$lectureID/homework/$homeworkID/student/$readID" ]; then
          echo "ERROR: "
          echo "  Not exist homework's ID"
          continue
        fi
        read -p "> Please input your new answer: " newAnswer
        echo $newAnswer > "lecture/$lectureID/homework/$homeworkID/student/$readID"
        ;;
      2) # 2: Exit
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

function query() {
  # select the lecture
  read -p "> Please input the lecture's ID: " lectureID
  # If not exist
  if [ ! -e "lecture/$lectureID" ]; then
    echo "ERROR: "
    echo "    The lecture doesn't exists"
    return
  fi
  # select the homework
  read -p "> Please input the homework's ID: " homeworkID
  # If not exist
  if [ ! -e "lecture/$lectureID/homework/$homeworkID" ]; then
    echo "ERROR: "
    echo "    The homework doesn't exists"
    return
  fi
  if [ ! -e "lecture/$lectureID/homework/$homeworkID/student/$readID" ]; then
    echo "ERROR: "
    echo "    You haven't submit homework!"
    return
  fi
  read ans < "lecture/$lectureID/homework/$homeworkID/student/$readID"
  echo "Answer: $ans"
}

# List the feature
function listFeature() {
  while [ "" = "" ]
  do
    # Description about the feature
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "Please choose the materials you want to check"
    echo "> 0: editHomework"
    echo "> 1: query"
    echo "> 2: Exit"
    read -p "> Please input your choice [0-2]: " choice

    case "$choice" in
      0) # editHomework
        editHomework
        ;;
      1) # query
        query
        ;;
      2) # Exit
        return
        ;;
      *) # Others
        echo "Invalid input"
        continue
        ;;
    esac
  done
}
# Check the student
studentCheck
# Show the feature
listFeature
