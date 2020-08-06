#!/bin/sh
PASS=0

mvn clean > /dev/null;
TEST_1=$(mvn post-site | grep -io "BUILD SUCCESS" | wc -l);
TEST_2=$(mvn post-site | grep -i "echo" | grep -io -e "pre-site phase" -e "site phase" -e "post-site phase" -e "Artifact ID\s*:\s*maven-lifecycle-site" | wc -l);
TEST_3=$(grep -io -e "org.apache.maven.plugins" -e "maven-antrun-plugin" pom.xml | wc -l);
TEST_4=$(grep -io -e "pre-site" -e "site" -e "post-site" -e "site-deploy" pom.xml | wc -l);
TEST_5=$(grep -io -e "<goal>" -e "run" -e "<configuration>" -e "<tasks>" -e "<echo>" pom.xml | wc -l);
TEST_6=$(grep -i "$" pom.xml | grep -i "project.artifactId" | wc -l);



echo "TEST_1=$TEST_1";
echo "TEST_2=$TEST_2";
echo "TEST_3=$TEST_3";
echo "TEST_4=$TEST_4";
echo "TEST_5=$TEST_5";
echo "TEST_6=$TEST_6";

if [ "$TEST_1" -eq 1 ]
then PASS=$((PASS + 10))
fi;
if [ "$TEST_2" -eq 6 ]
then PASS=$((PASS + 60))
fi;
if [ "$TEST_3" -gt 1 ]
then PASS=$((PASS + 5))
fi;
if [ "$TEST_4" -gt 2 ]
then PASS=$((PASS + 10))
fi;
if [ "$TEST_5" -gt 4 ]
then PASS=$((PASS + 5))
fi;
if [ "$TEST_6" -gt 3 ]
then PASS=$((PASS + 10))
fi;

echo "FS_SCORE:$PASS%" 