src='src'
def_ver='0.1'
# there are some dependencies between scala versions
# and libraries which built on it
def_scala_ver='2.10.4'
def_scalatest_artifact='scalatest_2.10'
def_scalatest_ver='2.1.7'

PWD=$(pwd)
touch build.sbt
mkdir -p $PWD/$src/main/scala
mkdir -p $PWD/$src/test/scala
mkdir $PWD/project

echo "name:"
read PRJ_NAME
echo "name := \"$PRJ_NAME\"" > $PWD/build.sbt
echo "" >> $PWD/build.sbt
echo "Version(default:$def_ver):"
read VER

if [ -z "$VER" ]
then
    VER="$def_ver"
fi

echo "version := \"$VER\"" >> $PWD/build.sbt
echo "" >> $PWD/build.sbt

echo "Scala version(default:$def_scala_ver)"
read SCALA_VER
if [ -z "$SCALA_VER" ]
then
    SCALA_VER=$def_scala_ver
fi
echo "scalaVersion := \"$SCALA_VER\"" >> $PWD/build.sbt
echo "" >> $PWD/build.sbt

echo "libraryDependencies += \"org.scalatest\" % \"$def_scalatest_artifact\" % \"$def_scalatest_ver\" % \"test\"" >> $PWD/build.sbt
echo "" >> $PWD/build.sbt

SCRIPT_DIR="`dirname \"$0\"`"
if [ -L $0 ]
then
    SCRIPT_DIR=$( dirname $( readlink $0 ) )
fi
cp $SCRIPT_DIR/README.MD .
cp $SCRIPT_DIR/Hello.scala $PWD/src/main/scala/
cp $SCRIPT_DIR/HelloTest.scala $PWD/src/test/scala/

