#!/usr/bin/env bash

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CURRENT_OS=""
scripts=(
  "os_dependencies"
  "go"
  "protoc"
  "proto_plugins"
  "prototool"
  "dart"
)

check_if_fail(){
   if [[ $? -eq 0 ]]; then
      echo OK
   else
      echo "Fail in $1"
      exit 1
   fi
}

detect_os(){
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ -e '/usr/bin/zypper' ]]; then
      CURRENT_OS="linux/suse"
    elif [[ -e '/usr/bin/apt-get' ]]; then
      CURRENT_OS="linux/debian"
    elif [[ -e '/usr/bin/yum' ]]; then
      CURRENT_OS="linux/redhat"
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo ""
  elif [[ "$OSTYPE" == "msys" ]]; then
    echo ""
  elif [[ "$OSTYPE" == "win32" ]]; then
    echo ""
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo ""
  fi
  if [[ "${CURRENT_OS}" == "" ]]; then
    echo "ERROR: the instalation on '${OSTYPE}' is not supported"
    exit 1
  fi
  echo "Supported OS '${CURRENT_OS}'"
}


# ROUTINE

detect_os

for script in "${scripts[@]}"
do
  script_file="${CURRENT_PATH}/${CURRENT_OS}/install_${script}.sh"
  echo ".........................."
  echo "Installing: ${script} "
  echo ".........................."
  echo "${script_file}"
  bash "${script_file}"
  check_if_fail "${script_file}"
done

echo "OK Ready..."