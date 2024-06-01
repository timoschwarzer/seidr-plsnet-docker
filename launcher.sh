#!/usr/bin/env bash

set -e

CHECKPOINT_ARG="--save-resume"

if [[ -f /app/output/"$3".checkpoint ]]; then
  echo "Found checkpoint, resuming from there…"
  CHECKPOINT_ARG="--resume-from"
else
  echo "No checkpoint found. Starting over…"
fi

/app/bin/plsnet \
  -i /app/input/"$1" \
  -g /app/input/"$2" \
  -o /app/output/"$3" \
  $CHECKPOINT_ARG /app/output/"$3".checkpoint \
  -v 3 \
  -O "${4:-$(nproc)}"
