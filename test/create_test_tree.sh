#!/usr/bin/env bash

# creates the following tree:
#a/
#├── b
#│   ├── 1.wav
#│   └── 1.xml
#├── c
#│   ├── 2.wav
#│   ├── 2.xml
#│   ├── 3.wav
#│   └── 3.xml
#└── e
#    ├── 4.wav
#    └── 4.xml

mkdir -p {a/b,a/c,a/e}
for file in a/b/1.xml a/b/1.wav a/c/2.xml a/c/2.wav a/c/3.xml a/c/3.wav a/e/4.xml a/e/4.wav ;do
  echo 'some content' > $file
done
