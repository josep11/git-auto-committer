#!/bin/bash

echo e >> dummy_file/file.txt
git add .
git ci -m "updated data"
git push
