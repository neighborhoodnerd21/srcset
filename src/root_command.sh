large=${args[--large]}
pngfiles=${args[--png]}
declare -a files

function get_files() {
  readarray -d '' files < <(find "${IMG_PTH}" -maxdepth 1 -iname "${IMG_TYPE}" -type f -print0)
  # add check for empty array
  if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching pattern ${IMG_TYPE} in directory ${IMG_PTH}"
    exit 1
  fi
}

function mk_srcset() {
  for i in "${files[@]}"; do
    name=$(basename "${i}")
    mkdir "${name%.*}" || {
      echo "Failed to create directory for ${name}"
      exit 1
    }
    for j in "${SIZES[@]}"; do
      magick "${name}" -resize "${j}x" "${name%.*}/${j}w.${name##*.}" || {
        echo "Failed to resize ${name} to ${j}w"
        exit 1
      }
      unset "$name"
    done
  done
}

if [[ $pngfiles ]]; then
  IMG_TYPE="*.png"
fi

if [[ $large ]]; then
  SIZES=("${LG_SIZES[@]}")
fi

if [ -d "${args[input]}" ]; then
  get_files
  mk_srcset
else
  mk_srcset
fi

exit 0
