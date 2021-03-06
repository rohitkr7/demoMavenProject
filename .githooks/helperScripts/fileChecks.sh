# ----------------- Logic for gathering the list of files modified -----------------
# command to get list of files which are modified
clear
str=$(git diff --name-only $(git merge-base master HEAD) & git ls-files --others --exclude-standard)
echo 'List of modified files: ---------------------------------------------------------------->> '
separator=" "
modifiedFilesList=(${str//${separator}/ })
for mf in "${modifiedFilesList[@]}"
do
    printf "$mf\n"
done
printf "\n------------------------------------------------------------------------------------\n"

# ----------------- Filter out files as per their extension and run checks -----------------
################## JAVA ##################
# Rule - 1: Methods of the Test class should be declared as private.
PREV_IFS=$IFS
IFS=$'\n'

echo 'Scanning through all the Modified Java files: --------------------------------------------------->> '
echo 'Rule - 1: Methods of the Test class should be declared as private ===>>\n'
for mf in "${modifiedFilesList[@]}"
do
    prevLineWasDash=true
    prevLineAnnotationPresent=false
    # check if file exists and extension is java
    if [[ -f "$mf" && "$mf" == *IT\.java ]];
    then
        #printf "$mf\n"
        # Read the file content in a variable and print
        #value=`cat $mf`
        #echo "$value"
        IFS=$'\n'
        # grep -nB 1 "public.*[\(]" "$mf"

        # Find matching lines in the file using grep command and a pattern
        methodLists=($(grep -nB 1 "public.*[\(]" "$mf"))

        for mLine in ${methodLists[@]}
        do
            #printf $mLine
            if [[ $mLine == '--'* ]];
            then
                prevLineWasDash=true
                prevLineAnnotationPresent=false
                continue
            fi
            if [[ $prevLineWasDash == true ]]
            then
                #printf 'inside prevLineWasDash == false block\n'
                if [[ $mLine == *'@Test'* || $mLine == *'@Step'* || $mLine == *'@Before'* || $mLine == *'@BeforeClass'* || $mLine == *'@After'* || $mLine == *'@AfterClass'* ]];
                then
                    #printf "line starts with @Test\n"
                    prevLineAnnotationPresent=true
                else
                    #printf "line does not starts with @Test\n"
                    prevLineAnnotationPresent=false
                fi
                prevLineWasDash=false
                continue
            fi
            if [[ $prevLineWasDash == false && $prevLineAnnotationPresent == false ]];
            then
                printf "[WARNING] File: $mf >> $mLine ***** please update to private access modifier instead of public *****\n"
            fi
        done
        printf "\n------------------------------------------------------------------------------------\n"
    fi
done
printf "\n------------------------------------------------------------------------------------\n"

# ------------------------------------------------------------------------------------ #
# Rule - 4: Story number, Defect number, Testcase id should be mentioned
printf 'Rule - 4: Story number, Defect number, Testcase id should be mentioned ===>> \n\n'
for mf in "${modifiedFilesList[@]}"
do
    # check if file exists and extension is java
    if [[  -f "$mf" && "$mf" == *IT\.java ]];
    then
        if ! grep -q "@Story(\|@TestCase(\|@Defect(" "$mf"
        then
            echo '[WARNING] @Story/@TestCase/@Defect not found in '$mf
        fi
    fi
done
printf "\n------------------------------------------------------------------------------------\n"

# Rule - 8: If Java file has Test Method then the file name should end with *IT.java or *UIIT.java pattern
printf 'Rule - 8: Test Java file name checks ====>\n\n'
for mf in "${modifiedFilesList[@]}"
do
    # check if file exists and extension is java
    if [[  -f "$mf" && ( "$mf" != *IT\.java ) && ( "$mf" == *java) ]];
    then
        # printf 'file with no IT\ >> '$mf'\n'
        if grep -q "@Story(\|@TestCase(\|@Defect(\|@Test\|@Step" "$mf"
        then
            echo '[WARNING] @Story/@TestCase/@Defect/@Test/@Step found in '$mf' but file name does not end with IT or UIIT\n'
        fi
    fi
done
printf "\n------------------------------------------------------------------------------------\n"

# Rule - 7: Constants should be upper case
printf 'Rule - 7: Constants Variable Name Check ====>\n\n'
for mf in "${modifiedFilesList[@]}"
do
    noWarningsFlag=true
    # check if file exists and extension is java
    if [[  -f "$mf" && "$mf" == *java ]];
    then
        #printf 'Constants Check - Scanning File: '$mf
        constantVariablesList=($(grep -n ".*final.*[\=]" "$mf"))

        for mLine in ${constantVariablesList[@]}
        do
            # printf "final constant: "$mLine
            IFS=$'='
            read -ra arrStr <<< "$mLine"
            beforeEqualSign=${arrStr[0]}
            #printf  'beforeEqualSign = '$beforeEqualSign'\n'
            IFS=$' '
            read -ra arrStr <<< "$beforeEqualSign"
            variableName=${arrStr[${#arrStr[@]}-1]}
            #printf 'variableName== '$variableName
            upperCaseValue=$(echo $variableName | tr '[:lower:]' '[:upper:]')
            if [[ ! $variableName == $upperCaseValue ]]
            then
                noWarningsFlag=false
                printf "[WARNING] Please use uppercase constant names: ==>> "$variableName' <<== in the file:'$mf'\n'
            fi
            IFS=$'\n'
        done
    fi

done
printf "\n------------------------------------------------------------------------------------\n"

# Grep Method Names, which has underscore in its name >>
# grep -n ".*_.*[\{]" src/test/java/DevOpsDemo/CalculatorTestIT.java


# Grep variable Names, which has underscore in its name >>
# grep -n ".*_.*[\{]" src/test/java/DevOpsDemo/CalculatorTestIT.java

# Rule - 5: Camel case variable naming standards
printf 'Rule - 5 & 6: Camel case variable/method naming standards ====>\n\n'
for mf in "${modifiedFilesList[@]}"
do
    noWarningsFlag=true
    # check if file exists and extension is java
    if [[  -f "$mf" && "$mf" == *java ]];
    then
        # grep all variable names which contains underscores
        variableNames=($(grep -n ".*[_].*=.*[\;]" "$mf" | grep -v ".*final.*" | grep -v ".*==.*"))

        for mLine in ${variableNames[@]}
        do
            printf "[WARNING] Use camelCase variable Names without undescores: ==>> "$mLine' <<== in the file:'$mf'\n'
        done

        methodNames=($(grep -n ".*_.*{" "$mf"))
        for mLine in ${methodNames[@]}
        do
            printf "[WARNING] Use camelCase method Names without undescores: ==>> "$mLine' <<== in the file:'$mf'\n'
        done

        printf "\n"
    fi

done






IFS=$PREV_IFS