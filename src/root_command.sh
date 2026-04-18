large=${args[--large]}
pngfiles=${args[--png]}

if [[ $pngfiles ]]; then
  IMG_TYPE="*.png"
else
  IMG_TYPE="*.jpg"
fi

if [ -d "${args[--input]}" ]; then
  if [[ $large ]]; then
    large_multi
  else
    small_multi
  fi
else
  if [[ $large ]]; then
    large_single
  else
    small_single
  fi
fi
