#!/usr/bin/env bash
LC_ALL=C

# Display help usage
function usage () {
  echo
  echo "Usage"
  echo
  echo "  $0 -s <source directory> -d <destination directory>"
  echo

}

SOURCEDIR=""
DESTDIR=""

# Take command line arguments
if [ $# -lt 1 ]; then
    usage
    exit 0
else
    while [ $# -gt 0 ]; do
        case "${1}" in
          -sourcedir|-s)
            SOURCEDIR="${2}"
            shift
            shift;;
          -destdir|-d)
            DESTDIR="${2}"
            shift
            shift;;
          -h|--h|-help|--help)
            usage
            exit 0;;
          *)
            echo "[!] ERROR: \"${1}\" is not a supported parameter."
            usage
            exit 1;;
        esac
    done
fi

cp -nr ${SOURCEDIR} ${DESTDIR}
cd ${DESTDIR}
fd -t f -e flac -x ffmpeg -i "{}" -qscale:a 0 "{.}.mp3"
fd -t f -e flac -x rm "{}"

echo "done."
echo 

