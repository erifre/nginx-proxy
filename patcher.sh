#!/bin/sh
for i in ./patches/*.patch; do
  echo "Applying patch ${i}"
  patch -p1 < $i
done
