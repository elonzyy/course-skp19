#!/bin/sh

# Output To Plugin Folder
OUTPUT_PATH="dist"
OUTPUT_PATH_UI="dist/op_course_helpers/ui"
mkdir -p "$OUTPUT_PATH"
mkdir -p "$OUTPUT_PATH_UI"

# Tmpfile for error message
tmpfile=$(mktemp /tmp/build.err.XXXXXX)
elm make ui-src/Main.elm --output="${OUTPUT_PATH_UI}/elm-main.js" 2>$tmpfile

# Make iframe when error out
if [ -s $tmpfile ]; then
  read -r -d '' displayerr <<-'EOF'
  window.addEventListener('load', function() { 
    var iframe = document.createElement('iframe');
    iframe.style.width = "100%";
    iframe.style.height = "450px";
    iframe.src = './elm-err.txt';
    document.body.appendChild(iframe);
  }, false);
EOF

  echo $displayerr > "${OUTPUT_PATH_UI}/elm-main.js"
  printf '%s\n%s\n%s' "$jsbegin" "$(cat $tmpfile)" "$jsend" > "${OUTPUT_PATH_UI}/elm-err.txt"

  echo "Build Error.."
  cat "$tmpfile"
fi

# Copy Style
sass "./ui-src/style/main.scss:${OUTPUT_PATH_UI}/style.css" --no-source-map

# Ruby
cp -R "plugin-src/op_course_helpers" "${OUTPUT_PATH}"
cp "plugin-src/op_course_helpers.rb" "${OUTPUT_PATH}"

echo "Output Path:" "$OUTPUT_PATH"
