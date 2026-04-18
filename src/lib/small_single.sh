function small_single() {
  declare -a SIZES=("150" "300" "600" "1000")
  declare BASE
  BASE=$(basename "${args[--input]}")
  if [ ! -f "${args[--input]}" ]; then
    echo "The specified input '${args[--input]}' is not valid."
    exit 1
  fi
  mkdir "${BASE%.*}" || {
    echo "Failed to create directory for ${BASE}"
    exit 1
  }
  for item in "${SIZES[@]}"; do
    magick "${args[--input]}" -resize "${item}x" "${BASE%.*}/${item}w.${BASE##*.}" || {
      echo "Failed to resize ${BASE} to ${item}w"
      exit 1
    }
  done
  exit 0
}
