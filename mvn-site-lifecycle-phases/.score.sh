#!/bin/sh
PASS=0
FAIL=0

mvn clean > /dev/null;
TEST_1=$(mvn post-site | grep -io "BUILD SUCCESS" | wc -l);
TEST_2=$(mvn post-site | grep -i "echo" | grep -io -e "pre-site phase" -e "site phase" -e "post-site phase" -e "Artifact ID\s*:\s*maven-lifecycle-site" | wc -l);
TEST_3=$(grep -io -e "org.apache.maven.plugins" -e "maven-antrun-plugin" pom.xml | wc -l);
TEST_4=$(grep -io -e "pre-site" -e "site" -e "post-site" -e "site-deploy" pom.xml | wc -l);
TEST_5=$(grep -io -e "<goal>" -e "run" -e "<configuration>" -e "<tasks>" -e "<echo>" pom.xml | wc -l);
TEST_6=$(grep -i "$" pom.xml | grep -i "project.artifactId" | wc -l);


if [ "$TEST_1" -eq 1 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_2" -eq 6 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_3" -gt 1 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_4" -gt 2 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_5" -gt 4 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_6" -gt 3 ]
then PASS=$((PASS + 1))
fi;
FAIL=$((6-$PASS))

echo "Test cases executed = 6";
echo "PASS = $PASS   FAIL=$FAIL" 