if [[ "$PREFIX" == "" ]]; then
  PREFIX="/usr"
fi

VERSION=$(python3 -c 'import sys;print(sys.version.split(" ")[0].rsplit(".",1)[0])')
FILE_NAME="TSM"

if ! [ -f "./bin/$FILE_NAME" ];  then
  mkdir bin 2> /dev/null
  gcc -Os -I $PREFIX/include/python$VERSION -o bin/$FILE_NAME $FILE_NAME.c -lpython$VERSION -lpthread -lm -lutil -ldl
fi

./bin/$FILE_NAME