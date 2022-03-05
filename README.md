# Demo Maven Project with Git-Hooks

<!-- <img src="https://ai.github.io/size-limit/logo.svg" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="120" height="178"> -->

This project contains a Maven project with tests. Git-Hooks are configured and being version controlled.

### Version controlled git-hooks:
* ProjectDirectory/.githooks
    * pre-commit
    ```sh
    CWD=`pwd`
    # Move to the project directory which you want to build
    # cd glide-template
    # Build the maven  project
    mvn clean verify -Dmaven.test.skip=true
    if [ $? -ne 0 ]; then
    cd $CWD
    exit 1
    fi
    cd $CWD
    ```
    * prepare-commit-msg
    ```sh
    #Prepends commit message with STRY, DEF, BAK tickets or MAINT

    COMMIT_MSG_FILE=$1
    COMMIT_SOURCE=$2
    SHA1=$3

    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ $CURRENT_BRANCH == "HEAD" ]
    then
        exit 0;
    fi

    PREFIX_REGEX="((DEF|BAK|STRY|MAINT|def|bak|stry|maint)[0-9]*)"
    if [[ $CURRENT_BRANCH =~ $PREFIX_REGEX ]]
    then
        TICKET="${BASH_REMATCH[0]}"
        COMMIT_MESSAGE=$(cat $COMMIT_MSG_FILE)
        
        if [[ $COMMIT_MESSAGE =~ $TICKET ]]
        then
            exit 0;
        fi

        echo "${TICKET}: ${COMMIT_MESSAGE}" > $COMMIT_MSG_FILE
        echo "Ticket '${TICKET}', matched in current branch name, prepended to commit message."
    fi
    ```
### Master git-hooks installer:
* ProjectDirectory/install_hooks.sh
    ```sh
    #Installs the hooks into your githooks directory

    printf "This script will copy the following hooks to your .git/hooks directory:\n\n"
    for hook in $(ls .githooks)
    do
    echo $hook
    done
    printf "\n\n"
    read -r -p "Please enter Y to continue: " RESPONSE

    if [[ "$RESPONSE" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        cd .githooks
        for hook in $(ls)
        do
            cp $hook ../.git/hooks
        done
        cd ..
    fi

    echo "Hooks installed successfully"
    ```

### Makefile for setups:
* makefile
    ```Makefile
    all: say_hello change_hooks_config
    # all: say_hello generate_textfiles clean_textfiles
    # Note - First Line of the make file is always the default goal/target 
    # so, it gets executed everytime
    say_hello:
            echo "Hello World"

    generate_textfiles:
            @echo "Creating empty text files..."
            touch file-{1..10}.txt

    clean_textfiles:
            sleep 2
            @echo "Cleaning up..."
            rm *.txt

    build_project:
            echo "Building the maven project"
            mvn clean verify -Dmaven.test.skip=true

    install_hooks:
            echo "Running install_hooks.sh"
            ./install_hooks.sh

    change_hooks_config:
            echo "Modifying git hook config"
            git config core.hooksPath .githooks
    ``` 

<!-- <p align="center">
  <img src="./img/why.png" alt="Statoscope example" width="650">
</p>

<p align="center">
  <a href="https://evilmartians.com/?utm_source=size-limit">
    <img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg"
         alt="Sponsored by Evil Martians" width="236" height="54">
  </a>
</p> -->


<!-- * [MobX](https://github.com/mobxjs/mobx) -->


## How It Works

1. This project contains a hidden directory `.githooks` under which there are two git-hooks (a). `pre-commit` and (b). `prepare-commit-msg`
2. Inside the project directory we have a shell script file `install_hooks.sh` which actually installs (or basically copies the .githooks/ files to the `.git/hooks` directory)
3. There is a `Makefile` inside the project directory which is an easy to go step to do all the githooks setups in just one signle shot command which is `make`.

* make file will first of all run ./install_hooks.sh or just set the `git config core.hooksPath`.
* <b>pre-commit</b> has the code to build the project using maven comamnd `mvn clean verify -Dmaven.test.skip=true`
* <b>prepare-commit-msg</b> has code to update commit message according to the branch name. If the branch name contains any defect, story or testcase number in that case the same will be appended to the start of the commit message also.

<!-- <details><summary><b>Show instructions</b></summary>

1. Setup:

    ```sh
    $make
    ``` 
</details>
-->


### Setup
* Fire Below command
    ```sh
    make
    ```
   
