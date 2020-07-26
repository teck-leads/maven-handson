#!/bin/sh
SCORE=0
mvn exec:java | tee .output.txt
TEST_1=$(grep -io -e "maven-compiler-plugin" -e "exec-maven-plugin" -e "com.techleasds.app.MavenExecPluginFibonaciiApplication" pom.xml | wc -l)
TEST_2=$(grep -io "BUILD SUCCESS" .output.txt | wc -l)
TEST_3=$(grep -io -e "0,2,3,5,13" -e "23" .output.txt | wc -l)

if [ "$TEST_1" -ge 3 ]
then SCORE=$(($SCORE + 35))
fi;
if [ "$TEST_2" -eq 1 ]
then SCORE=$(($SCORE + 25))
fi;
if [ "$TEST_3" -eq 2 ]
then SCORE=$(($SCORE + 40))
fi;
echo "FS_SCORE:$SCORE%"   