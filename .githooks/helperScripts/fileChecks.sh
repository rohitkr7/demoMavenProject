# command to get list of files which are modified
str=$(git diff --name-only $(git merge-base hooksFeature HEAD))
echo 'List of modified files: ------------------>> '
separator=" "
arr=(${str//${separator}/ })
for mf in "${arr[@]}"
do
    printf "$mf\n"
done
printf "\n------------------------------------------\n"

# command to get list of files which are untracked
str1=$(git ls-files --others --exclude-standard)
echo 'List of untracked files: ------------------>> '
arr1=(${str1//${separator}/ })
for utf in "${arr1[@]}"
do
    printf "$utf\n"
done
printf "\n------------------------------------------\n"

# command to get list of files which are either untracked or modified
str2=$(git ls-files --modified --others --exclude-standard)
echo 'List of untracked or modified files: ------>> '
arr2=(${str2//${separator}/ })
for utmf in "${arr2[@]}"
do
    printf "$utmf\n"
done
printf "\n------------------------------------------\n"

# command to get list of staged files
str3=$(git diff --name-only --cached)
echo 'List of staged files: ------>> '
arr3=(${str3//${separator}/ })
for stg in "${arr3[@]}"
do
    printf "$stg\n"
done
