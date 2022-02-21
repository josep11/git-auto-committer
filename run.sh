#!/bin/bash

rnd=$[ $RANDOM % 40 + 10 ]
echo "const a = $rnd;" >> dummy_file/example.js
git add .
git ci -m "updated data"
git push
