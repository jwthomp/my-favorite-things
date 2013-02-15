#!/bin/bash


# Create run script and make it executable
echo "#!/bin/bash

clear ; ./setenv.sh go install $1 ; if [ \$? -eq 0 ]; then ./bin/$1; fi" > ./run
chmod +x ./run

# Create setenv.sh script and make it executable
echo "#!/bin/bash

export GOPATH=`pwd`
mkdir bin >& /dev/null
mkdir pkg >& /dev/null

eval \$@" > ./setenv.sh
chmod +x ./setenv.sh


# Make src directory and project directory
#mkdir src
mkdir -p src/$1

# Create hello world folder
echo "package main

import (
  \"log\"
)

func main() {
  log.Printf(\"Hello world\n\");
}" > ./src/$1/$1.go
