find . -type d -name "*.git" | while read gitdir; do
  config="$gitdir/config"
  if [ -f "$config" ]; then
    if ! grep -q "fetch  = +refs/\*:refs/\*" "$config"; then
      echo "$gitdir"
    fi
  else
    echo "$gitdir (no config file)"
  fi
done
