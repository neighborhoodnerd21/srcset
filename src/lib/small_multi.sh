function small_multi() {
  declare -a SIZES=("150" "300" "600" "1000")
  readarray -d '' files < <(find "${args[--input]}" -maxdepth 1 -iname "${args[--pattern]}" -type f -print0)
  for i in "${files[@]}"; do
    name=$(basename "${i}")
    mkdir "${name%.*}"
    for j in "${SIZES[@]}"; do
      magick "${name}" -resize "${j}x" "${name%.*}/${j}w.${name##*.}"
      unset "$name"
    done
  done
}
