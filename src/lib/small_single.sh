function small_single() {
  declare -a SIZES=("150" "300" "600" "1000")
  declare BASE
  BASE=$(basename "${args[--input]}")
  mkdir "${BASE%.*}"
  for item in "${SIZES[@]}"; do
    magick "${args[--input]}" -resize "${item}x" "${BASE%.*}/${item}w.${BASE##*.}"
  done
}
