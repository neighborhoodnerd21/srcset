function large_multi() {
  declare -a SIZES=("150" "300" "600" "1000" "1200" "1500" "2000")
  readarray -d '' files < <(find "${args[--input]}" -maxdepth 1 -iname "${args[--pattern]}" -type f -print0)
  # additional check to ensure that the array is not empty
  if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching the pattern '${args[--pattern]}' in the directory '${args[--input]}'."
    exit 1
  fi
  for i in "${files[@]}"; do
    name=$(basename "${i}")
    mkdir "${name%.*}"
    for j in "${SIZES[@]}"; do
      magick "${name}" -resize "${j}x" "${name%.*}/${j}w.${name##*.}"
      unset "$name"
    done
  done
}
