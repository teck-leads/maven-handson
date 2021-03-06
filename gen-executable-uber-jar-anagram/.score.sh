#!/bin/sh
PASS=0

rm -f .output.txt > /dev/null;
mvn clean package | tee .output.txt > /dev/null;

TEST_1=$(grep -io -e "BUILD SUCCESS" -e "Tests run: 6, Failures: 0, Errors: 0, Skipped: 0" .output.txt | wc -l);
TEST_2=$(find target/*.jar 2>/dev/null | grep -i -e 'gen-executable-uber-jar-anagram.jar' -e 'original-gen-executable-uber-jar-anagram.jar' 2>/dev/null| wc -l);

test2=$( ( echo 'i am lord voldemort'; echo 'tom marvolo riddle' ) | java -jar target/gen-executable-uber-jar-anagram.jar 2>/dev/null );
TEST_3=$(echo $test2 | grep -io -e 'Wanna check if your strings are anagrams???' -e 'Enter String1' -e 'Enter String2' -e 'Whoa!!!!\s*i am lord voldemort is a perfect anagram of tom marvolo riddle' | wc -l);

test3=$( ( echo 'I am an Anagram note'; echo 'I am not an Anagram' ) | java -jar target/gen-executable-uber-jar-anagram.jar 2>/dev/null);
TEST_4=$(echo $test3 | grep -io -e 'Wanna check if your strings are anagrams???' -e 'Enter String1' -e 'Enter String2' -e 'Oh no!!!\s*I am an Anagram note and I am not an Anagram do not match up to be Anagrams' | wc -l);

TEST_5=$(grep -io -e "junit" -e "gen-executable-uber-jar-anagram" -e "com.techleasds.app.GenExecutableUberJarAnagramApplication" -e "maven-shade-plugin" -e "<mainClass>" pom.xml | wc -l);
TEST_6=$(grep -io -e "<Build-Number>" -e "10" -e "<manifestEntries>" -e "<Main-Class>" pom.xml | wc -l);

cd target;
if [ -f gen-executable-uber-jar-anagram.jar ] 
then 
	jar xvf gen-executable-uber-jar-anagram.jar META-INF/MANIFEST.MF 2 > /dev/null;	
	TEST_7=$(cat META-INF/MANIFEST.MF | grep -io -e "Main-Class: com.techleasds.app.GenExecutableUberJarAnagramApplication" -e "Build-Number: 10" | wc -l);
else
	TEST_7=0;
fi;	

if [ "$TEST_1" -gt 1 ]
then PASS=$((PASS + 2))
fi;
if [ "$TEST_2" -eq 2 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_3" -eq 4 ]
then PASS=$((PASS + 2))
fi;
if [ "$TEST_4" -eq 4 ]
then PASS=$((PASS + 2))
fi;
if [ "$TEST_5" -gt 4 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_6" -gt 3 ]
then PASS=$((PASS + 1))
fi;
if [ "$TEST_7" -eq 2 ]
then PASS=$((PASS + 1))
fi;



FAIL=$((10-$PASS))

echo "Test cases executed = 10";
echo "PASS = $PASS   FAIL=$FAIL" 
