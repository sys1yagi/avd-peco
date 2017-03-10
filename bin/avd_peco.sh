avd_peco(){
  if ! type avdmanager 2>/dev/null 1>/dev/null
  then
    echo -e 'Error: android command not found.\nYou must install Android SDK.\nhttps://developer.android.com/sdk/index.html'
  fi

  if ! type peco 2>/dev/null 1>/dev/null
  then
    echo -e 'Error: peco command not found.\nYou must install peco.\nhttps://github.com/peco/peco'
  fi

  avd_name=`avdmanager list avds | grep -oe "Name: [a-zA-Z0-9_]*" | sed -e 's/Name: //' | peco`
  if [[ $avd_name =~ ^(.+) ]] ; then
     echo "boot $avd_name $1"
     emulator -avd "$avd_name" $1 &
  fi
}
