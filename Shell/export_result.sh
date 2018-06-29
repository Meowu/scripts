#!/bin/bash

list=( 8890 8891 8891 8893 8894 9005 9006 )

exec() {
  for num in ${list[*]} # same as list[@]
  do
    docker exec -it "vatic_$num" sh -c "cd root/vatic && turkic dump task -o data/result_$num.txt"
  done
}

for file in frames/*
do
  if [ -d $file ]
  then
    for text in `find ${file}/*.txt` # no need to prefix $file with 'data/' here because $file is absolute path
    do # what's the code when not found, and how to skip the not found error msg
      mv $text results
    done
  fi
done

enum() {
  while [[ i -lt ${#list[@]}]]
  do
    echo "while $i: ${list[i]}"
  let i++
  done
}