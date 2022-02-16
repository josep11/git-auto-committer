#!/bin/bash

echo const a = 5; >> dummy_file/example.js
git add .
git ci -m "updated data"
git push
