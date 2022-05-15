# ----------------- Logic for gathering the list of files modified -----------------
# command to get list of files which are modified
str=$(git diff --name-only $(git merge-base master HEAD))
echo 'List of modified files: ------------------>> '
separator=" "
modifiedFilesList=(${str//${separator}/ })
for mf in "${modifiedFilesList[@]}"
do
    printf "$mf\n"
done
printf "\n------------------------------------------\n"

# command to get list of files which are untracked
str1=$(git ls-files --others --exclude-standard)
echo 'List of untracked files: ------------------>> '
untrackedFilesList=(${str1//${separator}/ })
for utf in "${untrackedFilesList[@]}"
do
    printf "$utf\n"
done
printf "\n------------------------------------------\n"

# command to get list of staged files
str3=$(git diff --name-only --cached)
echo 'List of stagged files: ------>> '
stagedFilesList=(${str3//${separator}/ })
for stg in "${stagedFilesList[@]}"
do
    printf "$stg\n"
done