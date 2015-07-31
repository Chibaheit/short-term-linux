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
  done < AdminInfo
}

function adminCheck() {
# Read the entered name and password
  read -p "> Enter admin name: " readName
  read -p "> Enter admin password: " readPwd
  login="n"
# Check the entered account is a admin account or not
  for i in $(seq 0 $(($adminCnt-1)))
  do
    if [ $[adminName[$i]] = $readName ]; then
      if [ $[adminPwd[$i]] = $readPwd ]; then
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


echo "Homework System:"
# Read the admin config
readConfig
# Check the admin
adminCheck
# Show the feature
while [ "" = "" ]; do
  showFeature
done
