#!/bin/sh

[ -z "${SKPVER}" ] && SKPVER=17

# Output To Plugin Folder
OUTPUT_PATH="$APPDATA/SketchUp/SketchUp 20${SKPVER}/SketchUp/Plugins"

watch_files() {
  last_check_sum=""

  while [[ true ]]
  do
    check_sum=$(find . -type f \( -path "*/ui-src/*" -o -path "*/plugin-src/*" \) -printf "%T@ %p\n" | md5sum | cut -d " " -f 1)
    if [[ $check_sum = $last_check_sum ]]; then
      sleep 1
    else
      last_check_sum="${check_sum}"
      ./make.sh
      cp -R "dist/op_course_helpers" "${OUTPUT_PATH}"
      cp "dist/op_course_helpers.rb" "${OUTPUT_PATH}"
      echo "Triggered at: $(date -u) | SKPVER ${SKPVER}"
    fi
  done
}

watch_files
