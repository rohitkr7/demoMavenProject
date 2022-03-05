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
		mvn test-compile

install_hooks:
		echo "Running install_hooks.sh"
		./install_hooks.sh

change_hooks_config:
		echo "Modifying git hook config"
		echo "git config core.hooksPath .githooks"
		git config core.hooksPath .githooks