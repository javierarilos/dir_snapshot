#!/usr/bin/env bash

TGT_DIR=$1
if [ -z "$TGT_DIR" ]; then
  echo "Target dir is mandatory."
  exit 1
fi

SNAPSHOT_FILE=$(date +%s)-snapshot.csv.gz
echo "file_name;modif_epoch;change_epoch;size_bytes" | gzip > $SNAPSHOT_FILE
T0=$(date +%s)
find $TGT_DIR -type f -exec stat --format '%n;%Y;%Z;%s' "{}" \; | gzip >> $SNAPSHOT_FILE
TOTAL=$(($(date +%s)-$T0))
echo "Generated snapshot of $TGT_DIR in $TOTAL seconds. Stored in $SNAPSHOT_FILE"
