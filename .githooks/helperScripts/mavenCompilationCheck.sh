MAVEN_COMPILATION_LOG=$(mvn test-compile)
echo "$MAVEN_COMPILATION_LOG" > target/MAVEN_COMPILATION_LOG.txt
cat target/MAVEN_COMPILATION_LOG.txt