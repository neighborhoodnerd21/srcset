function small_multi() {
  declare -a SIZES=("150" "300" "600" "1000")
  readarray -d '' files < <(find "${args[--input]}" -maxdepth 1 -iname "${args[--pattern]}" -type f -print0)
  # add check for empty array
  if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching pattern ${args[--pattern]} in directory ${args[--input]}"
    exit 1
  fi
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
  exit 0
}
