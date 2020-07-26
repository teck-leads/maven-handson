#!/bin/sh
pass=0
fail=0
mvn exec:java | tee .output.txt
TEST_1=$(grep -io -e "maven-compiler-plugin" -e "exec-maven-plugin" -e "com.techleasds.app.MavenExecPluginFibonaciiApplication" pom.xml | wc -l)
TEST_2=$(grep -io "BUILD SUCCESS" .output.txt | wc -l)
TEST_3=$(grep -io -e "0,2,3,5,13" -e "23" .output.txt | wc -l)

if [ "$TEST_1" -ge 3 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_2" -eq 1 ]
then ((pass++))
else
    ((fail++))
fi;
if [ "$TEST_3" -eq 2 ]
then ((pass++))
else
    ((fail++))
fi;
echo "Total testcase: 3"
echo "Total testcase passed:" $pass
echo "Total testcase fail:" $fail
echo "total score:" $((($pass*100)/3))