#!/usr/bin/env bash

print_usage() {
  echo "Snapshots are mandatory, usage: "
  echo "    snapshot_changes.sh <old> <new>"
}

OLD=$1
NEW=$2
if [ -z "$OLD" ] || [ -z "$NEW" ]; then
  print_usage
  exit 1
fi

zdiff --unchanged-line-format="" --old-line-format="rm>  ;%L" --new-line-format="add> ;%L" $OLD $NEW
