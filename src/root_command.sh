large=${args[--large]}

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
