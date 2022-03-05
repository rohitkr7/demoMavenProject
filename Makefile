all: say_hello build_project
# all: say_hello generate clean
# Note - First Line of the make file is always the default goal/target 
# so, it gets executed everytime
say_hello:
		echo "Hello World"

generate:
		@echo "Creating empty text files..."
		touch file-{1..10}.txt

clean:
		sleep 2
		@echo "Cleaning up..."
		rm *.txt

build_project:
		echo "Building the maven project"
		mvn clean verify -Dmaven.test.skip=true