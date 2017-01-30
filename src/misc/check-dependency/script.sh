if ! which {{ params.binary_name }} > /dev/null; then
  >&2 echo "{{ params.binary_name }} not found"
  exit 1
fi
