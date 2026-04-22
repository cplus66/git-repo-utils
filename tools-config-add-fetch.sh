find . -type d -name "*.git" | while read gitdir; do
  config="$gitdir/config"
  if [ -f "$config" ]; then
    if ! grep -q "fetch  = +refs/\*:refs/\*" "$config"; then
      # Check if [remote "origin"] section exists
      if grep -q '^\[remote "origin"\]' "$config"; then
        # Insert the fetch line after [remote "origin"]
        sed -i '/^\[remote "origin"\]/a\\tfetch  = +refs/*:refs/*' "$config"
        echo "Added fetch line to: $config"
      else
        echo "No [remote \"origin\"] section in: $config"
      fi
    else
      echo "Already has fetch line: $config"
    fi
  else
    echo "No config file in: $gitdir"
  fi
done
